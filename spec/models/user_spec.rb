require 'spec_helper'

describe User do

  before { @user = User.new(name: "Spencer Ryals", email: "spencerryals@gmail.com",
  							password: "foobar", password_confirmation: "foobar") }

  subject { @user }

  it { should respond_to(:name) }
  it { should respond_to(:email) }
  it { should respond_to(:password_digest) }
  it { should respond_to(:password) }
  it { should respond_to(:password_confirmation) }
  it { should respond_to(:authenticate) }

  it { should be_valid }

  describe "no name present" do
  	before { @user.name = " " }
  	it { should_not be_valid }
  end 

  describe "when email address taken" do
  	before do
  		user_dup = @user.dup 
  		user_dup.save
  	end 

  	it { should_not be_valid }
  end 

  describe "when password is not present" do
  	before do
  		@user.password = " "
  		@user.password_confirmation = " "
  	end 
  	it { should_not be_valid }
  end 

  describe "when password_confirmation doesn't match" do
  	before { @user.password_confirmation = " " }
  	it { should_not be_valid }
  end 

  describe "with a password that's too short" do
    before { @user.password = @user.password_confirmation = "a" * 5 }
    it { should be_invalid }
  end

  describe "return value of authenticate method" do
    before { @user.save }
    let(:found_user) { User.find_by(email: @user.email) }

    describe "with valid password" do
      it { should eq found_user.authenticate(@user.password) }
    end

    describe "with invalid password" do
      let(:user_for_invalid_password) { found_user.authenticate("invalid") }

      it { should_not eq user_for_invalid_password }
      specify { expect(user_for_invalid_password).to be_false }
    end
  end
end   