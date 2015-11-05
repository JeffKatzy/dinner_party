# == Schema Information
#
# Table name: users
#
#  id              :integer          not null, primary key
#  name            :string
#  uid             :string
#  provider        :string
#  email           :string
#  password_digest :string
#

class User < ActiveRecord::Base
  
  has_one :guest
  has_one :host


  def self.create_with_omniauth(auth_hash)
    # ideally, would move this into a different objct, but not bad
    create! do |user|
      user.provider = auth_hash["provider"]
      user.uid = auth_hash["uid"]
      user.name = auth_hash["info"]["name"]
      user.profile_picture = auth_hash["info"]["image"]
    end
  end

  def self.find_by_provider_and_uid(auth_hash)
    User.find_by(provider: auth_hash[:provider], uid: auth_hash[:uid])
  end

end


