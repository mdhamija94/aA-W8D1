# == Schema Information
#
# Table name: subs
#
#  id          :bigint           not null, primary key
#  title       :string           not null
#  description :text             not null
#  user_id     :integer          not null
#  created_at  :datetime         not null
#  updated_at  :datetime         not null
#

class Sub < ApplicationRecord
  validates :title, :user_id, presence: true
  validates :title, uniqueness: { scope: :user_id }

  belongs_to :moderator,
    foreign_key: :user_id,
    class_name: :User
    
    has_many :postsubs,
    foreign_key: :sub_id,
    class_name: 'Postsub'
    
    has_many :posts,
      through: :postsubs,
      source: :post
      
end
