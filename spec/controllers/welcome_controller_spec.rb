require 'rails_helper'

RSpec.describe WelcomeController, type: :controller do
  describe '#index' do
    before(:each) { get :index }

    describe 'render' do
      it { is_expected.to render_template :index }
    end
  end
end
