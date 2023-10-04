// Decrease the selected option
selected_option--;

// If the selected option becomes less than 0, wrap around to the maximum value of menu options
if (selected_option < 0) {
    selected_option = menu_options_length - 1;
}
