class User
  include ParseModel::User

  def self.trial
    user = User.new
    user.username = "test#{rand(99)}"
    user.password = "password1"
    user.email = "test+#{rand(99)}@#{MY_ENV["email_domain"]}"
    return user
  end

  def self.existing
    user = User.new
    ["username","password","email"].each {|m| user.send("#{m}=", MY_ENV[m]) }
    return user
  end


  def self.sign_out
    # Shouldn't have to use this much
    PFUser.logOut
  end


  def self.getCurrent
    PFUser.currentUser
  end

  def sign_up
    self.signUpInBackgroundWithBlock(lambda do |success, error|
      puts "hey there"
      ap [success, error]
    end)
  end

  def self.log_me_in
    PFUser.logInWithUsernameInBackground(MY_ENV["username"], password: MY_ENV["password"], block: lambda do |success, error|
      puts "Logging in..."
      ap [success, error]
    end)

  end
end