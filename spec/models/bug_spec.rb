require 'rails_helper'

describe Bug, type: :model do
  let(:bug) { build(:bug) }
  describe '#ticket_number' do
    subject { bug.save }

    context 'correct data' do
      it { is_expected.to be_truthy }
    end

    context 'ticket number missing' do
      let(:bug) { build(:bug_with_invalid_ticket) }

      it { is_expected.to be_falsey }
    end

    context 'uniqueness' do
      let(:bug) { build(:bug_with_fixed_ticker_number) }
      let(:ticket_number) { 1234 }
      before do
        build(:bug_with_fixed_ticker_number).save
      end

      it { is_expected.to be_falsey }
    end
  end

  describe '#calculate_score' do
    let(:score) { (bug.priority + bug.bug_type + bug.likelyhood) * 100 / bug.max_score }
    subject { bug.calculate_score }

    it { is_expected.to eql score }
  end
end
