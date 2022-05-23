spec_members <- spec_df(
    id = tib_chr("id", transform = as.character),
    username = tib_chr("username"),
    email = tib_chr("email"),
    color = tib_chr("color"),
    initials = tib_chr("initials"),
    profilePicture = tib_chr("profilePicture"),
    profileInfo = tib_row(
        "profileInfo",
        display_profile = tib_lgl("display_profile"),
        verified_ambassador = tib_unspecified("verified_ambassador"),
        verified_consultant = tib_unspecified("verified_consultant"),
        top_tier_user = tib_unspecified("top_tier_user"),
        viewed_verified_ambassador = tib_unspecified(
            "viewed_verified_ambassador"
        ),
        viewed_verified_consultant = tib_unspecified(
            "viewed_verified_consultant"
        ),
        viewed_top_tier_user = tib_unspecified("viewed_top_tier_user")
    )
)
