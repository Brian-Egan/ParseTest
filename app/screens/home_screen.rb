class HomeScreen < PM::Screen
  title "Home"

  def on_load
    display_login unless PFUser.currentUser

    set_nav_bar_button :right, title: "Help", action: :show_help
    @layout = HomeLayout.new(root: self.view)
    @msgs = messages_table
    @layout.our_messages_table = @msgs.view
    @layout.build
    @text_input = @layout.get(:top_input)
    set_up_text_field(@text_input)
    @table_data = @msgs.table_data

  end



  def display_login
    # @login = PFLogInViewController.alloc.init
    @login =  CustomLoginViewController.alloc.init
    @login.signUpController = CustomSignUpViewController.alloc.init
    # @login.fields = PFLogInFieldsUsernameAndPassword | PFLogInFieldsLogInButton | PFLogInFieldsSignUpButton
    @login.delegate = self
    @login.signUpController.delegate = self
    # open_modal (@login, animated:true)
    self.presentModalViewController(@login, animated:true)
  end

  # def logInViewControllerDidLogInUser(logIn, user)
  def logInViewController(logIn, didLogInUser:user)
    PM.logger.debug "Successful log in!"
    ap user
    logIn.dismissModalViewControllerAnimated(true)
  end

  def logInViewControllerDidCancelLogIn(logIn)
    PM.logger.debug "Login canceled!"
    logIn.dismissModalViewControllerAnimated(true)
  end



  def show_help
    open HelpScreen
  end

  def messages_table
    @results ||= begin
      res = MessagesTableScreen.new

      self.addChildViewController res
      res.parent_screen = self
      res
      # ap res.table_data
    end
  end


  # def table_data
  #  @tasks = ["hey dude-!", "other stuff-!"]
  # end


  def textFieldDidBeginEditing(textField)

  end

  def textFieldShouldReturn(textField)
    textField.resignFirstResponder
    textField.text = ""
    PM.logger.warn "Returned! #{textField}"
    @table_data = @msgs.table_data
    @msgs.add_message(@table_data, textField.text)
    # @layout.messages_table.add_message(textField.text)
  end



  def set_up_text_field(text_field)
    PM.logger.info "Our search field is #{text_field} and it's a #{text_field.class}"
    text_field.becomeFirstResponder
    text_field.clearButtonMode = true
    text_field.delegate = self
    text_field.accessibilityIdentifier = "textInput"
    text_field.placeholder = "Enter message"

    text_field.on :begin do |notification|  # <= you have to accept the notification in your block
      # p 'wait for it...!'
    end
    text_field.on :change do |notification|
      p text_field.text
      # @layout.results_table.search( search)
    end
    text_field.on :end do |notification|
      PM.logger.debug "END! #{notification}"
      # p 'done!'
    end
  end

end
