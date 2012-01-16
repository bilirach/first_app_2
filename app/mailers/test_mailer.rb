class TestMailer < ActionMailer::Base
  default :from => "from@example.com"

  # Subject can be set in your I18n file at config/locales/en.yml
  # with the following lookup:
  #
  #   en.test_mailer.weekly.subject
  #
  def weekly(email)
    mail :to => email, :subject=> "Mysolution weekly"
  end
end
