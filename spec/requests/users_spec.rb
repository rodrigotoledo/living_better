require 'rails_helper'

# This spec was generated by rspec-rails when you ran the scaffold generator.
# It demonstrates how one might use RSpec to test the controller code that
# was generated by Rails when you ran the scaffold generator.
#
# It assumes that the implementation code is generated by the rails scaffold
# generator. If you are using any extension libraries to generate different
# controller code, this generated spec may or may not pass.
#
# It only uses APIs available in rails and/or rspec-rails. There are a number
# of tools you can use to make these specs even more expressive, but we're
# sticking to rails and rspec-rails APIs to keep things simple and stable.

RSpec.describe "/users", type: :request do

  # This should return the minimal set of attributes required to create a valid
  # User. As you add validations to User, be sure to
  # adjust the attributes here as well.
  let(:valid_attributes) {
    build(:user).attributes
  }

  let(:invalid_attributes) {
    {name: '', document: '', cns: '', email: '', birthday_at: '', phone: ''}
  }

  describe "GET /index" do
    it "renders a successful response" do
      create(:user)
      get users_url
      expect(response).to be_successful
    end
  end

  describe "GET /edit" do
    it "renders a successful response" do
      user = create(:user)
      get edit_user_url(user)
      expect(response).to be_successful
    end
  end

  describe "POST /create" do
    let(:photo){ Rack::Test::UploadedFile.new("#{Rails.root}/spec/files/photo.png") }
    context "with valid parameters" do
      it "creates a new User" do
        expect {
          post users_url, params: { user: valid_attributes.merge(photo: photo) }
        }.to change(User, :count).by(1)
      end

      it "redirects to the created user" do
        post users_url, params: { user: valid_attributes.merge(photo: photo) }
        expect(response).to redirect_to(users_url)
      end
    end

    context "with invalid parameters" do
      it "does not create a new User" do
        expect {
          post users_url, params: { user: invalid_attributes }
        }.to change(User, :count).by(0)
      end

      it "renders a successful response (i.e. to display the 'new' template)" do
        post users_url, params: { user: invalid_attributes }
        expect(response).to render_template(:index)
      end
    end
  end

  describe "PATCH /update" do
    context "with valid parameters" do
      let(:new_attributes) {
        attributes_for(:user)
      }
      let!(:user) {
        create(:user)
      }

      it "redirects to the user" do
        patch user_url(user), params: { user: new_attributes }
        user.reload
        expect(response).to redirect_to(users_url)
      end
    end

    context "with invalid parameters" do
      it "renders a successful response (i.e. to display the 'edit' template)" do
        user = create(:user)
        patch user_url(user), params: { user: invalid_attributes }
        expect(response).to render_template(:index)
      end
    end
  end
end
