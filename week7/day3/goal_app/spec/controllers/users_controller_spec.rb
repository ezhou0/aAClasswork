require 'rails_helper'

RSpec.describe UsersController, type: :controller do
    describe "GET#new" do 
        it "renders the new users template" do
            get :new 
            expect(response).to be_success
            expect(response).to render_template(:new)
        end
    end

    describe "POST#create" do 
        let(:user_params) do 
            {
                user: {username: "Bob", 
                password: "123456"}
            }
        end 
        it "logs in the user" do 
            post :create, params: user_params
            user = User.find_by(username: "Bob")
            expect(session[:session_token]).to eq(user.session_token)
        end
        it "should redirect to the show page" do 
            post :create, params: user_params
            user = User.find_by(username: "Bob")
            expect(response).to redirect_to(user_url(user))
        end
    end
end
