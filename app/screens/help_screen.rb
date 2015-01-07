class HelpScreen < PM::TableScreen
  title "Help"

  def table_data
    [{
      title: "About",
      cells: [{
        title: "About app",
        action: :about
      }, {
        title: "More about app",
        action: :more_about
      }]
    }, {
      title: "Parse Login",
      cells: [{
        title: "Open Login",
        action: :open_parse
        }]
    },

     {
      title: "Help",
      cells: [{
        title: "Help me",
        action: :help
      }]
    }]
  end

  def open_parse
    @login =  TpLoginViewController.alloc.init
    @login.signUpController = TpSignUpViewController.alloc.init
    # @login.fields = PFLogInFieldsUsernameAndPassword | PFLogInFieldsLogInButton | PFLogInFieldsSignUpButton
    @login.delegate = self
    @login.signUpController.delegate = self
    open_modal (@login, animated:true)
  end

  def logInViewController(logIn, didLogInUser:user)
    PM.logger.debug "Successful log in!"
    ap user
    @login.dismissModalViewControllerAnimated(true)
  end

  def logInViewControllerDidCancelLogIn(logIn)
    ap [logIn, logIn.class, @login]
    PM.logger.debug "Login cancelled!???"
    @login.dismissModalViewControllerAnimated(true)
  end

  def about
    PM.logger.info "Tapped about"
  end

  def more_about
    PM.logger.info "Tapped more about"
  end

  def help
    PM.logger.info "Tapped help"
  end
end
