module ApplicationHelper
  def form_field_with_error(form, field, label_text)
    has_error = form.object.errors[field].any?

    content_tag :div do
      label = form.label(field, label_text, class: "block mb-1 text-sm text-gray-700")

      input = form.text_field(field,
        class: "w-full px-3 py-2 border rounded focus:outline-none " +
               (has_error ?
                "border-red-500 focus:ring-2 focus:ring-red-300" :
                "border-gray-300 focus:ring-2 focus:ring-gray-300")
      )

      error = if has_error
        content_tag(:p,
          form.object.errors[field].first,
          class: "text-sm text-red-500 mt-1"
        )
      end

      safe_join([label, input, error].compact)
    end
  end
end
