class Candidate < ApplicationRecord
  belongs_to :political_party

  enum position_type: {
    presidential: 0,
    vice_1: 1,
    vice_2: 2,
    senate: 3,
    deputy: 4,
    andean_parliament: 5
  }

  enum role: {
    titular: 0,
    reemplazante: 1
  }
end
