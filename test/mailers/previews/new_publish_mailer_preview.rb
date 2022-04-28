# Preview all emails at http://localhost:3000/rails/mailers/new_publish_mailer
class NewPublishMailerPreview < ActionMailer::Preview

  # Preview this email at http://localhost:3000/rails/mailers/new_publish_mailer/publish_mail
  def publish_mail
    NewPublishMailer.publish_mail
  end

end
