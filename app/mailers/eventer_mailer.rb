class EventerMailer < ApplicationMailer
  def send_mail(mail_title,mail_content,group) #メソッドに対して引数を設定
    @group = group
    group_users = @group.users
    @mail_title = mail_title
    @mail_content = mail_content
    # binding.pry
    mail bcc: group_users.pluck(:email), subject: mail_title
  end
end