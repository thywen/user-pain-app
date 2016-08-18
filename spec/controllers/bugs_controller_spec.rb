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
end
