require 'spec_helper'

describe User do

  describe '#admin?' do
    it 'should give me a true value if the role is admin' do
      user = User.new
      user.role = 'admin'
      expect(user.admin?).to be_true
    end

    it 'should give me a false value if the role is user' do
      user = User.new
      user.role = 'user'
      expect(user.admin?).to be_false
    end
  end
end