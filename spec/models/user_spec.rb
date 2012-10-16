require 'spec_helper'

describe User do
  before do
    @user = User.create :first_name => 'Carlo', :last_name => 'Stearns', :email => 'carlo.stearns@gmail.com', :password => 'Password1'
  end
  context "given a valid user" do    
    it "should save" do
      @user.valid?.should be_true
    end
  end
  context "given an invalid user" do
    it "should reject an invalid email format" do
      @user.update_column(:email, 'carlo.stearns@gmail')
      @user.valid?.should be_false
    end
    context "with an invalid password" do
      it "should reject a password under 7 characters" do
        @user.update_column(:password, 'Pass1')
        @user.valid?.should be_false
      end
      it "should reject a password without a number" do
        @user.update_column(:password, 'Password')
        @user.valid?.should be_false
      end
      it "should reject a password without an uppercase letter" do
        @user.update_column(:password, 'password1')
        @user.valid?.should be_false
      end
    end
  end
end
