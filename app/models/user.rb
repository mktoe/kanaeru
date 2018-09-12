class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable

  #devise :database_authenticatable, :registerable,
      # :recoverable, :rememberable, :trackable, :validatable

  devise :database_authenticatable, :registerable,
        :recoverable, :rememberable, :trackable, :validatable, :confirmable #最後のやつを追加
       
  #メール認証を使う場合はonfirmableを使う
  #devise :database_authenticatable, :registerable,
       #:recoverable, :rememberable, :trackable, :validatable, :confirmable
  
  def password_required?
    super if confirmed?
  end

end
