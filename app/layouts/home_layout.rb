class HomeLayout < MK::Layout
  # include SweetKit::Styles
  view :our_messages_table

  def layout
    root :background do
      add UIView, :top_section do
        add UITextField, :top_input
      end
      # @messages_table = add UITableView, :message_table
      # @our_messages_table ||= add UITableView, :message_table
      add our_messages_table, :message_table
    end
  end

  def top_section_style
    background_color :blue.uicolor
    constraints do
      height 50
      # top 65
      below(target.view.controller.topLayoutGuide).plus(0)
      width Device.screen.width
      left 0
    end
  end

  def top_input_style
    background_color :white.uicolor
    constraints do
      height 40
      top 10
      left 15
      width.equals(:top_section).minus(30)
    end
  end

  # def add_message_table_style(controller)
  #    unless @layout_constraints_added
  #     @layout_constraints_added = true
  #     constraints(:message_table) do
  #       # top.equals(controller.topLayoutGuide)
  #       height 500
  #       width 320
  #       left 0
  #       top 100
  #     end
  #   end
  # end

  def message_table_style
    constraints do
      # height 500
      # below(:top_section)
      top 114
      height (Device.screen.height - 114)
      # bottom 568
      width 320
      # above(target.view.controller.bottomLayoutGuide)
      left 0
      # width Device.screen.width
    end
  end

  # def add_constraints(controller)
  #   # guard against adding these constraints more than once
  #   unless @layout_constraints_added
  #     @layout_constraints_added = true
  #     constraints(:message_table) do
  #       top.equals(controller.topLayoutGuide)
  #       height 500
  #     end
  #   end
  # end

end