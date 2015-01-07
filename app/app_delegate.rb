class AppDelegate < PM::Delegate
  status_bar true, animation: :none










  def on_load(app, options)
    Parse.setApplicationId("QIUYd5UnX2KdkWN67LPsLcBAWcKu9lBfyUqu878I", clientKey:"MGDibkkbYALd1CYXIubkZCeSp5KLCFjzswBeEAmI")
    return true if RUBYMOTION_ENV == "test"
    # display_login unless PFUser.currentUser
    # open HomeScreen.new(nav_bar: true) if PFUser.currentUser

    open HomeScreen.new(nav_bar: true)
    # @logInViewController = PFLogInViewController.alloc.init
    # @logInViewController.delegate = self
    # @logInViewController.signUpController.delegate = self
    # open_modal @logInViewController

  end


  def set_up_environment_variables
    environment = Device.simulator? ? "development" : "production"
    MY_ENV.extract!(Device.simulator? ? "production" : "development")# Yes, this is reversed because we're extracting the OTHER environment from the variables hash
    MY_ENV[environment].each {|k,v| MY_ENV[k] = v}
    MY_ENV.extract!(environment)
    return MY_ENV
  end




  # def logInViewController(logIn, didLogInUser:user)
  #   PM.logger.debug "Successfully logged in"
  #   @logInViewController.dismissModalViewControllerAnimated(true)
  #   PM.logger.debug "Successfully logged in"
  #   ap user
  #   open HomeScreen.new(nav_bar: true)
  # end

  # def logInViewControllerDidCancelLogIn(logIn)
  #   @logInViewController.dismissModalViewControllerAnimated(true)
  # end

# func logInViewController(controller: PFLogInViewController, didLogInUser user: PFUser) -> Void {
#   self.dismissViewController(true, completion: nil)
# }

# func logInViewControllerDidCancelLogIn(controller: PFLogInViewController) -> Void {
#   self.dismisViewControllerAnimated(true, completion: nil)
# }

  # def display_login
  #   @login = PFLogInViewController.alloc.init
  #   @login.fields = PFLogInFieldsUsernameAndPassword | PFLogInFieldsLogInButton | PFLogInFieldsSignUpButton
  #   @login.delegate = self
  #   @login.signUpController.delegate = self
  #   self.presentModalViewController(@login, animated:true)
  # end

  # def logInViewController(logIn, didLogInUser:user)
  #   @login.dismissModalViewControllerAnimated(true)
  # end

end
