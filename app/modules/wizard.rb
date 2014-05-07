module Wizard
  extend ActiveSupport::Concern

  WIZARD_DURATION = 2.days

  included do
    attr_writer :current_step
  end

  def next_state current_state, back, id
    self.current_step = current_state
    if valid?
      if back.present?
        previous_step
      elsif last_step?
        if all_valid?
          self.class.clear_wizard(id)
          self.current_step = nil
          self.save!
        end
      else
        next_step
      end
    end

    self.current_step
  end

  def current_step
    @current_step || steps.first
  end

  def steps
    # To be overridden with the list of steps for your wizard
    raise NotImplementedError
  end

  def current_index
    steps.index(current_step)
  end

  def next_step_name
    steps[current_index+1]
  end

  def next_step
    self.current_step = steps[current_index+1]
  end

  def previous_step
    self.current_step = steps[current_index-1]
  end

  def to_first_step id
    self.current_step = steps.first
    self.class.clear_wizard(id)
  end

  def first_step?
    current_step == steps.first
  end

  def last_step?
    current_step == steps.last
  end

  def all_valid?
    # validations must be added at the model level see validation of categories in
    # resume.rb for an example.

    steps.all? do |step|
      self.current_step = step
      valid?
    end
  end

  module ClassMethods
    def unfinished_object id
      val = if Rails.cache.read(id)
        Rails.cache.read(id)
      else
        {}
      end
    end

    def clear_wizard id
      Rails.cache.delete(id)
    end

    def save_unfinished_object id, object_hash
      Rails.cache.write(id, object_hash, expires_in: WIZARD_DURATION)
    end

    def progressWizard( object, id, back, object_hash )
      object_hash = {} unless object_hash

      object_hash = self.unfinished_object(id).merge( object_hash )
      # need to assign to obj.attributes for the object to be valid
      object.attributes = object_hash
      object_hash = object_hash.merge( { "current_step" => object.next_state( object_hash["current_step"], back, id ) } )

      if object.new_record?
        self.save_unfinished_object( id, object_hash )
      end
    end
  end
end
