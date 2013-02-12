class Usuario < ActiveRecord::Base
  audited
  # Include default devise modules. Others available are:
  # :token_authenticatable, :confirmable,
  # :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable

  # Setup accessible (or protected) attributes for your model
  attr_accessible :email, :password, :password_confirmation, :remember_me, :nome, :username
  belongs_to :perfil ,:foreign_key => 'idperfil'

  # attr_accessible :title, :body
  def self.pagination_with_search(page, search, order)
    paginate  :page => page,
              :conditions => ['nome like ?', "%#{search}%"],
              :order => (order ? "#{order[:column]} #{order[:order]}" : "id")
  end
end
