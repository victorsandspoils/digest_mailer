require_relative 'email_digest'
class EmailMessage < ActiveRecord::Base
    has_many :email_logs
    has_and_belongs_to_many :email_digests
    
    def to_plain_text_digest_fragment()
      "Sent at: #{self.intended_sent_at}\r\n"+
      "Subject: #{self.subject}\r\n"+
      "From: #{self.from_email}\r\n"+
      "\r\n#{self.body}\r\n"
    end
    
    def to_digest_fragment
      to_plain_text_digest_fragment
    end
end