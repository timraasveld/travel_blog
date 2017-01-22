# Basic configuration for all AR models
class ApplicationRecord < ActiveRecord::Base
  self.abstract_class = true
end
