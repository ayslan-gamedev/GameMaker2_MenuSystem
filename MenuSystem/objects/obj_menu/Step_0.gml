// Iterate through the menu options and calculate the "selection box" for each option
for (var _i = 0; _i < menu_options_length; _i++) {
    // Calculate the "selection box" for clicking on an option
    // Calculate the width of the "selection box"
    var _x1 = display_get_width() / 2 - string_width(menu_options[_i]) / 2;
    var _x2 = _x1 + string_width(menu_options[_i]);

    // Calculate the height of the "selection box"
    var _y1 = display_get_height() / 2 + (distance_between_options_text * _i) - font_get_size(fnt_menu) / 2;
    var _y2 = _y1 + font_get_size(fnt_menu);

    // Check if the mouse pointer is inside the selection area
    if (mouse_x >= _x1 && mouse_x <= _x2 && mouse_y >= _y1 && mouse_y <= _y2) {
        selected_option = _i;

        // Check if the player pressed the mouse button
        if (mouse_clicked) {
            menu_selection(menu_options_functions, selected_option);
        }
    }
}

// Check if the player pressed the mouse button and reset the "clicked" value to enable actions inside the for loop
if (mouse_check_button_pressed(mb_left)) {
    mouse_clicked = true;
} else {
    mouse_clicked = false;
}
