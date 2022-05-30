local status_ok, comment = pcall(require, "Comment")
if not status_ok then
    return
end

local status_ok, comment_utils = pcall(require, "Comment.utils")
if not status_ok then
    return
end

local status_ok, tsconfig = pcall(require, "nvim-treesitter.configs")
if not status_ok then
    return
end

local status_ok, tsccu = pcall(require, "ts_context_commentstring.utils")
if not status_ok then
    return
end

local status_ok, tscci = pcall(require, "ts_context_commentstring.internal")
if not status_ok then
    return
end

comment.setup({
    pre_hook = function(ctx)
        local location = nil
        if ctx.ctype == comment_utils.ctype.block then
            location = tsccu.get_cursor_location()
        elseif ctx.cmotion == comment_utils.v or ctx.cmotion == comment_utils.V then
            location = tsccu.get_visual_start_location()
        end

        return tscci.calculate_commentstring {
            key = ctx.ctype == comment_utils.ctype.line and '__default' or '__multiline',
            location = location
        }
    end,
})
