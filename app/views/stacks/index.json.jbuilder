json.array!(@stacks) do |stack|
  json.extract! stack, :id, :title, :subject
  json.url stack_url(stack, format: :json)
end
