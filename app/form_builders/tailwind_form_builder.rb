class TailwindFormBuilder < ActionView::Helpers::FormBuilder
  include ActionView::Helpers::TagHelper

  def label(method, text = nil, opts = {}, &block)
    default_opts = {class: "block cursor-pointer text-white"}
    merged_opts = default_opts.merge(opts)
    super(method, text, merged_opts, &block)
  end

  def text_field(method, opts = {})
    default_opts = {class: input_classes}
    merged_opts = default_opts.merge(opts)
    super(method, merged_opts)
  end

  def email_field(method, opts = {})
    default_opts = {class: input_classes}
    merged_opts = default_opts.merge(opts)
    super(method, merged_opts)
  end

  def password_field(method, opts = {})
    default_opts = {class: input_classes}
    merged_opts = default_opts.merge(opts)
    super(method, merged_opts)
  end

  def check_box(method, opts = {}, checked_value = "1", unchecked_value = "0")
    default_opts = {class: "rounded"}
    merged_opts = default_opts.merge(opts)
    super(method, merged_opts, checked_value, unchecked_value)
  end

  def select(method, choices = nil, opts = {}, html_opts = {}, &block)
    default_opts = {class: select_classes}
    merged_opts = default_opts.merge(html_opts)
    super(method, choices, opts, merged_opts, &block)
  end

  def datetime_field(method, opts = {})
    default_opts = {class: input_classes}
    merged_opts = default_opts.merge(opts)
    super(method, merged_opts)
  end

  def submit(value = nil, opts = {})
    default_opts = {class: button_classes}
    merged_opts = default_opts.merge(opts)
    super(value, merged_opts)
  end

  private

  def input_classes
    "text-zinc-900 mt-1 block w-full rounded-md"
  end

  def select_classes
    "ml-7 mt-1 md:m-0 bg-zinc-900 text-white rounded-md border-zinc-800 " \
    "focus:ring-black focus:border-transparent py-1"
  end

  def button_classes
    "justify-center inline-flex items-center px-4 py-2 border rounded-md " \
    "font-semibold text-xs uppercase tracking-widest transition ease-in-out " \
    "duration-150 focus:outline-none disabled:opacity-25 cursor-pointer " \
    "bg-black text-white border-transparent hover:bg-red-600 active:bg-red-600"
  end
end
