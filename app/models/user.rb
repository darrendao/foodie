class User < ActiveRecord::Base
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable

  has_and_belongs_to_many :roles

  def roles_names
    roles.map{|role|role.name}.join(", ") if roles
  end

  def role?(role)
    return !!self.roles.find_by_name(role.to_s.camelize)
  end
end
