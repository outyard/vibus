/// @param {real} variable
/// @param {real} speed
/// @param {real} value

if (argument0 < argument2) {
    return min(argument0 + argument1, argument2);
}
else {
    return max(argument0 - argument1, argument2);
}
