# Type-stable wrappers via tibblify

Goal: A `cuf_*()` function for each `cu_()` function that returns a tibble with a known structure.

## Working examples

- [x] `cu_get_folders()`
- [x] `cu_get_lists()`
- [x] `cu_get_tasks()`
- [x] `cu_get_filtered_team_tasks()`
- [x] `cu_get_time_entries_within_date_range()`
- [x] `cu_get_singular_time_entry()`
- [x] `cu_get_list_members()`

## Building blocks

- `R/df-*.R`: started as copies of `R/api-*.R`, need adaptation
- `script/tibblify-??-*.R`: scripts that access the API to generate specs from data
- `R/spec-*.R`: generated from `script/tibblify-??-*.R`
-  `R/tibblify.R`: tooling

## How to extend

- Pick an entity type
- Make a copy of an existing `script/tibblify-??-*.R`
- Adapt to collect data matching this entity type
- Run the script
- Adapt the `cuf_*()` functions following existing examples
- Test, perhaps as part of the same script (after another `pkgload::load_all()`)

## Test instance

For testing, I created a throwaway ClickUp workspace that can be populated with the `create.R` script.
The data in a live workspace is richer, but modification and deletion can only reliably be tested on a toy workspace.
The "team ID" is hard-coded in `create.R` to ensure that the code doesn't accidentally wipe the live workspace.

## Technical debt

- Fix warnings in `devtools::document()` -- delete first four lines in most `df-*.R` files
- Enhance `create.R` script
    - Rerun `tibblify-all.R`, ensure that the generated specs are not worse than the existing specs
- Add tests against toy workspace

## Problems

### Deletion

`cu_delete_*()` often returns an empty list. It feels more consistent to keep the wrappers here, even if they return an empty tibble.

### Visible vs. invisible return

Should `POST` and `PUT` methods return invisibly?
