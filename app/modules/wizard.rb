module Wizard
  extend ActiveSupport::Concern

  included do
    attr_writer :current_step
  end

  def next_state back
    if ( back.present? && !step?(0) )

      previous_step

    elsif last_step?

      if all_valid?
        self.current_step = nil
        self.save!
      end

    elsif valid?

      next_step

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

  def first_step?
    current_step == steps.first
  end

  def last_step?
    current_step == steps.last
  end

  def step? step_val
    current_step == steps[step_val]
  end

  def all_valid?
    # validations must be added at the model level see validation of categories in
    # job.rb for an example.

    steps.all? do |step|
      self.current_step = step
      valid?
    end
  end
end
