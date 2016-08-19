FactoryGirl.define do
  factory :bug do
    sequence(:ticket_number) { "#{Faker::Hacker.abbreviation}-#{1000 + Random.rand(999)}" }
    bug_title('This is a test ticket')
    priority Random.rand(5) + 1
    likelyhood Random.rand(5) + 1
    bug_type Random.rand(7) + 1
    max_score 22
  end

  factory :bug_with_invalid_ticket, parent: :bug do
    ticket_number nil
  end

  factory :bug_with_fixed_ticker_number, parent: :bug do
    ticket_number 'IAM-12345'
  end
end
