# frozen_string_literal: true

# Application Helper
module ApplicationHelper
  def read_svg(name: '', klass: nil, id: nil)
    svg_name = name.downcase.gsub('_', '-').gsub(' ', '-')
    svg_file_path = "#{Rails.root}/app/assets/images/#{svg_name}.svg"
    if File.exist?(svg_file_path)
      svg_file = File.read(svg_file_path)
      svg_file = svg_file.gsub('<svg', "<svg class='#{klass}'").html_safe if klass.present?
      svg_file = svg_file.gsub('<svg', "<svg id='#{id}'").html_safe if id.present?
      svg_file
    else
      content_tag(:span, "Invalid SVG Name #{name}")
    end
  end

  def sidebar_options
    [
      { title: 'home', url: dashboard_path }, { title: 'form', url: form_path }, { title: 'cards', url: cards_path },
      { title: 'charts', url: charts_path }, { title: 'buttons', url: buttons_path }, { title: 'modals', url: modals_path },
      { title: 'tables', url: tables_path }, { title: 'pages', menu_items: [
        { title: 'login', url: '#' }, { title: 'create account', url: '#' }, { title: 'forget password', url: '#' },
        { title: '404', url: '#' }, { title: 'blank', url: '#' }
      ] }
    ]
  end
end
