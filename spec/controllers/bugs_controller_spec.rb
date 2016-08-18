require 'rails_helper'

RSpec.describe BugsController, type: :controller do
  let(:number_of_bugs) { 5 }
  let(:bugs) { create_list(:bug, number_of_bugs) }
  describe '#index' do
    before(:each) { get :index }

    describe 'render' do
      it { is_expected.to render_template :index }
    end

    describe 'set bugs' do
      subject { assigns(:bugs) }

      it { is_expected.to match bugs }
    end

    describe 'response success' do
      subject { response }

      it { is_expected.to be_success }
    end
  end

  describe '#show' do
    context 'bug existing' do
      let(:bug) { bugs[rand number_of_bugs] }
      before(:each) { get :show, id: bug.id }

      describe 'success' do
        subject { response }

        it { is_expected.to be_success }
      end

      describe 'assign bug' do
        subject { assigns(:bug) }

        it { is_expected.to eq bug }
      end
    end

    context 'bug non existing' do
      it 'throws ActiveRecord::RecordNotFound' do
        expect { get :show, id: -1 }.to raise_exception ActiveRecord::RecordNotFound
      end
    end
  end
end
