# == Schema Information
#
# Table name: postsubs
#
#  id         :bigint           not null, primary key
#  post_id    :integer          not null
#  sub_id     :integer          not null
#  created_at :datetime         not null
#  updated_at :datetime         not null
#

class Postsub < ApplicationRecord

  belongs_to :post

  belongs_to :sub
end
