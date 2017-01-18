module OrdersHelper
  def send_order_information_to_chatwork order
    ChatWork.api_key = Settings.chatwork.api_key
    name = ChatWork::Me.get["name"]
    account_id = ChatWork::Me.get["account_id"]
    message_body = "[To:#{account_id}] #{name}\n " + t(".a_user") + order.user_name + t(".make_an_order") + order.total_money.to_s + t(".to") + order.shipping_address
    ChatWork::Message.create room_id: Settings.chatwork.room_id, body: message_body
  end
end
