module DigestMailer
  class MailLogger
    
    def self.log(recipient, message, mailer_method, intended_sent_at)
      if(message.kind_of?(EmailDigest))
        message.email_messages.each do |email_message|
          EmailLog.create(:recipient_email => recipient, :email_message_id => email_message.id, 
                        :mailer_method => mailer_method, :intended_sent_at => intended_sent_at)
        end
      else
        EmailLog.create(:recipient_email => recipient, :email_message_id => message.id, 
                        :mailer_method => mailer_method, :intended_sent_at => intended_sent_at)
      end
    end
  end
end