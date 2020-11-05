require 'rails_helper'

RSpec.describe UsersController, type: :controller do
# new
# renders to the new_user_url
    describe 'get#new' do
        it 'renders our new user template' do
            get :new
            expect(response).to render_template(:new)
        end
    end

# create
    describe 'post#create' do
        let(:valid_params) { { user: { username: 'alan', password: 'appacademy'} } }
        let(:invalid_params) { { user: { username: 'niko', password: '12345'} } }

        let(:user) { User.find_by(username: 'alan') }

        context 'with valid params' do
            before :each do
                post :create, params: valid_params
            end

            it 'logs in the user' do
                expect(session[:session_token]).to eq(user.session_token)
            end

            it 'redirects to user\'s show page' do
                expect(response).to redirect_to(user_url(user))
            end
        end

        context 'with invalid params' do
            it 'renders the new template' do
                post :create, params: invalid_params
                expect(response).to render_template(:new)
            end
        end
    end

    describe "get#show" do
        let!(:walk) { User.create(username: 'walker', password: 'thisllwork') }

        context 'with valid user id' do
            it 'renders the show template' do
                get :show, params: { id: walk.id }
                expect(response).to render_template(:show)
            end
        end

        context 'with invalid user id' do
            it 'renders the the goals index' do
                get :show, params: { id: 424242424242 }
                expect(response).to redirect_to(goals_url)
            end
        end
    end
end
