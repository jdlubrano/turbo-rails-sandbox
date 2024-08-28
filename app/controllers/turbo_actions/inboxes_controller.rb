class TurboActions::InboxesController < ApplicationController
  def index
    @inboxes = Inbox.order(:name)
  end

  def show
    @inbox = Inbox.find(params[:id])
  end

  def edit
  end

  def update
  end
end
