work_inbox = Inbox.create_or_find_by!(name: "Work")

if work_inbox.messages.none?
  1.upto(5) do |i|
    work_inbox.messages.create!(title: "Message #{i}", body: "This is the content of message ##{i}")
  end
end

personal_inbox = Inbox.create_or_find_by!(name: "Personal")
