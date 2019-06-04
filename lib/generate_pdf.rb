require 'prawn'
require 'gruff'

module GeneratePdf
  PDF_OPTIONS = {
    # Escolhe o Page size como uma folha A4
    :page_size   => "A4",
    # Define o formato do layout como portrait (poderia ser landscape)
    :page_layout => :portrait,
    # Define a margem do documento
    :margin      => [40, 75]
  }

  def self.ticket ticket
    ## Gráfico 1 ##
    # Formata os dados para gerar o gráfico (Não se preocupe com isso, apenas saiba que nesse gráfico os dados de label precisa entrar como um hash)
    tickets_labels = {}
    ticket.each_with_index {|u,i| tickets_labels[i] = u[0].to_s}

    # Cria um objeto Gruff (gerador de gráfico)
    g = Gruff::Bar.new(1000)
    g.sort = false  # Do NOT sort data based on values


    g.y_axis_increment = 1  # Points shown on the Y axis


    g.font = '/Library/Fonts/NuevaStd-BoldCond.otf' # Path to a custom font

        # Esconde a legenda
    g.hide_legend = true
    # Escolhe o tamanho da Font
    g.marker_font_size = 10
    # Escolhe as cores que serão usadas
    g.theme = {   # Declare a custom theme
    :colors => %w(orange purple green white red #cccccc), # colors can be described on hex values (#0f0f0f)
    :marker_color => 'black', # The horizontal lines color
    :background_colors => %w(white grey) # you can use instead: :background_image => ‘some_image.png’
    }
    # Aqui nós colocamos os dados y da tabela
    g.data 'Savings', ticket.map {|u| u[1]}
    # Aqui colocamos os dados que formatamos antes da coluna x
    g.labels = tickets_labels
    # Gera a imagem no diretório público (você pode escolher onde gerar)
    g.write('public/graph.jpg')


    ## Gráfico 2 ##
    # Estamos colocando nossos dados direto em @datasets para preencher o gráfico 2
    @datasets = ticket
    # Cria o objeto Gruff
    g = Gruff::Pie.new 900
    g.theme = Gruff::Themes::PASTEL

    # Aqui ele formata nossos dados
    @datasets.each do |data|
      g.data(data[0], data[1])
    end

    # Aqui ele gera a imagem do gráfico
    g.write("public/graph_pie.jpg")


    # Inicia nosso PDF

    Prawn::Document.new(PDF_OPTIONS) do |pdf|
      # Define a cor do traçado
      pdf.fill_color "666666"
      # Cria um título com tamanho 28 PDF Points, bold alinha no centro
      pdf.text "Gráficos de Atendimentos", :size => 28, :style => :bold, :align => :center
      # Move 60 PDF points para baixo o cursor
      pdf.move_down 60
      # Escreve mais um texto sobre o gráfico
      pdf.text "Quantidade de atendimentos gerados por usuário no dia.", size: 14, color: '000000', align: :center
      # Inclui a imagem com o gráfico na escala 0.50 para diminuir pela metade a imagem
      pdf.image "public/graph.jpg", :scale => 0.50
      # Inclui em baixo da folha do lado direito a data e o numero da página usando a tag page
      pdf.number_pages "Gerado: #{(Time.now).strftime("%d/%m/%y as %H:%M")} - Página ", :start_count_at => 0, :page_filter => :all, :at => [pdf.bounds.right - 140, 7], :align => :right, :size => 8
      # Muda de página para incluir o outro gráfico
      pdf.start_new_page
      # Move 60 PDF points para baixo o cursor
      pdf.move_down 20
      # Escreve mais um texto sobre o gráfico
      pdf.text "Porcentagens de atendimentos gerados por usuário no dia", size: 14, color: '000000', align: :center
      # Incluir o gráfico numero 2
      pdf.image "public/graph_pie.jpg", :scale => 0.50
      # Inclui em baixo da folha do lado direito a data e o numero da página usando a tag page
      pdf.number_pages "Gerado: #{(Time.now).strftime("%d/%m/%y as %H:%M")} - Página ", :start_count_at => 0, :page_filter => :all, :at => [pdf.bounds.right - 140, 7], :align => :right, :size => 8
      # Gera nosso pdf no diretório public
      pdf.render_file('public/ticket.pdf')
    end
  end

end
