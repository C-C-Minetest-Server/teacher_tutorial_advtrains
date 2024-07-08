-- teacher_tutorial_advtrains/init.lua
-- Tutorial for Advanced Trains
-- Copyright (C) 2024  1F616EMO
-- SPDX-License-Identifier: LGPL-3.0-or-later

local S = minetest.get_translator("teacher_tutorial_advtrains")

local overrun_msg = S("Under no circumstances should you stay or walk on train tracks. " ..
    "Get onto a train, let it bring you to your destination, sit back, and relax.")

do
    -- none, drop, normal
    local setting_overrun_mode = minetest.settings:get("advtrains_overrun_mode")

    if setting_overrun_mode == "drop" or setting_overrun_mode == "normal" then
        overrun_msg = S("Under no circumstances should you stay or walk on train tracks. " ..
            "Getting hit by a running train is fatal! " ..
            "Get onto a train, let it bring you to your destination, sit back, and relax.")
    end
end

teacher.register_turorial("teacher_tutorial_advtrains:about_trains", {
    title = S("About Trains..."),
    show_on_unlock = true,
    show_disallow_close = true,
    triggers = {
        {
            name = "approach_node",
            nodenames = "group:platform",
        },
        {
            name = "approach_node",
            nodenames = "group:advtrains_track",
            radius = 5,
        }
    },

    {
        texture = "teacher_tutorial_advtrains_teacher_1.png",
        text = S("Trains are vehicles automatically running on their track. " ..
                "They connect distinct locations, providing convenient access to faraway areas.") .. "\n\n" ..
            S("Trains show information to players by having an external display of the line number, " ..
                "and texts shown on the HUD upon hovering over the train.") .. "\n\n" ..
            S("Trains often come with several wagons; each wagon can hold up a few passengers."),
    },
    {
        texture = "teacher_tutorial_advtrains_teacher_2.png",
        text = S("Only trains with opened doors allow players to go on board. " ..
                "To board a train, walk inside a wagon with opened doors.") .. "\n\n" ..
            S("To leave a train, wait for the door to open, then try to walk inside the train. " ..
                "You will be teleported out of the train, and onto the platform, if any.") .. "\n\n" ..
            S("Alternatively, right-click (tap on mobile) the train to board or exit the train."),
    },
    {
        texture = "teacher_tutorial_advtrains_teacher_3.png",
        text = S("Inside the train, texts may be displayed at the bottom showing the next station name. " ..
                "Get ready to leave the train once your destination shows up.") .. "\n\n" ..
            S("Once the train is at a certain station, its name is displayed similarly."),
    },
    {
        texture = "teacher_tutorial_advtrains_teacher_4.png",
        text = overrun_msg .. "\n\n" ..
            S("For the same reasons, you should never attempt to get off the train mid-journey. " ..
                "If you are in an emergency, hold down sneak (shift on computers) when you right-click."),
    },
})
