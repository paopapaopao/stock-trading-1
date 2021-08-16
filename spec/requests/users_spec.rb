require 'rails_helper'

RSpec.describe 'Users', type: :request do
  subject { User.create(valid_attributes) }

  let :valid_attributes do
    {
      user_type: 'buyer',
      email: 'juan.dlc@example.com',
      password: 'password',
      first_name: 'juan',
      last_name: 'dela cruz'
    }
  end
  let :invalid_attributes do
    {
      user_type: '',
      email: '',
      password: '',
      first_name: '',
      last_name: ''
    }
  end
  let :edited_attributes do
    {
      user_type: 'broker',
      email: 'juan_dlc@example.com',
      password: 'drowssap',
      first_name: 'one',
      last_name: 'de la cruz'
    }
  end

  before(:each) { User.destroy_all }

  describe 'GET /index' do
    it do
      get users_path
      expect(response).to be_successful
      expect(response).to have_http_status :ok
      expect(response).to render_template :index
    end
  end

  describe 'GET /show' do
    it do
      get user_path(subject)
      expect(response).to be_successful
      expect(response).to have_http_status :ok
      expect(response).to render_template :show
    end
  end

  describe 'GET /new' do
    it do
      get new_user_path
      expect(response).to be_successful
      expect(response).to have_http_status :ok
      expect(response).to render_template :new
    end
  end

  describe 'GET /edit' do
    it do
      get edit_user_path(subject)
      expect(response).to be_successful
      expect(response).to have_http_status :ok
      expect(response).to render_template :edit
    end
  end

  describe 'POST /create' do
    context 'With invalid parameters' do
      it do
        post users_path, params: { user: invalid_attributes }
        expect(response).to be_successful
        expect(response).to have_http_status :ok
        expect{ response }.to change(User, :count).by 0
        expect(response).to render_template :new
      end
    end

    context 'With valid parameters' do
      it do
        post users_path, params: { user: valid_attributes }
        expect(response).to_not be_successful
        expect(response).to have_http_status :found
        expect{ response }.to change(User, :count).by 1
        expect(response).to redirect_to user_path(User.last)
      end
    end
  end

  describe 'PATCH /update' do
    context 'With invalid parameters' do
      it do
        patch user_path(subject), params: { user: invalid_attributes }
        expect(response).to be_successful
        expect(response).to have_http_status :ok
        expect(response).to render_template :edit
      end
    end

    context 'With valid parameters' do
      it do
        patch user_path(subject), params: { user: edited_attributes }
        expect(response).to_not be_successful
        expect(response).to have_http_status :found
        expect(response).to redirect_to user_path(subject)
      end
    end
  end

  describe 'DELETE /destroy' do
    it do
      delete user_path(subject)
      expect(response).to_not be_successful
      expect(response).to have_http_status :found
      expect{ response }.to change(User, :count).by -1
      expect(response).to redirect_to users_path
    end
  end
end
