class Post < ApplicationRecord
    validates :title,  :namesummary, :body, :presence => true

    has_many :comments, :dependent => :destroy
    has_many :taggings
    has_many :tags, through: :taggings

    def all_tags
        self.tags.map(&:name).join(', ')
    end
    def all_tags=(names)
        self.tags = names.split(',').map do |name|
            Tag.where(name: name.strip).first_or_create!
        end
    end
    
end
