class StartLayout < MK::Layout
  # include SweetKit::Styles
  # view :our_messages_table

  def layout
    root :background do
      add UIView, :main_section do
        add UIButton, :main_button
      end
      # @messages_table = add UITableView, :message_table
      # @our_messages_table ||= add UITableView, :message_table
      # add our_messages_table, :message_table
    end
  end


  def main_section_style
    background_color :blue.uicolor
    constraints do
      # top target.controller.topLayoutGuide
      top 65
      bottom 0
      # bottom target.controller.topLayoutGuide
      width Device.screen.width
    end


  end


  def main_button_style
    background_color :green.uicolor
    title "Push me"
    # action :main_button_action
    constraints do
      width 100
      height 100
      left 100
      top 300
    end


  end



end