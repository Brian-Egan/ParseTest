class CustomLoginViewController < PFLogInViewController


  def viewDidLoad
    super
    # self.view.backgroundColor = :blue.uicolor
    # self.logInView.logo = "Nav-Title.png".uiimage
     logo_view = UIImageView.alloc.initWithFrame([[49,148],[289,49]])
     logo_view.image = "Nav-Title.png".uiimage
    self.logInView.logo = logo_view
  end




end



class CustomSignUpViewController < PFSignUpViewController


  def viewDidLoad
    super
    # self.view.backgroundColor = :blue.uicolor
    # self.logInView.logo =
  end




end



# - (BOOL)signUpViewController:(PFSignUpViewController *)signUpController shouldBeginSignUp:(NSDictionary *)info {
#     BOOL informationComplete = true

#     for (id key in info) {
#         field = info.objectForKey(key)
#         if (!field || field.length == 0) {
#             informationComplete = false
#             break
#         }
#     }

#     if (!informationComplete) {
#         UIAlertView.alloc.initWithTitle("Missing Information", message:"Make sure you fill out all of the information!", delegate:nil, cancelButtonTitle:"ok", otherButtonTitles:nil).show
#     }

#     return informationComplete
# }