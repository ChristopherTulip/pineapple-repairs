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
    # consistent across all messages
    template_content = [

      {
        name: "phone_number",
        content: "#{job.pretty_phone_number}"
      },
      {
        name: "model",
        content: "#{job.model.name}"
      },
      {
        name: "network",
        content: "#{job.network.name}"
      },
      {
        name: "problem",
        content: "#{job.problem.name}"
      }
    ]

    # specific requirements
    case recipient
    when "customer"
      template_content << {
        name: "customer_name",
        content: "#{job.name}"
      }

      case type
      when "created"


      when "accepted"

      when "created"

      end


    when "contractor"
      if contractor.present?
        template_content << {
          name: "contractor_name",
          content: "#{contractor.name}"
        }
      end
      case type
      when "created"
        template_content << {
          name: "job_link",
          content: "<a href='http://www.pineapplerepairs.ca/jobs/#{job.id}'>http://www.pineapplerepairs.ca/jobs/#{job.id}</a>"
        }

      when "accepted"

      end
    end

    return template_content
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
          if contractor.present?
            message[:to] << {
              email: "#{contractor.email}",
              name: "#{contractor.name}",
              type: "to"
            }
          end
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
