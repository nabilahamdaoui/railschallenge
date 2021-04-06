class User < ApplicationRecord
  audited only: :archived

  has_secure_password

  validates :email,
    presence: true,
    uniqueness: true

  after_update :do_after_update

  def do_after_update
    if self.saved_change_to_archived?
      # Send Notifications
      NotificationService.notify_users(I18n.t(self.archived ? 'notification.user.archived' : 'notification.user.unarchived', email: self.email))
    end
  end
end
