require 'rails_helper'

RSpec.describe ApplicationController, type: :controller do
  let(:user) { FactoryGirl.create :user }

  describe '#current_user' do
    context 'when called on any controller' do
      before(:each) do
        allow_any_instance_of(
          ApplicationController
        ).to receive(:current_user).and_return(user)
      end
      it do
        expect(response.code).to eq '200'
      end
    end
  end

  describe '#authenticate' do
    before(:each) do
      allow_any_instance_of(
        ApplicationController
      ).to receive(:authenticate).and_return(true)
    end

    it do
      expect(response.code).to eq '200'
    end
  end

  describe '#token' do
    before(:each) do
      allow_any_instance_of(
        ApplicationController
      ).to receive(:token).and_return(true)
    end

    it do
      expect(response.code).to eq '200'
    end
  end
end
