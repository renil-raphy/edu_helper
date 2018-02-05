json.result (@password_updated == true) ? "yes" : "error"
json.error_str (@password_updated == true) ? "" : @user.errors.messages
