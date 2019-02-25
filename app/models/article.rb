class Article < ActiveRecord::Base
  belongs_to :user
  belongs_to :category
  has_many :reviews
  
has_attached_file :article_img, styles: { :article_index => "250x250>", :article_show => "325x475>" }, :default_url => "/images/:style/missing.png"
validates_attachment_content_type :article_img, :content_type => /\Aimage\/.*\z/




end
