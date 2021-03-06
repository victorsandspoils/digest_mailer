module DigestMailer
  class MailDelayedJobScheduler
    def self.enqueue_message(email_message)
      email_message.delay.send_message
    end
    
    def self.enqueue_digest(email_digest)
      @pending_digest_jobs = [] if !@pending_digest_jobs
      @pending_digest_jobs << email_digest.delay(:run_at => email_digest.embargoed_until).send_message
    end
    
    def self.user_has_pending_digest?(user)
      (user.email_digests.where(:intended_sent_at => nil).count>0)
    end
    
    def self.get_pending_digest_for_user(user)
      user.email_digests.where(:intended_sent_at => nil).first
    end
  end
end

