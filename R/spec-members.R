spec_members <- lcols(
    id = lcol_chr("id", .parser = as.character),
    username = lcol_chr("username"),
    email = lcol_chr("email"),
    color = lcol_chr("color"),
    initials = lcol_chr("initials"),
    profilePicture = lcol_chr("profilePicture")
)
