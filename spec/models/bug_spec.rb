require 'rails_helper'

RSpec.describe Bug, type: :model do
  describe '#ticket_number' do
    let(:bug) { Bug.new(ticket_number: ticket_number) }
    let(:ticket_number) { Faker::Lorem.word }
    subject { bug.save }

    context 'correct data' do
      it { is_expected.to be_truthy }
    end

    context 'ticket number missing' do
      let(:ticket_number) { nil }

      it { is_expected.to be_falsey }
    end

    context 'uniqueness' do
      before do
        Bug.new(ticket_number: ticket_number).save
      end

      it { is_expected.to be_falsey }
    end
  end
end
