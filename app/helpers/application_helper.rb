# frozen_string_literal: true

# Application Helper
module ApplicationHelper
  def read_svg(name: '', klass: nil, id: nil)
    svg_location = svg_file_location(name)
    if File.exist?(svg_location)
      svg_file = File.read(svg_location)
      svg_file = svg_file.gsub('<svg', "<svg class='#{klass}'").html_safe if klass.present?
      svg_file = svg_file.gsub('<svg', "<svg id='#{id}'").html_safe if id.present?
      svg_file
    else
      content_tag(:span, "Invalid SVG Name #{name.t_s}")
    end
  end

  def sidebar_options
    [
      { title: :home, url: dashboard_path }, { title: :users, url: users_path }, { title: :form, url: form_path },
      { title: :cards, url: cards_path }, { title: :charts, url: charts_path }, { title: :buttons, url: buttons_path },
      { title: :modals, url: modals_path },
      { title: :tables, url: tables_path },
      { title: :pages, menu_items: [
        { title: 'login', url: '#' }, { title: 'create account', url: '#' }, { title: 'forget password', url: '#' },
        { title: '404', url: '#' }, { title: 'blank', url: '#' }
      ] }
    ]
  end

  private

  def svg_file_location(svg_name)
    svg_name = svg_name.to_s.downcase.gsub('_', '-').gsub(' ', '-')
    "#{Rails.root}/app/assets/images/#{svg_name}.svg"
  end
end
