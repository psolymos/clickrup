spec_members <- tspec_df(
    tib_chr("id", transform = as.character),
    tib_chr("username"),
    tib_chr("email"),
    tib_chr("color"),
    tib_chr("initials"),
    tib_chr("profilePicture"),
    tib_row(
        "profileInfo",
        tib_lgl("display_profile"),
        # tib_unspecified("verified_ambassador"),
        # tib_unspecified("verified_consultant"),
        # tib_unspecified("top_tier_user"),
        # tib_unspecified("viewed_verified_ambassador"),
        # tib_unspecified("viewed_verified_consultant"),
        # tib_unspecified("viewed_top_tier_user"),
    ),
)
