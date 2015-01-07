class StartScreen < PM::Screen



  def on_load
    display_login unless User.current_user
    @layout = StartLayout.new(root: self.view)
    @layout.build
    @my_button = @layout.get(:main_button)
    @my_button.on(:touch) {|butt| main_button_action}

  end


  def will_appear
    # # just before the view appears

  end

  def on_appear
    # just after the view appears

  end

  def main_button_action
    display_login
  end


  def display_login
    # while User.current_user.nil?
      @login = CustomLoginViewController.alloc.init
      @login.signUpController = CustomSignUpViewController.alloc.init
      # @login.fields = PFLogInFieldsUsernameAndPassword | PFLogInFieldsLogInButton | PFLogInFieldsSignUpButton
      @login.delegate = self
      @login.signUpController.delegate = self
      self.presentModalViewController(@login, animated:true)
    # end
    # PM.logger.warn "Now we have a user!"
    # self.dismissModalViewControllerAnimated(true)
  end

  def logInViewController(logIn, didLogInUser:user)
    PM.logger.debug "Successful log in!"
    ap user
    logIn.dismissModalViewControllerAnimated(true)
    App.alert "No we'd start onboarding!"
    open HomeScreen.new(nav_bar: true)
  end

  def logInViewControllerDidCancelLogIn(logIn)
    PM.logger.debug "Login canceled!"
    logIn.dismissModalViewControllerAnimated(true)
    App.alert "Ruh-roh"
  end

  def signUpViewController(signUp, didSignUpUser:user)
    PM.logger.debug "Successful signup!"
    logIn = signUp.parentModalViewController
    signUp.dismiss_modal
    logIn.dismiss_modal
    App.alert "Success! Now we'd start the onboarding process!"
    open HomeScreen.new(nav_bar: true)
  end

  def signUpViewControllerDidCancelSignUp(signUp)
    PM.logger.debug "Signup canceled!"
    signUp.dismissModalViewControllerAnimated(true)
    App.alert "Ruh-roh"
  end


  def signUpViewController(signUp, didFailToSignUpWithError: error)
    PM.logger.warn "Failure to sign up! Details below."
    ap error
  end



#  - (void)signUpViewController:(PFSignUpViewController *)signUpController didSignUpUser:(PFUser *)user {
#     self.dismissModalViewControllerAnimated(true)
# }

# - (void)signUpViewController:(PFSignUpViewController *)signUpController didFailToSignUpWithError:(NSError *)error {
#     NSLog("Failed to sign up...")
# }

# - (void)signUpViewControllerDidCancelSignUp:(PFSignUpViewController *)signUpController {
#     NSLog("User dismissed the signUpViewController")
# }

#  // Sent to the delegate when a PFUser is signed up.
# - (void)signUpViewController:(PFSignUpViewController *)signUpController didSignUpUser:(PFUser *)user {
#     [self dismissModalViewControllerAnimated:YES]; // Dismiss the PFSignUpViewController
# }

# // Sent to the delegate when the sign up attempt fails.
# - (void)signUpViewController:(PFSignUpViewController *)signUpController didFailToSignUpWithError:(NSError *)error {
#     NSLog(@"Failed to sign up...");
# }

# // Sent to the delegate when the sign up screen is dismissed.
# - (void)signUpViewControllerDidCancelSignUp:(PFSignUpViewController *)signUpController {
#     NSLog(@"User dismissed the signUpViewController");
# }





end