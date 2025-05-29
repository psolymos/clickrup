# output

    Code
      cu_get_teams()
    Output
      $teams
      $teams[[1]]
      $teams[[1]]$id
      [1] "1234"
      
      $teams[[1]]$name
      [1] "My ClickUp Team"
      
      $teams[[1]]$color
      [1] "#000000"
      
      $teams[[1]]$avatar
      [1] "https://clickup.com/avatar.jpg"
      
      $teams[[1]]$members
      $teams[[1]]$members[[1]]
      $teams[[1]]$members[[1]]$user
      $teams[[1]]$members[[1]]$user$id
      [1] 123
      
      $teams[[1]]$members[[1]]$user$username
      [1] "John Doe"
      
      $teams[[1]]$members[[1]]$user$color
      [1] "#000000"
      
      $teams[[1]]$members[[1]]$user$profilePicture
      [1] "https://clickup.com/avatar.jpg"
      
      
      
      
      
      

# data frame output

    Code
      df_teams <- cuf_get_teams()
      df_teams
    Output
      # A tibble: 1 x 5
        id    name            color   avatar                                   members
        <chr> <chr>           <chr>   <chr>                          <list<tibble[,1]>
      1 1234  My ClickUp Team #000000 https://clickup.com/avatar.jpg           [1 x 1]
    Code
      df_teams$members
    Output
      <list_of<
        tbl_df<user:tbl_df<
          id            : character
          username      : character
          color         : character
          profilePicture: character
        >>
      >[1]>
      [[1]]
      # A tibble: 1 x 1
        user$id $username $color  $profilePicture               
        <chr>   <chr>     <chr>   <chr>                         
      1 123     John Doe  #000000 https://clickup.com/avatar.jpg
      

