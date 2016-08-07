module ApplicationHelper
	class HTMLwithPygments < Redcarpet::Render::HTML
    def block_code(code, language)
      Pygments.highlight(code, lexer: language)
    end
  end

	def markdown(text)
		renderer = HTMLwithPygments.new(hard_wrap: true, filter_html: true)
		options = {
			no_intra_emphasis: true,
			autolinks: true,
			fenced_code_blocks: true,
			disable_indented_code_blocks: true,
			strikethrough: true,
			lax_spacing: true,
			superscript: true,
			underline: true
		}

		Redcarpet::Markdown.new(renderer, options).render(text).html_safe
	end

	def resource_name
		:user
	end

	def resource
		@resource ||= User.new
	end

	def devise_mapping
		@devise_mapping ||= Devise.mappings[:user]
	end
end
