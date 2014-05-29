require 'mandrill'

class UserMailer < ActionMailer::Base
  default from: "repairs@pineapplerepairs.com"

  def job (type, recipient, job, contractor = nil)
    mandrill = Mandrill::API.new ENV["MANDRILL_API_KEY"]

    template_name = "job-#{type}-#{recipient}"

    template_content = create_template_content(type, recipient, job, contractor)
    message = create_message(type, recipient, job, contractor)

    mandrill.messages.send_template(template_name, template_content, message)
  end

  private

  def create_template_content (type, recipient, job, contractor = nil)
    case recipient
    when "customer"

      case type
      when "created"
        return template_content = [
          {
            name: "customer_name",
            content: "#{job.name}"
          },
          {
            name: "model",
            content: "#{job.model}"
          }
        ]

      when "accepted"
        return template_content = [
          {
            name: "customer_name",
            content: "#{job.name}"
          },
          {
            name: "model",
            content: "#{job.model}"
          }
        ]
      end


    when "contractor"
      
      case type
      when "created"
        return template_content = [
          {
            name: "customer_name",
            content: "#{job.name}"
          },
          {
            name: "model",
            content: "#{job.model}"
          }
        ]

      when "accepted"
        return template_content = [
          {
            name: "customer_name",
            content: "#{job.name}"
          },
          {
            name: "model",
            content: "#{job.model}"
          }
        ]
      end
    end
  end

  def create_message (type, recipient, job, contractor = nil)
    case recipient
    
    when "customer"
      return message = {
        to: [
          {
            email: "#{job.email}",
            name: "#{job.name}",
            type: "to"
          }
        ]
      }

    when "contractor"
      case type
      when "created"
        # FIND ALL LOCAL CONTRACTORS
        @contractors = Contractor.where(location: job.location)
        message = { to: [] }

        @contractors.each do |contractor|
          message.to << {
            email: "#{contractor.email}",
            name: "#{contractor.name}",
            type: "to"
          }
        end

        return message

      when "accepted"

        return message = {
          to: [
            {
              email: "#{contractor.email}",
              name: "#{contractor.name}",
              type: "to"
            }
          ]
        }
      end
    end
  end

end
