require 'rails_helper'

RSpec.describe Entry, type: :model do

  before(:each) do
    @user = User.create(
      email: "test-email@email.co.uk",
      password: "someSecurePasswordWithABunchOfRandomChars@!!",
    )
  end

  it "validates entry creation" do
    entry = Entry.new(
      url: "https://github.com/",
      username: "some_made_up_username",
      password: "some_made_up_password",
      user_id: @user.id
      )

    expect(entry).to_not be_valid
  end

  it "allows a user to create a valid entry" do
    entry = Entry.new(
      name: "GitHub",
      url: "https://github.com/",
      username: "some_made_up_username",
      password: "some_made_up_password",
      user_id: @user.id
    )

    expect(entry).to be_valid
  end

  it "validates the user entry a valid url" do
    entry_1 = Entry.new(
      name: "GitHub",
      url: "https://github.com/",
      username: "some_made_up_username",
      password: "some_made_up_password",
      user_id: @user.id
    )

    expect(entry_1).to be_valid

    entry_2 = Entry.new(
      name: "GitHub",
      url: "github.com",
      username: "some_made_up_username",
      password: "some_made_up_password",
      user_id: @user.id
    )

    expect(entry_2).to_not be_valid
  end
end