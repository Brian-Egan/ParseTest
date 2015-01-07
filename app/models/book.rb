class Book
  include ParseModel::Model

  fields :title, :author, :isbn13, :is_bestseller, :save_count, :rec_count, :yang_id
end