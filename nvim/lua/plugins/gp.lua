return {
  "robitx/gp.nvim",
  config = function()
    require("gp").setup({
      hooks = {
        -- example of adding command which explains the selected code
        Explain = function(gp, params)
          local template = "I have the following code from {{filename}}:\n\n"
          .. "```{{filetype}}\n{{selection}}\n```\n\n"
          .. "Please respond by explaining the code above."
          local agent = gp.get_chat_agent()
          gp.Prompt(params, gp.Target.popup, nil, agent.model, template, agent.system_prompt)
        end,
      }
    })
  end
}
