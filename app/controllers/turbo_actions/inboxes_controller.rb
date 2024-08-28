class TurboActions::InboxesController < ApplicationController
  def index
    @inboxes = Inbox.order(:name)
  end

  def show
    @inbox = Inbox.find(params[:id])
    @messages_scope = params[:messages_scope].to_s == "read" ? :read : :unread
    @messages = @inbox.messages.ordered.public_send(@messages_scope)
  end

  def edit
  end

  def update
  end
end
