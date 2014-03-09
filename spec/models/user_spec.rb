require 'spec_helper'

describe User do
  describe 'Request reset password' do
    context "Confirmation token" do
      subject(:user) { create :user }
      it { expect(user.confirmation_token).to be_nil }

      it 'generate' do
        user.forgot_password!
        expect(user.confirmation_token).not_to be_nil
      end
    end
  end
end
