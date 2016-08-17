FactoryGirl.define do
  factory :bug do
    ticket_number "#{Faker::Hacker.abbreviation}-#{1000 + Random.rand(999)}"
  end

  factory :bug_with_invalid_ticket, class: :bug do
    ticket_number nil
  end
end
