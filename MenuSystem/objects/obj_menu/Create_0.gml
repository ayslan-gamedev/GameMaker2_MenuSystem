m_main = "main";
m_config = "config";
m_exit = "exit";

popup_width = 600;
popup_height = 200;

function change_music_volume() {
    volume = clamp(volume, 0, 1);
    menu_options[0] = "Volume " + string(volume * 100) + "%";
    audio_sound_gain(sound_menu, volume, true);
}

// Refresh the current fullscreen mode to display it in menu options text
function reload_fullscreen() {
    // Show in menu options the value to change in the current fullscreen mode
    // If the current screen is full, the player can switch to windowed mode
    if (!window_get_fullscreen()) {
        fullscreen_text = "Full Screen";
    } else {
        fullscreen_text = "Windowed";
    }

    // Update screen mode option
    menu_options[1] = fullscreen_text;
}

// Change menu values
function change_menu(_menu) {
    // Change the current menu value
    current_menu = _menu;
    // Reset the selected option
    selected_option = 0;

    // Set the values of the menu, like array options and functions resulting from selecting these options
    switch (current_menu) {
        // The main menu values
        case m_main:
            menu_sample_text = [""];
            menu_options = ["Play", "Settings", "Exit"];
            separation_options = 100;
            menu_options_functions = [
                room_goto_next,
                function() { change_menu("config"); },
                function() { change_menu("exit"); }
            ];
            break;

        // The configuration menu values
        case m_config:
            reload_fullscreen();
            menu_sample_text = ["Settings"];
            menu_options = ["Volume " + string(volume * 100) + "%", string(fullscreen_text), "Back"];
            menu_options_functions = [
                function() { },
                function() {
                    window_set_fullscreen(!window_get_fullscreen());
                    reload_fullscreen();
                },
                function() { change_menu("main"); }
            ];
            break;

        // The exit pop-up values
        case m_exit:
            menu_sample_text = ["Do you really want to exit?"];
            menu_options = ["Yes", "No"];
            separation_options = 50;
            menu_options_functions = [
                game_end,
                function() { change_menu("main"); }
            ];
            break;
    }

    // Set the length of menu options
    menu_options_length = array_length(menu_options);
}

sound_menu = snd_menu;
volume = 0.2;

////// Temporary variables //////
// Do not change the values of these variables; they are here just to be accessed by any object event.
// They will have their values changed during runtime.

menu_sample_text = [];
separation_options = 100;
menu_options = [];				// Names of options as they will be displayed on the screen
menu_options_functions = [];	// Functions to be loaded when the player selects an option
menu_options_length = 0;

// Distance between options when they are displayed (font size not included)
distance_between_options_text = 55;

// Returns true if the player presses the left mouse button
mouse_clicked = false;

// The current option selected by the player
selected_option = 0;

// Set the start menu value
current_menu = "main";

// Load the first menu
change_menu(current_menu);
