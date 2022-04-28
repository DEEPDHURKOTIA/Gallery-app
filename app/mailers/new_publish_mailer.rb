class NewPublishMailer < ApplicationMailer

  # Subject can be set in your I18n file at config/locales/en.yml
  # with the following lookup:
  #
  #   en.new_publish_mailer.publish_mail.subject
  #
  def publish_mail(email)
    @greeting = email

    mail to: email, from: "Pardeep@bluebash.co"
  end
end
