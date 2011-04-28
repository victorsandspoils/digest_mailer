require_relative 'non_user_recipient'
module DigestMailer
  class PendingDigestMessage
    attr_accessor :recipient, :messages, :intended_sent_at, :digest, :mailer_method
    
    def initialize(recipient, digest, intended_sent_at=Time.now, mailer_method='digest_message')
      self.recipient = recipient
      self.messages = digest.email_messages
      self.digest = digest
      self.intended_sent_at = intended_sent_at
      self.mailer_method = mailer_method
    end
    
      # send the message to the queue for delivery
      def send_message
        #Rails.logger.info("BODY::> #{self.message.body}")
        m = MailDispatcher.digest_message(recipient.email, self.digest)
        m.deliver if Rails.env!='test'
      end
  end
end