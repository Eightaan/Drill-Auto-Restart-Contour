Hooks:PostHook(Drill, "set_jammed", "AutoRestart_set_jammed", function(self, jammed)
    local interaction = self._unit:interaction()

    if not interaction then
        return
    end

    interaction._autorestart_success = jammed and self._autorepair_clbk_id ~= nil

    if interaction._autorestart_success then
        for _, material in ipairs(interaction._materials or {}) do
            if alive(material) then
                material:set_variable(Idstring("contour_color"), Color.purple)
            end
        end
    end
end)