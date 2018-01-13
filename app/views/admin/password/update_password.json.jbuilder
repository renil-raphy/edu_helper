json.result @result_str
json.error_str (@result_str == "yes") ? "" : @admin.errors.messages
