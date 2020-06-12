## Custom Fields ----------------------------------------

# Custom Fields / Get Accessible Custom Fields
cu_get_list_fields <- function(list_id) {
    .cu_get("list", list_id, "field")
}
