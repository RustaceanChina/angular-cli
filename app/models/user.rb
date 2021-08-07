class User < ApplicationRecord
  def self.find_or_create_from_auth_hash(a