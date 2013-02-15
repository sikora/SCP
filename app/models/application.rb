class Application < ActiveRecord::Base
	
  self.abstract_class = true
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable, :timeoutable

  def timeout
      3.seconds
  end  
end