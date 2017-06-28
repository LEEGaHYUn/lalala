class Post < ActiveRecord::Base
    resourcify
    include Authority::Abilities
    
    has_many :comments
    has_many :likes
    
    validates :title, presence: {message: "제목이 작성되지 않았습니다."}, length: {minimum: 2}
    validates :content, presence: {message: "내용이 작성되지 않았습니다."}
    

    belongs_to :user
    
    validates :title,           
                presence: true    
    validates :content,            
                presence: true
end
