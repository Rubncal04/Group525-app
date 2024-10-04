# db/seeds.rb

colombia = Country.find_or_create_by(id: 1, name: 'Colombia')

# Lista de departamentos de Colombia
states = [
  { name: 'Amazonas' },
  { name: 'Antioquia' },
  { name: 'Arauca' },
  { name: 'Atlántico' },
  { name: 'Bolívar' },
  { name: 'Boyacá' },
  { name: 'Caldas' },
  { name: 'Caquetá' },
  { name: 'Casanare' },
  { name: 'Cauca' },
  { name: 'Cesar' },
  { name: 'Chocó' },
  { name: 'Córdoba' },
  { name: 'Cundinamarca' },
  { name: 'Guainía' },
  { name: 'Guaviare' },
  { name: 'Huila' },
  { name: 'La Guajira' },
  { name: 'Magdalena' },
  { name: 'Meta' },
  { name: 'Nariño' },
  { name: 'Norte de Santander' },
  { name: 'Putumayo' },
  { name: 'Quindío' },
  { name: 'Risaralda' },
  { name: 'San Andrés y Providencia' },
  { name: 'Santander' },
  { name: 'Sucre' },
  { name: 'Tolima' },
  { name: 'Valle del Cauca' },
  { name: 'Vaupés' },
  { name: 'Vichada' }
]

# Crear los departamentos en la base de datos
states.each do |state|
  State.find_or_create_by(name: state[:name], country_id: colombia.id)
end

puts "Se han creado o actualizado los departamentos de Colombia."

# Se buscan los estados en la base de datos
col_states = State.all

# Se organiza la data de tal forma que pueda agruparse por estados
cities_by_state = {
  'Amazonas' => ['Leticía'],
  'Antioquia' => ['Medellín', 'Bello', 'Itagüí'],
  'Arauca' => ['Arauca'],
  'Atlántico' => ['Barranquilla', 'Baranoa', 'Soledad'],
  'Bolívar' => ['Cartagena'],
  'Cundinamarca' => ['Bogotá', 'Soacha', 'Chía'],
  'Valle del Cauca' => ['Cali', 'Palmira', 'Buenaventura'],
}

col_states.each do |state|
  if cities_by_state.key?(state.name)
    cities_by_state[state.name].each do |city_name|
      City.create(name: city_name, state_id: state.id)
    end
  end
end

puts "Ciudades creadas exitosamente."
