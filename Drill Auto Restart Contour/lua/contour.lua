-- This will just fix the contour going back to its default color when selecting it
Hooks:PostHook(BaseInteractionExt, "set_contour", "AutoRestart_set_contour", function(self, color, opacity)
    if not self._autorestart_success or color ~= "standard_color" then
        return
    end

    for _, material in ipairs(self._materials or {}) do
        if alive(material) then
            material:set_variable(Idstring("contour_color"), Color.purple)
        end
    end
end)