module NotificationsHelper
  def notification_form(notification)
    @visitor = notification.visitor
    @comment = nil
    @visitor_comment = notification.comment_id
    # notification.actionがfollowかlikeかcommentか
    case notification.action
    when "follow"
      tag.a(notification.visitor.name, style: "font-weight: bold;") + "があなたをフォローしました"
    when "like"
      tag.a(notification.visitor.name, style: "font-weight: bold;") + "が" + tag.a('あなたの投稿', style: "font-weight: bold;") + "にいいねしました"
    when "comment" then
      @comment = Comment.find_by(id: @visitor_comment)&.content
      tag.a(@visitor.name, style: "font-weight: bold;") + "が" + tag.a('あなたの投稿', style: "font-weight: bold;") + "にコメントしました"
    end
   end

  def unchecked_notifications
    @notifications = current_user.passive_notifications.where(checked: false)
 end
end
