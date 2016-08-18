FactoryGirl.define do
  factory :bug do
    ticket_number "#{Faker::Hacker.abbreviation}-#{1000 + Random.rand(999)}"
    priority 4
    likelyhood 3
    bug_type 2
    max_score 2
  end

  factory :bug_with_invalid_ticket, parent: :bug do
    ticket_number nil
  end

  factory :bug_with_fixed_ticker_number, parent: :bug do
    ticket_number 'IAM-12345'
  end
end
