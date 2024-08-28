puts "Seeding Inboxes..."
inboxes = %w[Work Personal].map { |name| Inbox.create_or_find_by!(name: name) }

puts "Seeding Messages..."
1.upto(50) do |i|
  title = "Message #{i}"
  next if Message.where(title: title).exists?

  inbox = inboxes[i % inboxes.size]
  inbox.messages.create!(title: title, body: "This is the content of message ##{i}")
end
