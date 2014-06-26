require 'spec_helper'

describe Meeting do

  before :each do
    recreate! :user
    recreate! :meeting
  end

  describe 'Have comments' do
    subject(:meeting) { build :meeting }
    let(:user) { build :user }
    let(:comment_attrs) { attributes_for :comment, body: "Hello" }
    let(:comment) { meeting.comments.first }

    before :each do
      meeting.add_comment(user, comment_attrs)
    end

    context 'add a comment' do
      it {
        expect{ meeting.add_comment(user, comment_attrs) }.
          to change { meeting.comments.size }.from(1).to(2)
      }

      it { expect(comment.body).to eq("Hello") }
    end

    it 'remove a comment' do
      expect {
        meeting.delete_comment(comment)
      }.to change {
        meeting.comments.size }.from(1).to(0)
    end

  end

end
