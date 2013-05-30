module Group::Generic
  extend ActiveSupport::Concern

  included do
    # define global roles before children
    roles Role::AddressAdmin,
          Role::DispatchAddress,
          Role::External

    # define global children
    children Group::Basic

    root_types Group::TopLayer
  end
end