class Event < ApplicationRecord
  enum type_member: {
    everybody: 0,
    members: 1
  }
end
