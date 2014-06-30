require 'spec_helper'

describe Meeting do

  before :each do
    recreate! :user
    recreate! :meeting
  end

  subject(:meeting) { build :meeting }
  let(:user) { create :user }

  describe 'Have comments' do
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
      it { expect(comment.created_at).to_not be(nil) }
    end

    it 'remove a comment' do
      expect {
        meeting.delete_comment(comment)
      }.to change {
        meeting.comments.size }.from(1).to(0)
    end
  end

  describe 'Attendees' do
    it 'Add an attendee' do
      expect { meeting.add_attendee(user) }.
        to change { meeting.attendees.size }.from(0).to(1)
    end

    it "Delete an attendee" do
      meeting.add_attendee(user)
      expect { meeting.delete_attendee(user) }.
        to change { meeting.attendees.size }.from(1).to(0)
    end
  end
end
