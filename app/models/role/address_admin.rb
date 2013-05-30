# Addressverwaltung. Additional role to manager addresses
class Role::AddressAdmin < ::Role
  self.permissions = [:group_full]
end