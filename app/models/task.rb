class Task < ApplicationRecord
  belongs_to :list

  as_enum :state, completed: 1, pending: 0

end
