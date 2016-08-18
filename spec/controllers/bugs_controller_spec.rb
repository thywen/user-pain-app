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

      it 'success' do
        expect(response).to be_success
      end

      it 'assign bug' do
        expect(assigns(:bug)).to eq bug
      end
    end

    context 'bug non existing' do
      it 'throws ActiveRecord::RecordNotFound' do
        expect { get :show, id: -1 }.to raise_exception ActiveRecord::RecordNotFound
      end
    end
  end

  describe '#create' do
    context 'when valid' do
      let(:bug_params) { attributes_for(:bug) }

      it 'creates article' do
        expect { post :create, bug: bug_params }.to change(Bug, :count).by(1)
      end

      it 'redirects to the new bug' do
        post :create, bug: bug_params
        expect(response).to redirect_to Bug.last
      end
    end

    context 'when invalid' do
      let(:bug_params) { attributes_for(:bug_with_invalid_ticket) }

      it 'does not create the article' do
        expect { post :create, bug: bug_params }.to_not change(Bug, :count)
      end

      it 're-renders the new method' do
        post :create, bug: bug_params
        expect(response).to render_template :new
      end
    end

    describe 'GET #new' do
      it 'assigns a new business to @business' do
        get :new
        expect(assigns(:bug)).to be_a_new(Bug)
      end
    end

    describe '#update' do
      let(:bug) { bugs[rand number_of_bugs] }
      let(:updated_bug) { Bug.find(bug.id) }

      before(:each) do
        patch :update, id: bug.id, bug: new_bug
      end

      context 'valid' do
        let(:new_bug) { attributes_for(:bug) }

        it 'updated the ticket_number' do
          expect(updated_bug.ticket_number).to eql new_bug[:ticket_number]
        end

        it 'kept the id' do
          expect(updated_bug.id).to eql bug.id
        end
      end

      context 'invalid' do
        let(:new_bug) { attributes_for(:bug_with_invalid_ticket) }

        it 'is not successful' do
          expect(response).to be_success
        end

        it 'does not update the ticket number' do
          expect(updated_bug.ticket_number).to eql bug.ticket_number
        end

        it 'kept the id' do
          expect(updated_bug.id).to eql bug.id
        end
      end
    end

    describe '#destroy' do
      context 'when requested user exists' do
        let(:bug) { bugs[rand number_of_bugs] }
        before(:each) { delete :destroy, id: bug.id }

        it 'removes user form DB' do
          expect(Bug.all).not_to include bug
          expect { bug.reload }.to raise_exception ActiveRecord::RecordNotFound
        end
      end

      context 'when requested user does not exists' do
        it 'throws ActiveRecord::RecordNotFound' do
          expect { delete :destroy, id: -1 }.to raise_exception ActiveRecord::RecordNotFound
        end
      end
    end
  end
end
