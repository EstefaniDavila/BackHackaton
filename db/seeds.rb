# # Nombres y apellidos reales peruanos
# FIRST_NAMES = %w[
#   Carlos Juan Luis José Pedro Miguel Jorge Alberto Daniel
#   Ricardo Mario Javier Manuel Víctor Enrique Diego Andrés
#   Ana Maria Carmen Rosa Patricia Lucia Daniela Claudia Sofia
# ]

# LAST_NAMES = %w[
#   Pérez García Rodríguez López Sánchez Gonzales Ramírez Díaz
#   Torres Flores Castillo Herrera Medina Vargas Chávez Rojas
#   Salazar Ruiz Mendoza Paredes Navarro Morales
# ]

# # Ubigeo realista PERÚ (simplificado)
# UBIGEO = {
#   "Lima" => {
#     "Lima" => {
#       "Miraflores" => [
#         "Colegio Ricardo Palma", "Colegio Juana Alarco", "Colegio Markham"
#       ],
#       "San Isidro" => [
#         "IE Alfonso Ugarte", "Colegio Belén", "San Agustín"
#       ],
#       "Santiago de Surco" => [
#         "IE Santa María", "Colegio San Roque", "Colegio Franco Peruano"
#       ]
#     }
#   },
#   "Arequipa" => {
#     "Arequipa" => {
#       "Cercado" => [
#         "IE Independencia Americana", "IE Arequipa", "Colegio San José"
#       ],
#       "Yanahuara" => [
#         "Colegio Yanahuara", "San Juan Bautista", "G.U.E. Arequipa"
#       ],
#       "Cayma" => [
#         "Colegio Lord Byron", "IE Cayma", "Colegio Alemán"
#       ]
#     }
#   },
#   "Cusco" => {
#     "Cusco" => {
#       "Cusco Distrito" => [
#         "IE Ciencias", "Inca Garcilaso", "San Antonio"
#       ],
#       "San Sebastián" => [
#         "IE San Sebastián", "Clorinda Matto"
#       ],
#       "San Jerónimo" => [
#         "IE San Jerónimo", "Fe y Alegría"
#       ]
#     }
#   }
# }


# puts "Creando representantes del partido..."

# 24.times do
#   first_name  = FIRST_NAMES.sample
#   last_name   = LAST_NAMES.sample
#   full_name   = "#{first_name} #{last_name}"

#   department = UBIGEO.keys.sample
#   province   = UBIGEO[department].keys.sample
#   district   = UBIGEO[department][province].keys.sample
#   polling_place = UBIGEO[department][province][district].sample

#   # Generar DNI real de 8 dígitos
#   dni = rand(10_000_000..99_999_999).to_s

#   Member.create!(
#     first_name: first_name,
#     last_name: last_name,
#     full_name: full_name,
#     email: "#{first_name.downcase}.#{last_name.downcase}#{rand(100..999)}@mail.com",
#     document_number: dni,
#     document_type: "DNI",
#     gender: [:male, :female].sample,
#     role_member: :party_representative,
#     department: department,
#     province: province,
#     district: district,
#     polling_place: polling_place
#   )
# end

# puts "¡Listo! Se crearon 25 representantes con DNIs válidos de 8 dígitos."


# #========================================================================================
# # --- NOMBRES Y APELLIDOS REALES ---
# FIRST_NAMES = %w[
#   Carlos Juan Luis José Pedro Miguel Jorge Alberto Daniel
#   Ricardo Mario Javier Manuel Víctor Enrique Diego Andrés
#   Ana Maria Carmen Rosa Patricia Lucia Daniela Claudia Sofia Elena
# ]

# LAST_NAMES = %w[
#   Pérez García Rodríguez López Sánchez Gonzales Ramírez Díaz
#   Torres Flores Castillo Herrera Medina Vargas Chávez Rojas
#   Salazar Ruiz Mendoza Paredes Navarro Morales Aguilar Campos
# ]

# # --- UBIGEO AMPLIADO CON 10 DEPARTAMENTOS ---
# UBIGEO_EXTENDED = {
#   "Lima" => {
#     "Lima" => {
#       "Miraflores" => ["Ricardo Palma", "Juana Alarco", "Markham"],
#       "San Isidro" => ["Alfonso Ugarte", "Belén", "San Agustín"],
#       "Surco" => ["Santa María", "San Roque", "Franco Peruano"]
#     }
#   },
#   "Callao" => {
#     "Callao" => {
#       "Callao" => ["Guillermo Billinghurst", "Dos de Mayo", "Ventanilla Alta"],
#       "Bellavista" => ["San Antonio", "Bartolomé Herrera"],
#       "La Perla" => ["La Perla 101", "IEP La Perla"]
#     }
#   },
#   "Arequipa" => {
#     "Arequipa" => {
#       "Cercado" => ["Independencia Americana", "San José"],
#       "Cayma" => ["Lord Byron", "Colegio Cayma"],
#       "Yanahuara" => ["Yanahuara", "Gran Unidad Arequipa"]
#     }
#   },
#   "Cusco" => {
#     "Cusco" => {
#       "Cusco Distrito" => ["Ciencias", "Garcilaso"],
#       "San Sebastián" => ["San Sebastián", "Clorinda Matto"],
#       "San Jerónimo" => ["San Jerónimo", "Fe y Alegría"]
#     }
#   },
#   "Piura" => {
#     "Piura" => {
#       "Piura" => ["Don Bosco", "San Miguel", "Santa Rosa"],
#       "Castilla" => ["Castilla 201", "Cristo Rey"],
#       "Catacaos" => ["Catacaos Central", "IE Señor Cautivo"]
#     }
#   },
#   "La Libertad" => {
#     "Trujillo" => {
#       "Trujillo" => ["Modelo", "San Juan", "La Asunción"],
#       "Florencia de Mora" => ["Florencia IE 101", "IE Redentor"],
#       "El Porvenir" => ["El Porvenir 104", "IE Indoamericano"]
#     }
#   },
#   "Junín" => {
#     "Huancayo" => {
#       "Huancayo" => ["Mariscal Castilla", "Santa Isabel"],
#       "El Tambo" => ["El Tambo 102", "IE Salesiano"],
#       "Chilca" => ["IE Chilca", "Virgen del Carmen"]
#     }
#   },
#   "Puno" => {
#     "Puno" => {
#       "Puno" => ["Glorioso 601", "Colegio Gran Unidad"],
#       "Juliaca" => ["San José", "IE Peru Birf"],
#       "Azángaro" => ["Azángaro Central", "IE San Martín"]
#     }
#   },
#   "Lambayeque" => {
#     "Chiclayo" => {
#       "Chiclayo" => ["San José", "Santa Magdalena Sofía"],
#       "La Victoria" => ["IE La Victoria", "Fe y Alegría 27"],
#       "José Leonardo Ortiz" => ["JLO 102", "IE San Andrés"]
#     }
#   },
#   "Ica" => {
#     "Ica" => {
#       "Ica" => ["San Luis Gonzaga", "Nuestra Señora de Guadalupe"],
#       "Pisco" => ["Pisco 76", "IE Miguel Grau"],
#       "Chincha Alta" => ["Chincha Alta IE", "Colegio América"]
#     }
#   }
# }


# puts "Creando 40 miembros de mesa..."

# 40.times do
#   first_name  = FIRST_NAMES.sample
#   last_name   = LAST_NAMES.sample
#   full_name   = "#{first_name} #{last_name}"

#   department = UBIGEO_EXTENDED.keys.sample
#   province   = UBIGEO_EXTENDED[department].keys.sample
#   district   = UBIGEO_EXTENDED[department][province].keys.sample
#   polling_place = UBIGEO_EXTENDED[department][province][district].sample

#   # DNI válido de 8 dígitos
#   dni = rand(10_000_000..99_999_999).to_s

#   Member.create!(
#     first_name: first_name,
#     last_name: last_name,
#     full_name: full_name,
#     email: "#{first_name.downcase}.#{last_name.downcase}#{rand(100..999)}@mail.com",
#     document_number: dni,
#     document_type: "DNI",
#     gender: [:male, :female].sample,
#     role_member: :mesa_member,       # 👈 AQUÍ EL TIPO DE MIEMBRO
#     department: department,
#     province: province,
#     district: district,
#     polling_place: polling_place
#   )
# end

# puts "¡Listo! Se crearon 40 miembros de mesa con datos reales."
# =================================================================================00000


# --- 100 CIUDADANOS (role_member: :citizen) ---

# # Nombres y apellidos reales
# FIRST_NAMES = %w[
#   Carlos Juan Luis José Pedro Miguel Jorge Alberto Daniel
#   Ricardo Mario Javier Manuel Víctor Enrique Diego Andrés
#   Ana Maria Carmen Rosa Patricia Lucia Daniela Claudia Sofia Elena Teresa
# ]

# LAST_NAMES = %w[
#   Pérez García Rodríguez López Sánchez Gonzales Ramírez Díaz
#   Torres Flores Castillo Herrera Medina Vargas Chávez Rojas
#   Salazar Ruiz Mendoza Paredes Navarro Morales Aguilar Campos
#   Villanueva Castro Bravo Vega Medina
# ]

# # UBIGEO MÁS AMPLIADO (ahora con más variedad)
# UBIGEO_MORE = {
#   "Lima" => {
#     "Lima" => {
#       "Miraflores" => ["Ricardo Palma", "Juana Alarco", "Markham"],
#       "San Isidro" => ["Alfonso Ugarte", "Belén", "San Agustín"],
#       "Surco" => ["Santa María", "San Roque", "Franco Peruano"],
#       "Chorrillos" => ["Mercedes Cabello", "Santa Anita", "IE Manuel Bonilla"],
#       "Comas" => ["IE Comas", "Guillermo Billinghurst", "IE El Maestro"]
#     }
#   },
#   "Arequipa" => {
#     "Arequipa" => {
#       "Cercado" => ["Independencia Americana", "San José"],
#       "Cayma" => ["Lord Byron", "Colegio Cayma"],
#       "Yanahuara" => ["Yanahuara", "Gran Unidad Arequipa"]
#     }
#   },
#   "Cusco" => {
#     "Cusco" => {
#       "Cusco Distrito" => ["Ciencias", "Garcilaso", "San Antonio"],
#       "San Sebastián" => ["San Sebastián", "Clorinda Matto"],
#       "San Jerónimo" => ["San Jerónimo", "Fe y Alegría"]
#     }
#   },
#   "Piura" => {
#     "Piura" => {
#       "Piura" => ["Don Bosco", "San Miguel"],
#       "Castilla" => ["Castilla 201", "Cristo Rey"],
#       "Catacaos" => ["Catacaos Central", "Señor Cautivo"]
#     }
#   },
#   "Junín" => {
#     "Huancayo" => {
#       "Huancayo" => ["Mariscal Castilla", "Santa Isabel"],
#       "El Tambo" => ["El Tambo 102", "Salesiano"],
#       "Chilca" => ["IE Chilca", "Virgen del Carmen"]
#     }
#   },
#   "Loreto" => {
#     "Maynas" => {
#       "Iquitos" => ["Colegio Iquitos", "San Agustín"],
#       "Punchana" => ["Punchana IE 601", "Fe y Alegría 23"]
#     }
#   },
#   "Puno" => {
#     "Puno" => {
#       "Puno" => ["Gran Unidad Puno", "Colegio 601"],
#       "Juliaca" => ["San José", "IE Peru Birf"]
#     }
#   },
#   "Cajamarca" => {
#     "Cajamarca" => {
#       "Cajamarca" => ["San Ramón", "Dos de Mayo"],
#       "Baños del Inca" => ["Colegio Inca", "IE Baños"]
#     }
#   }
# }

# puts "Creando 100 ciudadanos..."

# 100.times do
#   first_name  = FIRST_NAMES.sample
#   last_name   = LAST_NAMES.sample
#   full_name   = "#{first_name} #{last_name}"

#   department = UBIGEO_MORE.keys.sample
#   province   = UBIGEO_MORE[department].keys.sample
#   district   = UBIGEO_MORE[department][province].keys.sample
#   polling_place = UBIGEO_MORE[department][province][district].sample

#   # DNI real de 8 dígitos
#   dni = rand(10_000_000..99_999_999).to_s

#   # Fecha aleatoria del último año
#   created_at = rand(30..365).days.ago
#   updated_at = created_at + rand(1..30).days

#   Member.create!(
#     first_name: first_name,
#     last_name: last_name,
#     full_name: full_name,
#     email: "#{first_name.downcase}.#{last_name.downcase}#{rand(100..999)}@mail.com",
#     document_number: dni,
#     document_type: "DNI",
#     gender: [:male, :female].sample,
#     role_member: :citizen,               # <- aquí el tipo ciudadano
#     department: department,
#     province: province,
#     district: district,
#     polling_place: polling_place,
#     created_at: created_at,
#     updated_at: updated_at
#   )
# end

# puts "¡Listo! Se crearon 100 ciudadanos con datos realistas."
