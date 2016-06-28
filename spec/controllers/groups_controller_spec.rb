require 'rails_helper'

RSpec.describe GroupsController, type: :controller do

  describe 'GET #index' do
    let(:groups){ create_list(:group, 2) }
    before { get :index}

    it 'assigns a @groups list' do
      expect(assigns(:groups)).to eq groups
    end

    it 'renders index view' do
      expect(response).to render_template :index
    end
  end

  describe 'GET #show' do
    let(:group) { create(:group) }
    before { get :show, id: group }

    it 'assigns the requested group to @group' do
      expect(assigns(:group)).to eq group
    end

    it 'should render the show view' do
      expect(response).to render_template :show
    end
  end

  describe 'GET #new' do
    before { get :new }

    it 'assigns a new group to @group' do
      expect(assigns(:group)).to be_a_new(Group)
    end

    it 'should render the new view' do
      expect(response).to render_template :new
    end
  end

  describe 'POST #create' do
    context 'with valid information' do
      it 'saves the group in database' do
        expect {
          post :create, group: attributes_for(:group)
        }.to change(Group, :count).by(1)
      end

      it 'redirects to show view' do
        post :create, group: attributes_for(:group)
        expect(response).to redirect_to assigns(:group)
      end
    end

    context 'with invalid information' do
      it 'does not save the group' do
        expect {
          post :create, group: attributes_for(:invalid_group)
        }.to_not change(Group, :count)
      end

      it 're-renders new view' do
        post :create, group: attributes_for(:invalid_group)
        expect(response).to render_template :new
      end
    end
  end

  describe 'DELETE #destroy' do
    let!(:group) { create(:group) }

    it 'deletes group' do
      expect{ delete :destroy, id: group }.to change(Group, :count).by(-1)
    end

    it 'returns 200 status' do
      expect(response).to be_success
    end
  end
end
