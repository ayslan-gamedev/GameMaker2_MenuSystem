// Increase the selected option
selected_option++;

// If the selected option becomes greater than the maximum index, wrap around to the first option
if (selected_option > menu_options_length - 1) {
    selected_option = 0;
}
