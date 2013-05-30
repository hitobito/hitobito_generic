class Role::Leader < Role
  self.permissions = [:layer_full, :contact_data, :qualify, :approve_applications]
end