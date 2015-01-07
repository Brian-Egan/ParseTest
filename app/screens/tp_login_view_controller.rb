class TpLoginViewController < PFLogInViewController


  def viewDidLoad
    super
    # self.view.backgroundColor = :blue.uicolor
    # self.logInView.logo = "Nav-Title.png".uiimage
     logo_view = UIImageView.alloc.initWithFrame([[49,148],[289,49]])
     logo_view.image = "Nav-Title.png".uiimage
    self.logInView.logo = logo_view
  end




end



class TpSignUpViewController < PFSignUpViewController


  def viewDidLoad
    super
    # self.view.backgroundColor = :blue.uicolor
    # self.logInView.logo =
  end




end