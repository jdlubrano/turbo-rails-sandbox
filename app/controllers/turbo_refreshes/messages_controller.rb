class TurboRefreshes::MessagesController < ApplicationController
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

        redirect_to [:turbo_refreshes, @message.inbox]
      end

      format.turbo_stream do
        @inbox.broadcast_refresh
        render turbo_stream: turbo_stream.action(:refresh, "")
      end
    end
  end

private

  def permitted_params
    params.require(:message).permit(:read)
  end
end

