// Call a function from the menu options based on the selected option
// _options is an array of functions
// _selected_option is an integer representing the selected option in the array
function menu_selection(_options, _selected_option) {
    if (_selected_option >= 0 && _selected_option < array_length(_options)) {
        _options[_selected_option]();
    }
}
