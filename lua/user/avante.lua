local ok, avante = pcall(require, "avante")
if not ok then
  return
end

avante.setup({
  -- debug = true,
  provider = "openai",
  providers = {
    openai = {
      model = "gpt-5-nano",
      extra_request_body = {
        temperature = 0.7,
      },
    },
  },
})
