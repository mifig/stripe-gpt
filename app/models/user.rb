class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

  has_many  :subscriptions
            # primary_key: :stripe_customer_id, 
            # foreign_key: :stripe_customer_id

  has_many  :invoices,
            foreign_key: :stripe_customer_id,
            primary_key: :stripe_customer_id
end
