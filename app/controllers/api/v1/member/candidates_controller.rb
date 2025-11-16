class Api::V1::Member::CandidatesController < ApplicationController
  skip_before_action :verify_authenticity_token
  before_action :set_candidates_by_party, only: [
    :all_by_party, 
    :only_presidents_by_party,
    :web_by_party,
    :senado_by_party,
    :diput_by_party,
    :parlament_by_party
  ]

  # =========================================================
  # 1️⃣ TODOS LOS CANDIDATOS POR PARTIDO (SIN CIRCUNSCRIPCIÓN)
  # =========================================================
  def all_by_party
    render json: {
      presidential: @candidates.where(position_type: :presidential),
      vice_1:       @candidates.where(position_type: :vice_1),
      vice_2:       @candidates.where(position_type: :vice_2),
      senate:       @candidates.where(position_type: :senate),
      deputy:       @candidates.where(position_type: :deputy),
      andean_parliament: @candidates.where(position_type: :andean_parliament)
    }
  end

  # SOLO presidentes y vicepresidentes
  def only_presidents_by_party
    render json: {
      presidential: @candidates.where(position_type: :presidential),
      vice_1:       @candidates.where(position_type: :vice_1),
      vice_2:       @candidates.where(position_type: :vice_2)
    }
  end

  # SOLO senado + diputados + parlamento (para web)
  def web_by_party
    render json: {
      senate:             @candidates.where(position_type: :senate),
      deputy:             @candidates.where(position_type: :deputy),
      andean_parliament:  @candidates.where(position_type: :andean_parliament)
    }
  end

  def senado_by_party
    render json: {
      senate: @candidates.where(position_type: :senate)
    }
  end

  def diput_by_party
    render json: {
      deputy: @candidates.where(position_type: :deputy)
    }
  end

  def parlament_by_party
    render json: {
      andean_parliament: @candidates.where(position_type: :andean_parliament)
    }
  end

  # ===============================================================
  # 2️⃣ POR PARTIDO + CIRCUNSCRIPCIÓN
  # ===============================================================
  def by_party_and_circumscription
    party_id = params[:party]
    circ = params[:circumscription]

    candidates = Candidate.where(
      political_party_id: party_id,
      circumscription: circ
    )

    render json: {
      senate:             candidates.where(position_type: :senate),
      deputy:             candidates.where(position_type: :deputy),
      andean_parliament:  candidates.where(position_type: :andean_parliament)
    }
  end

  # ===============================================================
  # 3️⃣ LISTA DE TODAS LAS CIRCUNSCRIPCIONES POR PARTIDO (SELECT)
  # ===============================================================
  def circumscription_list_by_party
    party_id = params[:party]

    circs = Candidate.where(political_party_id: party_id)
                     .where.not(circumscription: nil)
                     .distinct
                     .pluck(:circumscription)

    render json: { circunscripciones: circs }
  end

  private

  def set_candidates_by_party
    @candidates = Candidate.where(political_party_id: params[:party])
  end
end
