class PostCategory < ActiveRecord::Base
    acts_as_nested_set

    attr_accessible :name, :description, :lft, :rgt, :parent_id   

    has_many :categorizations
    has_many :posts, :through => :categorizations

    attr_accessor :_list

    def branch_ids
      self_and_descendants.map(&:id).uniq 
    end

    def all_products
       Product.find(:all, :conditions => { :category_id => branch_ids } )
    end


end
