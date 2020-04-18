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
        row = [ user.id, user.email, user.last_seen_at, user.articles.pluck(:title)]
        csv << row

      end
    end
  end
       
end
