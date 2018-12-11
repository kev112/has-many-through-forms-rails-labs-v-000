class Post < ActiveRecord::Base
  has_many :post_categories
  has_many :categories, through: :post_categories
  has_many :comments
  has_many :users, through: :comments

 def categories_attributes=(categories_hash)
  # raise categories_hash.inspect
  # {"0"=>{"name"=>"sd"}, "1"=>{"name"=>"97y99"}}

  categories_hash.each do |i, categories_attributes| 
    category = Category.find_or_create_by(categories_attributes)
    self.post_categories.build(:category => category)
  end
 end

end
