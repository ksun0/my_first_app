# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)

Person.destroy_all

Person.create! [
	{ first_name: "Kevin", last_name: "Sun", age: 16, login: "ksun", pass: "pass" },
	{ first_name: "Tom", last_name: "Cherukuri", age: 18, login: "tcherukuri", pass: "ass" },
	{ first_name: "Andrew", last_name: "Wang", age: 15, login: "awang", pass: "s" },
]

Reviewer.destroy_all
Book.destroy_all

Book.create! [
	{ name: "Eloquent Ruby", author: "Russ Olsen" },
	{ name: "Beginning Ruby", author: "Peter Cooper" },
	{ name: "Metaprogramming Ruby 2", author: "Paolo Perrotta" },
	{ name: "Design Patterns in Ruby", author: "Russ Olsen" },
	{ name: "DSFOSDFOIJDSOIJSODIJFIODSJ", author: "SDFJSODIFJSIDOFJOSDIFJ" }
]

100.times { |index| Book.create! name: "Book#{index}", author: "Author#{index}" }

eloquent = Book.find_by name: "Eloquent Ruby"
eloquent.notes.create! [
	{ title: "Wow", note: "Great book to learn Ruby" },
	{ title: "Funny", note: "Doesn't put you to sleep" }
]

reviewers = Reviewer.create! [
	{ name: "Kevin", password: "abc123" },
	{ name: "Tom", password: "123abc" }
]

Book.all.each do |book|
	book.reviewer = reviewers.sample
	book.save!
end