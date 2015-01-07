class MessagesTableScreen < PM::TableScreen

  attr_accessor :message


  def on_load
    @tasks = ["hey dude", "other stuff"]
    @data = [{
      cells: @tasks.map do |task|
        {
          title: task,
          action: :select_movie,
          arguments: {movie: task}
        }
      end
      }]
  #   update_table_data
    update_table_data
  end



  def tasks
    @tasks = ["hey dude", "other stuff"]
  end




  def add_message(old_data, message)
    # @tasks ||= tasks
    # @tasks << message
    new_data = {title: message, action: :select_movie, arguments: {movie: message}}
    # ap [new_data, @data, @table_data, self.table_data]
    old_data[0][:cells] << new_data
    # ap old_data
    @data = old_data
    update_table_data
  end

   def table_data
      @data ||= []

  end

  def select_movie(movie)
    # self.parent_screen.select_movie(movie)
    PM.logger.debug movie
  end




end