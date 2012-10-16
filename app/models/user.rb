class User < ActiveRecord::Base
  attr_accessible :first_name, :last_name, :email, :email_confirmation, :password, :password_confirmation
  
  validates :first_name, :presence => true
  validates :last_name, :presence => true
  validates :email, :presence => true, 
            :format => {:with => /\A[A-Za-z0-9._%+-]+@[A-Za-z0-9.-]+\.[A-Za-z]+\z/, :message => 'must be in a valid format'},
            :confirmation => true
  validates :password, :presence => true, :confirmation => true, :length => {:minimum => 7, :maximum => 20},
            :format => {:with => /\d/, :message => 'must contain at least one number'}
  validates :password, :format => {:with => /[A-Z]/, :message => 'must contain at least one uppercase letter'}
  
end
