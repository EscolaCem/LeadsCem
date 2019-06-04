Company.create!(name: 'Mix')
Company.create!(name: 'Cem')
Company.create!(name: 'Unopar Manhuaçu')
Company.create!(name: 'Admin')

Source.create!(name: 'Online - Facebook')
Source.create!(name: 'Online - WhatsApp')
Source.create!(name: 'Online - Landing Page')
Source.create!(name: 'Online - Formulário')
Source.create!(name: 'Ligação')
Source.create!(name: 'Visita')
Source.create!(name: 'Externo')
Source.create!(name: 'Indicação')
Source.create!(name: 'SMS')
Source.create!(name: 'Macro')
Source.create!(name: 'Cem')
Source.create!(name: 'Unopar')
Source.create!(name: 'Mix')

User.create!(name: 'Raphael', kind: :superadmin, email: 'admin@admin',
            password: '123456', company: Company.last)
User.create!(name: 'Vanessa', kind: :superadmin, email: 'vanessa.souza@escolacem.com.br',
            password: '123456', company: Company.last)
User.create!(name: 'João Pedro', kind: :superadmin, email: 'joaopedro@admin',
                        password: '123456', company: Company.last)
User.create!(name: 'João Victor', kind: :superadmin, email: 'joaovictor@admin',
                            password: '123456', company: Company.last)
User.create!(name: 'Italo', kind: :manager, email: 'italo.volotao@escolacem.com.br',
                        password: '123456', company: Company.first)
User.create!(name: 'Cleiton', kind: :salesman, email: 'cleiton.goncalves@escolacem.com.br',
                        password: '123456', company: Company.first)
User.create!(name: 'Paloma', kind: :salesman, email: 'paloma.vieira@escolacem.com.br',
                        password: '123456', company: Company.first)
User.create!(name: 'Sabrina Paiva', kind: :manager, email: 'sabrina.paiva@escolacem.com.br',
                        password: '123456', company: Company.third)
User.create!(name: 'Jusselma', kind: :salesman, email: 'jusselma.campos@escolacem.com.br',
                        password: '123456', company: Company.third)
User.create!(name: 'Nova', kind: :salesman, email: 'nova@escolacem.com.br',
                        password: '123456', company: Company.third)
User.create!(name: 'Manuela Xavier', kind: :manager, email: 'manuela.xavier@escolacem.com.br',
                            password: '123456', company: Company.second)
User.create!(name: 'Sabrina Pazeli', kind: :manager, email: 'sabrina.pazeli@escolacem.com.br',
                                password: '123456', company: Company.second)
User.create!(name: 'Fabia Vargas', kind: :salesman, email: 'fabia.vargas@escolacem.com.br',
                                password: '123456', company: Company.second)
User.create!(name: 'Gabi', kind: :salesman, email: 'gabi.lacerda@escolacem.com.br',
                                password: '123456', company: Company.second)
