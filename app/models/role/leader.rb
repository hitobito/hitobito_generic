class Role::Leader < Role
  self.permissions = [:layer_full, :contact_data, :approve_applications]
end