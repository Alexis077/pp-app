module Api
  module V1
    class UserSerializer < ActiveModel::Serializer
      attributes :id, :name, :last_name, :email
    end
  end
end

