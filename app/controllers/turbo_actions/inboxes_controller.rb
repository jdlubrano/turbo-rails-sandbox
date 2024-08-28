class TurboActions::InboxesController < ApplicationController
  def index
    @inboxes = Inbox.order(:name)
  end

  def show
  end

  def edit
  end

  def update
  end
end
