class User < ActiveRecord::Base
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable

  has_many :videos, dependent: :destroy

  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable,
         :omniauthable, :omniauth_providers => [:facebook]

  def self.find_for_facebook_oauth(auth, signed_in_resource=nil)
    user = User.where(:provider => auth.provider, :uid => auth.uid).first

    if user
      return user
    else
      registered_user = User.where(:email => auth.info.email).first
      if registered_user
        return registered_user
      else
        auth.info.email ||= "#{auth.uid}@facebook.com"
        user = User.create( name: auth.extra.raw_info.name,
                            first_name: auth.info.first_name,
                            last_name: auth.info.last_name,
                            provider: auth.provider,
                            uid: auth.uid,
                            email: auth.info.email,
                            password: Devise.friendly_token[0,20],
                            avatar_url: auth.info.image,
                            profile_url: auth.info.urls[:Facebook]
                          )
      end
    end
  end
end
