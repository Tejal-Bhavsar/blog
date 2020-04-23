class User < ApplicationRecord
  devise  :database_authenticatable, :registerable, :recoverable,
          :rememberable, :trackable, :validatable 
          
  has_many :articles
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable

  
    
  def self.to_csv(options = {})
    CSV.generate(options) do |csv|
      columns = ["id", "email", "last_seen_at", "articles"]
      csv << columns
      all.each do |user|
        if user.articles.length == 0
          articles_title = ""
        else
          articles_title =  user.articles.pluck(:title).join(",") 
        end
        row = [ user.id, user.email, user.last_seen_at, articles_title]
        csv << row

      end
    end
  end
       
end
