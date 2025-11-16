# # # # # # # Nombres y apellidos reales peruanos
# # # # # FIRST_NAMES = %w[
# # # # #   Carlos Juan Luis José Pedro Miguel Jorge Alberto Daniel
# # # # #   Ricardo Mario Javier Manuel Víctor Enrique Diego Andrés
# # # # #   Ana Maria Carmen Rosa Patricia Lucia Daniela Claudia Sofia
# # # # # ]

# # # # # LAST_NAMES = %w[
# # # # #   Pérez García Rodríguez López Sánchez Gonzales Ramírez Díaz
# # # # #   Torres Flores Castillo Herrera Medina Vargas Chávez Rojas
# # # # #   Salazar Ruiz Mendoza Paredes Navarro Morales
# # # # # ]

# # # # # # Ubigeo realista PERÚ (simplificado)
# # # # # UBIGEO = {
# # # # #   "Lima" => {
# # # # #     "Lima" => {
# # # # #       "Miraflores" => [
# # # # #         "Colegio Ricardo Palma", "Colegio Juana Alarco", "Colegio Markham"
# # # # #       ],
# # # # #       "San Isidro" => [
# # # # #         "IE Alfonso Ugarte", "Colegio Belén", "San Agustín"
# # # # #       ],
# # # # #       "Santiago de Surco" => [
# # # # #         "IE Santa María", "Colegio San Roque", "Colegio Franco Peruano"
# # # # #       ]
# # # # #     }
# # # # #   },
# # # # #   "Arequipa" => {
# # # # #     "Arequipa" => {
# # # # #       "Cercado" => [
# # # # #         "IE Independencia Americana", "IE Arequipa", "Colegio San José"
# # # # #       ],
# # # # #       "Yanahuara" => [
# # # # #         "Colegio Yanahuara", "San Juan Bautista", "G.U.E. Arequipa"
# # # # #       ],
# # # # #       "Cayma" => [
# # # # #         "Colegio Lord Byron", "IE Cayma", "Colegio Alemán"
# # # # #       ]
# # # # #     }
# # # # #   },
# # # # #   "Cusco" => {
# # # # #     "Cusco" => {
# # # # #       "Cusco Distrito" => [
# # # # #         "IE Ciencias", "Inca Garcilaso", "San Antonio"
# # # # #       ],
# # # # #       "San Sebastián" => [
# # # # #         "IE San Sebastián", "Clorinda Matto"
# # # # #       ],
# # # # #       "San Jerónimo" => [
# # # # #         "IE San Jerónimo", "Fe y Alegría"
# # # # #       ]
# # # # #     }
# # # # #   }
# # # # # }


# # # # # puts "Creando representantes del partido..."

# # # # # 24.times do
# # # # #   first_name  = FIRST_NAMES.sample
# # # # #   last_name   = LAST_NAMES.sample
# # # # #   full_name   = "#{first_name} #{last_name}"

# # # # #   department = UBIGEO.keys.sample
# # # # #   province   = UBIGEO[department].keys.sample
# # # # #   district   = UBIGEO[department][province].keys.sample
# # # # #   polling_place = UBIGEO[department][province][district].sample

# # # # #   # Generar DNI real de 8 dígitos
# # # # #   dni = rand(10_000_000..99_999_999).to_s

# # # # #   Member.create!(
# # # # #     first_name: first_name,
# # # # #     last_name: last_name,
# # # # #     full_name: full_name,
# # # # #     email: "#{first_name.downcase}.#{last_name.downcase}#{rand(100..999)}@mail.com",
# # # # #     document_number: dni,
# # # # #     document_type: "DNI",
# # # # #     gender: [:male, :female].sample,
# # # # #     role_member: :party_representative,
# # # # #     department: department,
# # # # #     province: province,
# # # # #     district: district,
# # # # #     polling_place: polling_place
# # # # #   )
# # # # # end

# # # # # puts "¡Listo! Se crearon 25 representantes con DNIs válidos de 8 dígitos."


# # # # # #========================================================================================
# # # # # # --- NOMBRES Y APELLIDOS REALES ---
# # # # # FIRST_NAMES = %w[
# # # # #   Carlos Juan Luis José Pedro Miguel Jorge Alberto Daniel
# # # # #   Ricardo Mario Javier Manuel Víctor Enrique Diego Andrés
# # # # #   Ana Maria Carmen Rosa Patricia Lucia Daniela Claudia Sofia Elena
# # # # # ]

# # # # # LAST_NAMES = %w[
# # # # #   Pérez García Rodríguez López Sánchez Gonzales Ramírez Díaz
# # # # #   Torres Flores Castillo Herrera Medina Vargas Chávez Rojas
# # # # #   Salazar Ruiz Mendoza Paredes Navarro Morales Aguilar Campos
# # # # # ]

# # # # # # --- UBIGEO AMPLIADO CON 10 DEPARTAMENTOS ---
# # # # # UBIGEO_EXTENDED = {
# # # # #   "Lima" => {
# # # # #     "Lima" => {
# # # # #       "Miraflores" => ["Ricardo Palma", "Juana Alarco", "Markham"],
# # # # #       "San Isidro" => ["Alfonso Ugarte", "Belén", "San Agustín"],
# # # # #       "Surco" => ["Santa María", "San Roque", "Franco Peruano"]
# # # # #     }
# # # # #   },
# # # # #   "Callao" => {
# # # # #     "Callao" => {
# # # # #       "Callao" => ["Guillermo Billinghurst", "Dos de Mayo", "Ventanilla Alta"],
# # # # #       "Bellavista" => ["San Antonio", "Bartolomé Herrera"],
# # # # #       "La Perla" => ["La Perla 101", "IEP La Perla"]
# # # # #     }
# # # # #   },
# # # # #   "Arequipa" => {
# # # # #     "Arequipa" => {
# # # # #       "Cercado" => ["Independencia Americana", "San José"],
# # # # #       "Cayma" => ["Lord Byron", "Colegio Cayma"],
# # # # #       "Yanahuara" => ["Yanahuara", "Gran Unidad Arequipa"]
# # # # #     }
# # # # #   },
# # # # #   "Cusco" => {
# # # # #     "Cusco" => {
# # # # #       "Cusco Distrito" => ["Ciencias", "Garcilaso"],
# # # # #       "San Sebastián" => ["San Sebastián", "Clorinda Matto"],
# # # # #       "San Jerónimo" => ["San Jerónimo", "Fe y Alegría"]
# # # # #     }
# # # # #   },
# # # # #   "Piura" => {
# # # # #     "Piura" => {
# # # # #       "Piura" => ["Don Bosco", "San Miguel", "Santa Rosa"],
# # # # #       "Castilla" => ["Castilla 201", "Cristo Rey"],
# # # # #       "Catacaos" => ["Catacaos Central", "IE Señor Cautivo"]
# # # # #     }
# # # # #   },
# # # # #   "La Libertad" => {
# # # # #     "Trujillo" => {
# # # # #       "Trujillo" => ["Modelo", "San Juan", "La Asunción"],
# # # # #       "Florencia de Mora" => ["Florencia IE 101", "IE Redentor"],
# # # # #       "El Porvenir" => ["El Porvenir 104", "IE Indoamericano"]
# # # # #     }
# # # # #   },
# # # # #   "Junín" => {
# # # # #     "Huancayo" => {
# # # # #       "Huancayo" => ["Mariscal Castilla", "Santa Isabel"],
# # # # #       "El Tambo" => ["El Tambo 102", "IE Salesiano"],
# # # # #       "Chilca" => ["IE Chilca", "Virgen del Carmen"]
# # # # #     }
# # # # #   },
# # # # #   "Puno" => {
# # # # #     "Puno" => {
# # # # #       "Puno" => ["Glorioso 601", "Colegio Gran Unidad"],
# # # # #       "Juliaca" => ["San José", "IE Peru Birf"],
# # # # #       "Azángaro" => ["Azángaro Central", "IE San Martín"]
# # # # #     }
# # # # #   },
# # # # #   "Lambayeque" => {
# # # # #     "Chiclayo" => {
# # # # #       "Chiclayo" => ["San José", "Santa Magdalena Sofía"],
# # # # #       "La Victoria" => ["IE La Victoria", "Fe y Alegría 27"],
# # # # #       "José Leonardo Ortiz" => ["JLO 102", "IE San Andrés"]
# # # # #     }
# # # # #   },
# # # # #   "Ica" => {
# # # # #     "Ica" => {
# # # # #       "Ica" => ["San Luis Gonzaga", "Nuestra Señora de Guadalupe"],
# # # # #       "Pisco" => ["Pisco 76", "IE Miguel Grau"],
# # # # #       "Chincha Alta" => ["Chincha Alta IE", "Colegio América"]
# # # # #     }
# # # # #   }
# # # # # }


# # # # # puts "Creando 40 miembros de mesa..."

# # # # # 40.times do
# # # # #   first_name  = FIRST_NAMES.sample
# # # # #   last_name   = LAST_NAMES.sample
# # # # #   full_name   = "#{first_name} #{last_name}"

# # # # #   department = UBIGEO_EXTENDED.keys.sample
# # # # #   province   = UBIGEO_EXTENDED[department].keys.sample
# # # # #   district   = UBIGEO_EXTENDED[department][province].keys.sample
# # # # #   polling_place = UBIGEO_EXTENDED[department][province][district].sample

# # # # #   # DNI válido de 8 dígitos
# # # # #   dni = rand(10_000_000..99_999_999).to_s

# # # # #   Member.create!(
# # # # #     first_name: first_name,
# # # # #     last_name: last_name,
# # # # #     full_name: full_name,
# # # # #     email: "#{first_name.downcase}.#{last_name.downcase}#{rand(100..999)}@mail.com",
# # # # #     document_number: dni,
# # # # #     document_type: "DNI",
# # # # #     gender: [:male, :female].sample,
# # # # #     role_member: :mesa_member,       # 👈 AQUÍ EL TIPO DE MIEMBRO
# # # # #     department: department,
# # # # #     province: province,
# # # # #     district: district,
# # # # #     polling_place: polling_place
# # # # #   )
# # # # # end

# # # # # puts "¡Listo! Se crearon 40 miembros de mesa con datos reales."
# # # # # =================================================================================00000


# # # # # --- 100 CIUDADANOS (role_member: :citizen) ---

# # # # # # Nombres y apellidos reales
# # # # # FIRST_NAMES = %w[
# # # # #   Carlos Juan Luis José Pedro Miguel Jorge Alberto Daniel
# # # # #   Ricardo Mario Javier Manuel Víctor Enrique Diego Andrés
# # # # #   Ana Maria Carmen Rosa Patricia Lucia Daniela Claudia Sofia Elena Teresa
# # # # # ]

# # # # # LAST_NAMES = %w[
# # # # #   Pérez García Rodríguez López Sánchez Gonzales Ramírez Díaz
# # # # #   Torres Flores Castillo Herrera Medina Vargas Chávez Rojas
# # # # #   Salazar Ruiz Mendoza Paredes Navarro Morales Aguilar Campos
# # # # #   Villanueva Castro Bravo Vega Medina
# # # # # ]

# # # # # # UBIGEO MÁS AMPLIADO (ahora con más variedad)
# # # # # UBIGEO_MORE = {
# # # # #   "Lima" => {
# # # # #     "Lima" => {
# # # # #       "Miraflores" => ["Ricardo Palma", "Juana Alarco", "Markham"],
# # # # #       "San Isidro" => ["Alfonso Ugarte", "Belén", "San Agustín"],
# # # # #       "Surco" => ["Santa María", "San Roque", "Franco Peruano"],
# # # # #       "Chorrillos" => ["Mercedes Cabello", "Santa Anita", "IE Manuel Bonilla"],
# # # # #       "Comas" => ["IE Comas", "Guillermo Billinghurst", "IE El Maestro"]
# # # # #     }
# # # # #   },
# # # # #   "Arequipa" => {
# # # # #     "Arequipa" => {
# # # # #       "Cercado" => ["Independencia Americana", "San José"],
# # # # #       "Cayma" => ["Lord Byron", "Colegio Cayma"],
# # # # #       "Yanahuara" => ["Yanahuara", "Gran Unidad Arequipa"]
# # # # #     }
# # # # #   },
# # # # #   "Cusco" => {
# # # # #     "Cusco" => {
# # # # #       "Cusco Distrito" => ["Ciencias", "Garcilaso", "San Antonio"],
# # # # #       "San Sebastián" => ["San Sebastián", "Clorinda Matto"],
# # # # #       "San Jerónimo" => ["San Jerónimo", "Fe y Alegría"]
# # # # #     }
# # # # #   },
# # # # #   "Piura" => {
# # # # #     "Piura" => {
# # # # #       "Piura" => ["Don Bosco", "San Miguel"],
# # # # #       "Castilla" => ["Castilla 201", "Cristo Rey"],
# # # # #       "Catacaos" => ["Catacaos Central", "Señor Cautivo"]
# # # # #     }
# # # # #   },
# # # # #   "Junín" => {
# # # # #     "Huancayo" => {
# # # # #       "Huancayo" => ["Mariscal Castilla", "Santa Isabel"],
# # # # #       "El Tambo" => ["El Tambo 102", "Salesiano"],
# # # # #       "Chilca" => ["IE Chilca", "Virgen del Carmen"]
# # # # #     }
# # # # #   },
# # # # #   "Loreto" => {
# # # # #     "Maynas" => {
# # # # #       "Iquitos" => ["Colegio Iquitos", "San Agustín"],
# # # # #       "Punchana" => ["Punchana IE 601", "Fe y Alegría 23"]
# # # # #     }
# # # # #   },
# # # # #   "Puno" => {
# # # # #     "Puno" => {
# # # # #       "Puno" => ["Gran Unidad Puno", "Colegio 601"],
# # # # #       "Juliaca" => ["San José", "IE Peru Birf"]
# # # # #     }
# # # # #   },
# # # # #   "Cajamarca" => {
# # # # #     "Cajamarca" => {
# # # # #       "Cajamarca" => ["San Ramón", "Dos de Mayo"],
# # # # #       "Baños del Inca" => ["Colegio Inca", "IE Baños"]
# # # # #     }
# # # # #   }
# # # # # }

# # # # # puts "Creando 100 ciudadanos..."

# # # # # 100.times do
# # # # #   first_name  = FIRST_NAMES.sample
# # # # #   last_name   = LAST_NAMES.sample
# # # # #   full_name   = "#{first_name} #{last_name}"

# # # # #   department = UBIGEO_MORE.keys.sample
# # # # #   province   = UBIGEO_MORE[department].keys.sample
# # # # #   district   = UBIGEO_MORE[department][province].keys.sample
# # # # #   polling_place = UBIGEO_MORE[department][province][district].sample

# # # # #   # DNI real de 8 dígitos
# # # # #   dni = rand(10_000_000..99_999_999).to_s

# # # # #   # Fecha aleatoria del último año
# # # # #   created_at = rand(30..365).days.ago
# # # # #   updated_at = created_at + rand(1..30).days

# # # # #   Member.create!(
# # # # #     first_name: first_name,
# # # # #     last_name: last_name,
# # # # #     full_name: full_name,
# # # # #     email: "#{first_name.downcase}.#{last_name.downcase}#{rand(100..999)}@mail.com",
# # # # #     document_number: dni,
# # # # #     document_type: "DNI",
# # # # #     gender: [:male, :female].sample,
# # # # #     role_member: :citizen,               # <- aquí el tipo ciudadano
# # # # #     department: department,
# # # # #     province: province,
# # # # #     district: district,
# # # # #     polling_place: polling_place,
# # # # #     created_at: created_at,
# # # # #     updated_at: updated_at
# # # # #   )
# # # # # end

# # # # # puts "¡Listo! Se crearon 100 ciudadanos con datos realistas."
# # # # # political_parties_data = [
# # # # #   ["ACCION POPULAR", "accion-popular", "2025-10-10", 289_657],
# # # # #   ["ADELANTE PUEBLO UNIDO", "adelante-pueblo-unido", "2025-01-28", 42_249],
# # # # #   ["AHORA NACION - AN", "ahora-nacion-an", "2025-02-18", 62_234],
# # # # #   ["ALIANZA PARA EL PROGRESO", "alianza-para-el-progreso", "2025-11-05", 371_500],
# # # # #   ["AVANZA PAIS - PARTIDO DE INTEGRACION SOCIAL", "avanza-pais", "2025-09-05", 46_620],
# # # # #   ["BATALLA PERU", "batalla-peru", "2024-10-07", 45_497],
# # # # #   ["COMUNIDAD POLITICA INKA PERU", "inka-peru", "2025-03-13", 32_000],
# # # # #   ["FE EN EL PERU", "fe-en-el-peru", "2024-10-07", 55_237],
# # # # #   ["FRENTE POPULAR AGRICOLA FIA DEL PERU", "fia-del-peru", "2025-02-18", 44_610],
# # # # #   ["FUERZA POPULAR", "fuerza-popular", "2025-02-18", 58_779],
# # # # #   ["JUNTOS POR EL PERU", "juntos-por-el-peru", "2025-02-18", 52_157],
# # # # #   ["LIBERTAD POPULAR", "libertad-popular", "2025-10-03", 34_819],
# # # # #   ["NUEVO PERU POR EL BUEN VIVIR", "nuevo-peru", "2025-02-18", 40_443],
# # # # #   ["PARTIDO APRISTA PERUANO", "apra", "2025-05-08", 64_466],
# # # # #   ["PARTIDO CIUDADANOS POR EL PERU", "ciudadanos-por-el-peru", "2025-08-27", 38_050],
# # # # #   ["PARTIDO CIVICO OBRAS", "civico-obras", "2025-02-18", 40_229],
# # # # #   ["PARTIDO DE LOS TRABAJADORES Y EMPRENDEDORES PTE - PERU", "pte-peru", "2025-02-18", 37_389],
# # # # #   ["PARTIDO DEL BUEN GOBIERNO", "buen-gobierno", "2025-02-18", 37_865],
# # # # #   ["PARTIDO DEMOCRATA UNIDO PERU", "democrata-unido", "2025-10-03", 38_629],
# # # # #   ["PARTIDO DEMOCRATA VERDE", "democrata-verde", "2024-10-07", 55_889],
# # # # #   ["PARTIDO DEMOCRATICO FEDERAL", "democratico-federal", "2025-02-12", 28_564],
# # # # #   ["PARTIDO DEMOCRATICO SOMOS PERU", "somos-peru", "2025-10-23", 168_000],
# # # # #   ["PARTIDO FRENTE DE LA ESPERANZA 2021", "frente-esperanza", "2025-06-16", 65_426],
# # # # #   ["PARTIDO MORADO", "partido-morado", "2025-02-18", 26_273],
# # # # #   ["PARTIDO PAIS PARA TODOS", "pais-para-todos", "2025-02-24", 46_420],
# # # # #   ["PARTIDO PATRIOTICO DEL PERU", "patriotico-peru", "2025-02-18", 46_739],
# # # # #   ["PARTIDO POLITICO ADP", "adp", "2025-04-07", 53_327],
# # # # #   ["PARTIDO POLITICO COOPERACION POPULAR", "cooperacion-popular", "2025-02-18", 33_512],
# # # # #   ["PARTIDO POLITICO FUERZA MODERNA", "fuerza-moderna", "2025-05-29", 33_779],
# # # # #   ["PARTIDO POLITICO INTEGRIDAD DEMOCRATICA", "integridad-democratica", "2025-10-10", 44_335],
# # # # #   ["PARTIDO POLITICO NACIONAL PERU LIBRE", "peru-libre", "2025-09-12", 218_339],
# # # # #   ["PARTIDO POLITICO PERU ACCION", "peru-accion", "2025-02-17", 35_980],
# # # # #   ["PARTIDO POLITICO PERU PRIMERO", "peru-primero", "2025-10-14", 89_881],
# # # # #   ["PARTIDO POLITICO PERUANOS UNIDOS : SOMOS LIBRES", "peruanos-unidos", "2025-02-18", 33_801],
# # # # #   ["PARTIDO POLITICO POPULAR VOCES DEL PUEBLO", "voces-del-pueblo", "2025-06-26", 67_891],
# # # # #   ["PARTIDO POLITICO PRIN", "prin", "2025-11-05", 51_170],
# # # # #   ["PARTIDO POLITICO PUEBLO CONSCIENTE", "pueblo-consciente", "2025-06-25", 51_851],
# # # # #   ["PARTIDO POLITICO TODO CON EL PUEBLO", "todo-con-el-pueblo", "2025-10-21", 46_007],
# # # # #   ["PARTIDO POPULAR CRISTIANO - PPC", "ppc", "2025-10-16", 38_395],
# # # # #   ["PARTIDO POR EL ENTENDIMIENTO, RECUPERACION Y LA UNIFICACION DEL PERU", "peru-unificacion", "2025-01-31", 51_279],
# # # # #   ["PARTIDO SICREO", "sicreo", "2024-10-07", 43_998],
# # # # #   ["PARTIDO UNIDAD Y PAZ", "unidad-y-paz", "2025-08-12", 33_117],
# # # # #   ["PERU MODERNO", "peru-moderno", "2025-02-18", 53_674],
# # # # #   ["PODEMOS PERU", "podemos-peru", "2025-06-20", 43_587],
# # # # #   ["PRIMERO LA GENTE - COMUNIDAD, ECOLOGIA, LIBERTAD Y PROGRESO", "primero-la-gente", "2024-10-07", 32_939],
# # # # #   ["PROGRESEMOS", "progresemos", "2025-10-15", 50_907],
# # # # #   ["RENOVACION POPULAR", "renovacion-popular", "2025-06-26", 50_886],
# # # # #   ["RESURGIMIENTO UNIDO NACIONAL - RUNA", "runa", "2024-10-07", 33_831],
# # # # #   ["SALVEMOS AL PERU", "salvemos-al-peru", "2024-10-07", 29_122],
# # # # #   ["UN CAMINO DIFERENTE", "camino-diferente", "2024-10-07", 29_258],
# # # # #   ["UP UNIDAD POPULAR", "unidad-popular", "2024-10-07", 29_821],
# # # # #   ["VISION PERU", "vision-peru", "2025-03-31", 47_940]
# # # # # ]

# # # # # political_parties_data.each do |name, acronym, date, affiliates|
# # # # #   PoliticalParty.create!(
# # # # #     name: name,
# # # # #     acronym: acronym,
# # # # #     founded_at: date,
# # # # #     affiliates_rop: affiliates,
# # # # #     status: :active
# # # # #   )
# # # # # end

# # # # # # puts "✔ Partidos creados: #{PoliticalParty.count}"
# # # # # political_parties_data = [
# # # # #   ["ACCION POPULAR", "accion-popular", "2025-10-10", 289_657],
# # # # #   ["ADELANTE PUEBLO UNIDO", "adelante-pueblo-unido", "2025-01-28", 42_249],
# # # # #   ["AHORA NACION - AN", "ahora-nacion-an", "2025-02-18", 62_234],
# # # # #   ["ALIANZA PARA EL PROGRESO", "alianza-para-el-progreso", "2025-11-05", 371_500],
# # # # #   ["AVANZA PAIS - PARTIDO DE INTEGRACION SOCIAL", "avanza-pais", "2025-09-05", 46_620],
# # # # #   ["BATALLA PERU", "batalla-peru", "2024-10-07", 45_497],
# # # # #   ["COMUNIDAD POLITICA INKA PERU", "inka-peru", "2025-03-13", 32_000],
# # # # #   ["FE EN EL PERU", "fe-en-el-peru", "2024-10-07", 55_237],
# # # # #   ["FRENTE POPULAR AGRICOLA FIA DEL PERU", "fia-del-peru", "2025-02-18", 44_610],
# # # # #   ["FUERZA POPULAR", "fuerza-popular", "2025-02-18", 58_779],
# # # # #   ["JUNTOS POR EL PERU", "juntos-por-el-peru", "2025-02-18", 52_157],
# # # # #   ["LIBERTAD POPULAR", "libertad-popular", "2025-10-03", 34_819],
# # # # #   ["NUEVO PERU POR EL BUEN VIVIR", "nuevo-peru", "2025-02-18", 40_443],
# # # # #   ["PARTIDO APRISTA PERUANO", "apra", "2025-05-08", 64_466],
# # # # #   ["PARTIDO CIUDADANOS POR EL PERU", "ciudadanos-por-el-peru", "2025-08-27", 38_050],
# # # # #   ["PARTIDO CIVICO OBRAS", "civico-obras", "2025-02-18", 40_229],
# # # # #   ["PARTIDO DE LOS TRABAJADORES Y EMPRENDEDORES PTE - PERU", "pte-peru", "2025-02-18", 37_389],
# # # # #   ["PARTIDO DEL BUEN GOBIERNO", "buen-gobierno", "2025-02-18", 37_865],
# # # # #   ["PARTIDO DEMOCRATA UNIDO PERU", "democrata-unido", "2025-10-03", 38_629],
# # # # #   ["PARTIDO DEMOCRATA VERDE", "democrata-verde", "2024-10-07", 55_889],
# # # # #   ["PARTIDO DEMOCRATICO FEDERAL", "democratico-federal", "2025-02-12", 28_564],
# # # # #   ["PARTIDO DEMOCRATICO SOMOS PERU", "somos-peru", "2025-10-23", 168_000],
# # # # #   ["PARTIDO FRENTE DE LA ESPERANZA 2021", "frente-esperanza", "2025-06-16", 65_426],
# # # # #   ["PARTIDO MORADO", "partido-morado", "2025-02-18", 26_273],
# # # # #   ["PARTIDO PAIS PARA TODOS", "pais-para-todos", "2025-02-24", 46_420],
# # # # #   ["PARTIDO PATRIOTICO DEL PERU", "patriotico-peru", "2025-02-18", 46_739],
# # # # #   ["PARTIDO POLITICO ADP", "adp", "2025-04-07", 53_327],
# # # # #   ["PARTIDO POLITICO COOPERACION POPULAR", "cooperacion-popular", "2025-02-18", 33_512],
# # # # #   ["PARTIDO POLITICO FUERZA MODERNA", "fuerza-moderna", "2025-05-29", 33_779],
# # # # #   ["PARTIDO POLITICO INTEGRIDAD DEMOCRATICA", "integridad-democratica", "2025-10-10", 44_335],
# # # # #   ["PARTIDO POLITICO NACIONAL PERU LIBRE", "peru-libre", "2025-09-12", 218_339],
# # # # #   ["PARTIDO POLITICO PERU ACCION", "peru-accion", "2025-02-17", 35_980],
# # # # #   ["PARTIDO POLITICO PERU PRIMERO", "peru-primero", "2025-10-14", 89_881],
# # # # #   ["PARTIDO POLITICO PERUANOS UNIDOS : SOMOS LIBRES", "peruanos-unidos", "2025-02-18", 33_801],
# # # # #   ["PARTIDO POLITICO POPULAR VOCES DEL PUEBLO", "voces-del-pueblo", "2025-06-26", 67_891],
# # # # #   ["PARTIDO POLITICO PRIN", "prin", "2025-11-05", 51_170],
# # # # #   ["PARTIDO POLITICO PUEBLO CONSCIENTE", "pueblo-consciente", "2025-06-25", 51_851],
# # # # #   ["PARTIDO POLITICO TODO CON EL PUEBLO", "todo-con-el-pueblo", "2025-10-21", 46_007],
# # # # #   ["PARTIDO POPULAR CRISTIANO - PPC", "ppc", "2025-10-16", 38_395],
# # # # #   ["PARTIDO POR EL ENTENDIMIENTO, RECUPERACION Y LA UNIFICACION DEL PERU", "peru-unificacion", "2025-01-31", 51_279],
# # # # #   ["PARTIDO SICREO", "sicreo", "2024-10-07", 43_998],
# # # # #   ["PARTIDO UNIDAD Y PAZ", "unidad-y-paz", "2025-08-12", 33_117],
# # # # #   ["PERU MODERNO", "peru-moderno", "2025-02-18", 53_674],
# # # # #   ["PODEMOS PERU", "podemos-peru", "2025-06-20", 43_587],
# # # # #   ["PRIMERO LA GENTE - COMUNIDAD, ECOLOGIA, LIBERTAD Y PROGRESO", "primero-la-gente", "2024-10-07", 32_939],
# # # # #   ["PROGRESEMOS", "progresemos", "2025-10-15", 50_907],
# # # # #   ["RENOVACION POPULAR", "renovacion-popular", "2025-06-26", 50_886],
# # # # #   ["RESURGIMIENTO UNIDO NACIONAL - RUNA", "runa", "2024-10-07", 33_831],
# # # # #   ["SALVEMOS AL PERU", "salvemos-al-peru", "2024-10-07", 29_122],
# # # # #   ["UN CAMINO DIFERENTE", "camino-diferente", "2024-10-07", 29_258],
# # # # #   ["UP UNIDAD POPULAR", "unidad-popular", "2024-10-07", 29_821],
# # # # #   ["VISION PERU", "vision-peru", "2025-03-31", 47_940]
# # # # # ]

# # # # # # Obtener los representantes
# # # # # representatives = Member.where(role_member: :party_representative).to_a

# # # # # if representatives.length < political_parties_data.length
# # # # #   raise "❌ No hay suficientes miembros con rol party_representative"
# # # # # end

# # # # # political_parties_data.each_with_index do |(name, acronym, date, affiliates), i|
# # # # #   representative = representatives[i]

# # # # #   PoliticalParty.create!(
# # # # #     name: name,
# # # # #     acronym: acronym,
# # # # #     founded_at: date,
# # # # #     affiliates_rop: affiliates,
# # # # #     member_id: representative.id, # 👈 aquí asignamos un representante oficial
# # # # #     status: :active
# # # # #   )
# # # # # end

# # # # # puts "✔ Partidos creados: #{PoliticalParty.count}"
# # # # ap = PoliticalParty.find_by!(acronym: "accion-popular")

# # # # presidential_formula = [
# # # #   ["JULIO ABRAHAM CHAVEZ CHIONG",       "PRESIDENTE",             "presidential"],
# # # #   ["GISELLA MABELL NARVAEZ GAMARRA",    "VICEPRESIDENTE",         "vice_1"],
# # # #   ["DELIA CONDO SALAS",                 "SEGUNDO VICEPRESIDENTE", "vice_2"]
# # # # ]

# # # # presidential_formula.each do |full_name, cargo, position_type|
# # # #   Candidate.create!(
# # # #     full_name: full_name,
# # # #     document_number: nil,   # No se proporcionó DNI
# # # #     photo_url: nil,
# # # #     position_type: position_type,
# # # #     role: :titular,
# # # #     circumscription: "Nacional",
# # # #     order_number: 1,
# # # #     political_party_id: ap.id
# # # #   )
# # # # end

# # # # puts "→ Fórmula presidencial (Acción Popular) creada."
# # # ap = PoliticalParty.find_by!(acronym: "accion-popular")

# # # senadores_deu = [
# # #   [1, "VICTOR ANDRES GARCIA BELAUNDE"],
# # #   [2, "LESLYE CAROL LAZO VILLON"],
# # #   [3, "JUAN JOSE ABAD CABRERA"],
# # #   [4, "SILVIA MARIA MONTEZA FACHO"],
# # #   # 5 DESIGNADO — NO SE CREA
# # #   [6, "MARIA DEL CARMEN ALVA PRIETO"],
# # #   [7, "EDMUNDO DEL AGUILA HERRERA"],
# # #   # 8 DESIGNADO — NO SE CREA
# # #   [9, "WILSON SOTO PALACIOS"],
# # #   [10, "MARINA ROSALVA VASQUEZ HURTADO"],
# # #   # 11 DESIGNADO — NO SE CREA
# # #   [12, "CATALINA CHEPA GUZMAN MELGAR"],
# # #   [13, "JEAN CARLO GALLEGOS FERNANDEZ"],
# # #   [14, "SUSANA MEGO JIMENEZ"],
# # #   # 15 DESIGNADO — NO SE CREA
# # #   [16, "JACKELYNE AMELIA CARRION JURADO"],
# # #   [17, "PEDRO FERNANDO GAMIO AITA"],
# # #   [18, "MARIA CONCEPCION HUAMAN GUADALUPE"],
# # #   [19, "MARCO TULIO ALOCEN BARRERA"],
# # #   [20, "BLANCA CONSUELO SOBREVILLA GONZALEZ"],
# # #   [21, "FREDDY LLAULLI ROMERO"],
# # #   [22, "NORMA SABINA SANDOVAL ROJAS"],
# # #   [23, "WALTER PERCIVAL MENDOZA AYALA"],
# # #   [24, "MARLENE SOFIA CUENTAS CARRERA"],
# # #   [25, "JOSE DAVID VENTOSILLA ÑAÑEZ"],
# # #   [26, "MARGARITA JESUS ESPIRITU AYALA"],
# # #   [27, "ANTONIO SATURNINO PENAGOS VASQUEZ"],
# # #   [28, "ELIDA SOFIA BANDA VILLALOBOS"],
# # #   [29, "SAMUEL JOSE CUEVA QUISPE"],
# # #   [30, "GESSIKA RAEZ ROMERO DE MIRANDA"]
# # # ]

# # # senadores_deu.each do |order, full_name|
# # #   Candidate.create!(
# # #     full_name: full_name,
# # #     document_number: nil,
# # #     photo_url: nil,
# # #     position_type: :senate,
# # #     role: :titular,
# # #     circumscription: "Distrito Electoral Único",
# # #     order_number: order,
# # #     political_party_id: ap.id
# # #   )
# # # end

# # # puts "→ Senadores (Distrito Electoral Único) de Acción Popular creados."
# # ap = PoliticalParty.find_by!(acronym: "accion-popular")

# # parlamento_andino = [
# #   [1,  "RICARDO HANNO ZUÑE MORALES"],
# #   [2,  "LILIAN IVONNE TENORIO GOMEZ"],
# #   # 3 DESIGNADO — NO SE CREA
# #   # 4 DESIGNADO — NO SE CREA
# #   # 5 DESIGNADO — NO SE CREA
# #   [6,  "PAOLA ANGELICA PINEDO GONZALEZ"],
# #   [7,  "OSCAR FREDERIK UGARTE MEGO"],
# #   [8,  "YOVANY ASCUE ALTAMIRANO"],
# #   [9,  "MIGUEL ANGEL SARAVIA CUEVA"],
# #   [10, "JOYCE BETTY REYES DIAZ"],
# #   [11, "LUIS ENRIQUE GUTIERREZ ACOSTA"],
# #   [12, "ELY LIZBETH VENTOCILLA ROJAS"],
# #   [13, "PERCY VICTOR ESPEJO CACERES"],
# #   [14, "MARTHA VICTORIA FERNANDEZ MEJIA"],
# #   [15, "FELIX CAMINO NINA"],
# #   [16, "DORA ESPERANZA CUEVA QUIROZ"]
# # ]

# # parlamento_andino.each do |order, full_name|
# #   Candidate.create!(
# #     full_name: full_name,
# #     document_number: nil,
# #     photo_url: nil,
# #     position_type: :andean_parliament,
# #     role: :titular,
# #     circumscription: "Parlamento Andino",
# #     order_number: order,
# #     political_party_id: ap.id
# #   )
# # end

# # puts "→ Parlamento Andino de Acción Popular creado."
# ap = PoliticalParty.find_by!(acronym: "accion-popular")

# senadores_multiple = [
#   # AMAZONAS
#   ["Amazonas", 2, "ENVER MACHEL FIGUEROA BAZAN"],

#   # ÁNCASH
#   ["Áncash", 1, "MOISES RICARDO OBREGON VELASQUEZ"],
#   ["Áncash", 2, "FLOR DE MARIA DURAND CAMPOMANES"],

#   # APURÍMAC
#   ["Apurímac", 1, "JAIME ILLISH ZEGARRA PEÑA"],
#   ["Apurímac", 2, "PATRICIA MONICA SALHUANA SARMIENTO"],

#   # AREQUIPA
#   ["Arequipa", 1, "TOMAS FELIX GONZALES BERNAL"],
#   ["Arequipa", 2, "ROXANA JULIE GONZALES BERNAL DE SAN ROMAN"],

#   # AYACUCHO (designado en 1)
#   ["Ayacucho", 2, "MARGOT HINOSTROZA PALOMINO"],

#   # CAJAMARCA
#   ["Cajamarca", 1, "TEMISTOCLES ALFONSO NORIEGA DIAZ"],
#   ["Cajamarca", 2, "JULIA AGUEDITA LEZAMA ACUÑA"],

#   # CALLAO (designado en 1)
#   ["Callao", 2, "ROSSANA MARIA O'BRIEN FUENTES"],

#   # CUSCO
#   ["Cusco", 1, "MARIA ANTONIETA HERMOZA PILARES"],
#   ["Cusco", 2, "ROBERTO BELARMINO QUISPE SULLCA"],

#   # HUANCAVELICA (designado en 1)
#   ["Huancavelica", 2, "LUCY BETTY JURADO ÑAÑA"],

#   # HUÁNUCO (designado en 1)
#   ["Huánuco", 2, "YELENIA BARRIOS DOMINGUEZ"],

#   # ICA (designado en 1)
#   ["Ica", 2, "HILDA GISELLA BARRENECHEA MORENO"],

#   # JUNÍN (designado en 1)
#   ["Junín", 2, "WALTER DIONISIO BUENDIA MANTURANO"],

#   # LA LIBERTAD
#   ["La Libertad", 1, "ELOISA ARMAS AGUILAR"],
#   ["La Libertad", 2, "CARLOS ERNESTO LEON SILVA"],

#   # LAMBAYEQUE
#   ["Lambayeque", 1, "ROLANDO CAMPOS VILLALOBOS"],
#   ["Lambayeque", 2, "LIDIA ROSA PANTOJA BARBOZA"],

#   # LIMA METROPOLITANA
#   ["Lima Metropolitana", 1, "TANIA JANET ABAD JAIME"],
#   ["Lima Metropolitana", 4, "DAVID MOISES VELASCO PEREZ VELASCO"],
#   ["Lima Metropolitana", 4, "PEDRO GUILLERMO ROSARIO TUEROS"], # Lista 2
#   ["Lima Metropolitana", 4, "MARIA LUISA GARCES CARCOVICH"],
#   ["Lima Metropolitana", 1, "MARIA EUGENIA NIEVA MUZURRIETA"], # Lista 3
#   ["Lima Metropolitana", 4, "ABELARDO MARTIN LEPIANI TORRES"],

#   # LIMA PROVINCIAS
#   ["Lima Provincias", 1, "ELVIS EDILBERTO JARA PANANA"],
#   ["Lima Provincias", 2, "HEDY TERESA VALCARCEL VERANO"],

#   # LORETO
#   ["Loreto", 1, "LEONARDO AGUSTIN INGA VASQUEZ"],
#   ["Loreto", 2, "KELLY CONSUELO URRUTIA GONZALES"],

#   # MOQUEGUA
#   ["Moquegua", 1, "LUIS ALBERTO CONCHA QUISPITUPAC"],
#   ["Moquegua", 2, "NELLY CRISTINA ARACA CALLATA"],

#   # PASCO
#   ["Pasco", 1, "LUIS CARLOS SIMEON HURTADO"],
#   ["Pasco", 2, "MARIA EDITH CHAVEZ ALIAGA"],

#   # PIURA (designado en 1)
#   ["Piura", 2, "GLADYS YESENIA ATOCHE ZAPATA"],

#   # PUNO (designado en 1)
#   ["Puno", 2, "JOSE ANTONIO CALISAYA MAMANI"],

#   # SAN MARTÍN
#   ["San Martín", 1, "JOSE ANTONIO CARO MELENDEZ"],
#   ["San Martín", 2, "TERESA CHAVEZ GARCIA"],

#   # TACNA
#   ["Tacna", 1, "AUGUSTO GUZMAN MELENDEZ CONDORI"],
#   ["Tacna", 2, "JOSEFINA PALACIOS GONZALEZ DE JIMENEZ"],

#   # TUMBES
#   ["Tumbes", 1, "MANUEL ARTURO MERINO DE LAMA"],
#   ["Tumbes", 2, "DOLORES NOEMI GINES MOROCHO"],

#   # UCAYALI (designado en 1)
#   ["Ucayali", 2, "RYDER JULIO PEREA ZURITA"],

#   # RESIDENTES EN EL EXTRANJERO (designado en 1)
#   ["Residentes en el Extranjero", 2, "MARIA ROSARIO CASTILLO CARRION"]
# ]

# senadores_multiple.each do |circ, order, full_name|
#   Candidate.create!(
#     full_name: full_name,
#     document_number: nil,
#     photo_url: nil,
#     position_type: :senate,
#     role: :titular,
#     circumscription: circ,
#     order_number: order,
#     political_party_id: ap.id
#   )
# end

# puts "→ Senadores Distrito Múltiple creados."
