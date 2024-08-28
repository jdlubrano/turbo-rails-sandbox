class TurboActions::MessagesController < ApplicationController
  def update
    @message = Message.find(params[:id])
    @inbox = @message.inbox
    @message.update(permitted_params)

    respond_to do |format|
      format.html do
        if @message.errors.empty?
          flash.notice = "Message #{@message.id} updated!"
        else
          flash.alert = "Message #{@message.id} could not be updated: #{@message.errors.full_messages.to_sentence}"
        end

        redirect_to [:turbo_actions, @message.inbox, turbo_enabled: false]
      end

      format.turbo_stream do
        @inbox.broadcast_update_to(@inbox, partial: "turbo_actions/inboxes/summary")

        render turbo_stream: [
          turbo_stream.replace([@inbox, :unread_messages], partial: "turbo_actions/inboxes/messages", locals: { inbox: @inbox, messages: @inbox.messages.unread, scope: :unread }),
          turbo_stream.replace([@inbox, :read_messages], partial: "turbo_actions/inboxes/messages", locals: { inbox: @inbox, messages: @inbox.messages.read, scope: :read })
        ]
      end
    end
  end

private

  def permitted_params
    params.require(:message).permit(:read)
  end
end
