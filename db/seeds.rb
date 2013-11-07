puts "Seeding..."

Post.create(
  title: "A Sample Post",
  body: "This will be a simple post record."
)

Post.create(title: "A Second Sample Post", body: "This will be our second simple post record.")

puts "Complete!"