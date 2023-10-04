// array with all menu options
menu_options = ["Play", "Settings", "Exit"];				// names of options as they will be displayed on the screen
menu_options_functions = [room_goto_next, "", game_end];	// functions to be loaded when the player selects an option
menu_options_length = array_length(menu_options);			// the length of menu options

// distance between options when they are displayed (font size not included)
distance_between_options_text = 55;

////// temp variables //////
// Do not change the values of these variables; they are here just to be accessed by any object event.
// They will have their values changed during runtime.

// returns true if the player presses the left mouse button
mouse_clicked = false;

// the current option selected by the player
selected_option = 0;
