class UserMailer < ActionMailer::Base
  default from: "customercare@mybank.com"

  def welcome_email(author)
    @author = author
    mail(to: @author.email, subject: "Welcome a Biblio")
  end
end
