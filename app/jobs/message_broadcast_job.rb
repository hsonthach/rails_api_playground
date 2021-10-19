class MessageBroadcastJob < ApplicationJob
  queue_as :default

  def perform(message)
    serialized_data = ActiveModelSerializers::Adapter::Json.new(
      MessageSerializer.new(message)
    ).serializable_hash
    MessageChannel.broadcast_to message.conversation, serialized_data
  end
end
