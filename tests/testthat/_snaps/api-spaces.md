# output

    Code
      cu_get_spaces("1234")
    Output
      $spaces
      $spaces[[1]]
      $spaces[[1]]$id
      [1] "790"
      
      $spaces[[1]]$name
      [1] "Updated Space Name"
      
      $spaces[[1]]$private
      [1] FALSE
      
      $spaces[[1]]$statuses
      $spaces[[1]]$statuses[[1]]
      $spaces[[1]]$statuses[[1]]$status
      [1] "to do"
      
      $spaces[[1]]$statuses[[1]]$type
      [1] "open"
      
      $spaces[[1]]$statuses[[1]]$orderindex
      [1] 0
      
      $spaces[[1]]$statuses[[1]]$color
      [1] "#d3d3d3"
      
      
      $spaces[[1]]$statuses[[2]]
      $spaces[[1]]$statuses[[2]]$status
      [1] "complete"
      
      $spaces[[1]]$statuses[[2]]$type
      [1] "closed"
      
      $spaces[[1]]$statuses[[2]]$orderindex
      [1] 1
      
      $spaces[[1]]$statuses[[2]]$color
      [1] "#6bc950"
      
      
      
      $spaces[[1]]$multiple_assignees
      [1] FALSE
      
      $spaces[[1]]$features
      $spaces[[1]]$features$due_dates
      $spaces[[1]]$features$due_dates$enabled
      [1] FALSE
      
      $spaces[[1]]$features$due_dates$start_date
      [1] FALSE
      
      $spaces[[1]]$features$due_dates$remap_due_dates
      [1] FALSE
      
      $spaces[[1]]$features$due_dates$remap_closed_due_date
      [1] FALSE
      
      
      $spaces[[1]]$features$time_tracking
      $spaces[[1]]$features$time_tracking$enabled
      [1] FALSE
      
      
      $spaces[[1]]$features$tags
      $spaces[[1]]$features$tags$enabled
      [1] FALSE
      
      
      $spaces[[1]]$features$time_estimates
      $spaces[[1]]$features$time_estimates$enabled
      [1] FALSE
      
      
      $spaces[[1]]$features$checklists
      $spaces[[1]]$features$checklists$enabled
      [1] TRUE
      
      
      $spaces[[1]]$features$custom_fields
      $spaces[[1]]$features$custom_fields$enabled
      [1] TRUE
      
      
      $spaces[[1]]$features$remap_dependencies
      $spaces[[1]]$features$remap_dependencies$enabled
      [1] FALSE
      
      
      $spaces[[1]]$features$dependency_warning
      $spaces[[1]]$features$dependency_warning$enabled
      [1] FALSE
      
      
      $spaces[[1]]$features$portfolios
      $spaces[[1]]$features$portfolios$enabled
      [1] FALSE
      
      
      
      
      $spaces[[2]]
      $spaces[[2]]$id
      [1] "791"
      
      $spaces[[2]]$name
      [1] "Second Space Name"
      
      $spaces[[2]]$private
      [1] FALSE
      
      $spaces[[2]]$statuses
      $spaces[[2]]$statuses[[1]]
      $spaces[[2]]$statuses[[1]]$status
      [1] "Open"
      
      $spaces[[2]]$statuses[[1]]$type
      [1] "open"
      
      $spaces[[2]]$statuses[[1]]$orderindex
      [1] 0
      
      $spaces[[2]]$statuses[[1]]$color
      [1] "#d3d3d3"
      
      
      $spaces[[2]]$statuses[[2]]
      $spaces[[2]]$statuses[[2]]$status
      [1] "Closed"
      
      $spaces[[2]]$statuses[[2]]$type
      [1] "closed"
      
      $spaces[[2]]$statuses[[2]]$orderindex
      [1] 1
      
      $spaces[[2]]$statuses[[2]]$color
      [1] "#6bc950"
      
      
      
      $spaces[[2]]$multiple_assignees
      [1] TRUE
      
      $spaces[[2]]$features
      $spaces[[2]]$features$due_dates
      $spaces[[2]]$features$due_dates$enabled
      [1] TRUE
      
      $spaces[[2]]$features$due_dates$start_date
      [1] FALSE
      
      $spaces[[2]]$features$due_dates$remap_due_dates
      [1] FALSE
      
      $spaces[[2]]$features$due_dates$remap_closed_due_date
      [1] FALSE
      
      
      $spaces[[2]]$features$time_tracking
      $spaces[[2]]$features$time_tracking$enabled
      [1] TRUE
      
      
      $spaces[[2]]$features$tags
      $spaces[[2]]$features$tags$enabled
      [1] TRUE
      
      
      $spaces[[2]]$features$time_estimates
      $spaces[[2]]$features$time_estimates$enabled
      [1] TRUE
      
      
      $spaces[[2]]$features$checklists
      $spaces[[2]]$features$checklists$enabled
      [1] TRUE
      
      
      
      
      

---

    Code
      cu_get_spaces("1234", archived = TRUE)
    Output
      $spaces
      $spaces[[1]]
      $spaces[[1]]$id
      [1] "790"
      
      $spaces[[1]]$name
      [1] "Updated Space Name"
      
      $spaces[[1]]$private
      [1] FALSE
      
      $spaces[[1]]$statuses
      $spaces[[1]]$statuses[[1]]
      $spaces[[1]]$statuses[[1]]$status
      [1] "to do"
      
      $spaces[[1]]$statuses[[1]]$type
      [1] "open"
      
      $spaces[[1]]$statuses[[1]]$orderindex
      [1] 0
      
      $spaces[[1]]$statuses[[1]]$color
      [1] "#d3d3d3"
      
      
      $spaces[[1]]$statuses[[2]]
      $spaces[[1]]$statuses[[2]]$status
      [1] "complete"
      
      $spaces[[1]]$statuses[[2]]$type
      [1] "closed"
      
      $spaces[[1]]$statuses[[2]]$orderindex
      [1] 1
      
      $spaces[[1]]$statuses[[2]]$color
      [1] "#6bc950"
      
      
      
      $spaces[[1]]$multiple_assignees
      [1] FALSE
      
      $spaces[[1]]$features
      $spaces[[1]]$features$due_dates
      $spaces[[1]]$features$due_dates$enabled
      [1] FALSE
      
      $spaces[[1]]$features$due_dates$start_date
      [1] FALSE
      
      $spaces[[1]]$features$due_dates$remap_due_dates
      [1] FALSE
      
      $spaces[[1]]$features$due_dates$remap_closed_due_date
      [1] FALSE
      
      
      $spaces[[1]]$features$time_tracking
      $spaces[[1]]$features$time_tracking$enabled
      [1] FALSE
      
      
      $spaces[[1]]$features$tags
      $spaces[[1]]$features$tags$enabled
      [1] FALSE
      
      
      $spaces[[1]]$features$time_estimates
      $spaces[[1]]$features$time_estimates$enabled
      [1] FALSE
      
      
      $spaces[[1]]$features$checklists
      $spaces[[1]]$features$checklists$enabled
      [1] TRUE
      
      
      $spaces[[1]]$features$custom_fields
      $spaces[[1]]$features$custom_fields$enabled
      [1] TRUE
      
      
      $spaces[[1]]$features$remap_dependencies
      $spaces[[1]]$features$remap_dependencies$enabled
      [1] FALSE
      
      
      $spaces[[1]]$features$dependency_warning
      $spaces[[1]]$features$dependency_warning$enabled
      [1] FALSE
      
      
      $spaces[[1]]$features$portfolios
      $spaces[[1]]$features$portfolios$enabled
      [1] FALSE
      
      
      
      
      $spaces[[2]]
      $spaces[[2]]$id
      [1] "791"
      
      $spaces[[2]]$name
      [1] "Second Space Name"
      
      $spaces[[2]]$private
      [1] FALSE
      
      $spaces[[2]]$statuses
      $spaces[[2]]$statuses[[1]]
      $spaces[[2]]$statuses[[1]]$status
      [1] "Open"
      
      $spaces[[2]]$statuses[[1]]$type
      [1] "open"
      
      $spaces[[2]]$statuses[[1]]$orderindex
      [1] 0
      
      $spaces[[2]]$statuses[[1]]$color
      [1] "#d3d3d3"
      
      
      $spaces[[2]]$statuses[[2]]
      $spaces[[2]]$statuses[[2]]$status
      [1] "Closed"
      
      $spaces[[2]]$statuses[[2]]$type
      [1] "closed"
      
      $spaces[[2]]$statuses[[2]]$orderindex
      [1] 1
      
      $spaces[[2]]$statuses[[2]]$color
      [1] "#6bc950"
      
      
      
      $spaces[[2]]$multiple_assignees
      [1] TRUE
      
      $spaces[[2]]$features
      $spaces[[2]]$features$due_dates
      $spaces[[2]]$features$due_dates$enabled
      [1] TRUE
      
      $spaces[[2]]$features$due_dates$start_date
      [1] FALSE
      
      $spaces[[2]]$features$due_dates$remap_due_dates
      [1] FALSE
      
      $spaces[[2]]$features$due_dates$remap_closed_due_date
      [1] FALSE
      
      
      $spaces[[2]]$features$time_tracking
      $spaces[[2]]$features$time_tracking$enabled
      [1] TRUE
      
      
      $spaces[[2]]$features$tags
      $spaces[[2]]$features$tags$enabled
      [1] TRUE
      
      
      $spaces[[2]]$features$time_estimates
      $spaces[[2]]$features$time_estimates$enabled
      [1] TRUE
      
      
      $spaces[[2]]$features$checklists
      $spaces[[2]]$features$checklists$enabled
      [1] TRUE
      
      
      
      
      

# data frame output

    Code
      df_spaces <- cuf_get_spaces("1234")
      df_spaces
    Output
      # A tibble: 2 x 6
        id    name               private           statuses multiple_assign~ features$due_da~
        <chr> <chr>              <lgl>   <list<tibble[,4]>> <lgl>            <lgl>           
      1 790   Updated Space Name FALSE              [2 x 4] FALSE            FALSE           
      2 791   Second Space Name  FALSE              [2 x 4] TRUE             TRUE            
    Code
      df_spaces$statuses
    Output
      <list_of<
        tbl_df<
          status    : character
          type      : character
          orderindex: integer
          color     : character
        >
      >[2]>
      [[1]]
      # A tibble: 2 x 4
        status   type   orderindex color  
        <chr>    <chr>       <int> <chr>  
      1 to do    open            0 #d3d3d3
      2 complete closed          1 #6bc950
      
      [[2]]
      # A tibble: 2 x 4
        status type   orderindex color  
        <chr>  <chr>       <int> <chr>  
      1 Open   open            0 #d3d3d3
      2 Closed closed          1 #6bc950
      
    Code
      df_spaces$features
    Output
      # A tibble: 2 x 9
        due_dates$enabled $start_date $remap_due_dates $remap_closed_due_date
        <lgl>             <lgl>       <lgl>            <lgl>                 
      1 FALSE             FALSE       FALSE            FALSE                 
      2 TRUE              FALSE       FALSE            FALSE                 
      # ... with 8 more variables: time_tracking <tibble[,1]>, tags <tibble[,1]>,
      #   time_estimates <tibble[,1]>, checklists <tibble[,1]>,
      #   custom_fields <tibble[,1]>, remap_dependencies <tibble[,1]>,
      #   dependency_warning <tibble[,1]>, portfolios <tibble[,1]>
    Code
      df_spaces$features$due_dates
    Output
      # A tibble: 2 x 4
        enabled start_date remap_due_dates remap_closed_due_date
        <lgl>   <lgl>      <lgl>           <lgl>                
      1 FALSE   FALSE      FALSE           FALSE                
      2 TRUE    FALSE      FALSE           FALSE                
    Code
      df_spaces$features$time_tracking
    Output
      # A tibble: 2 x 1
        enabled
        <lgl>  
      1 FALSE  
      2 TRUE   
    Code
      df_spaces$features$tags
    Output
      # A tibble: 2 x 1
        enabled
        <lgl>  
      1 FALSE  
      2 TRUE   
    Code
      df_spaces$features$time_estimates
    Output
      # A tibble: 2 x 1
        enabled
        <lgl>  
      1 FALSE  
      2 TRUE   
    Code
      df_spaces$features$checklists
    Output
      # A tibble: 2 x 1
        enabled
        <lgl>  
      1 TRUE   
      2 TRUE   
    Code
      df_spaces$features$custom_fields
    Output
      # A tibble: 2 x 1
        enabled
        <lgl>  
      1 TRUE   
      2 NA     
    Code
      df_spaces$features$remap_dependencies
    Output
      # A tibble: 2 x 1
        enabled
        <lgl>  
      1 FALSE  
      2 NA     
    Code
      df_spaces$features$dependency_warning
    Output
      # A tibble: 2 x 1
        enabled
        <lgl>  
      1 FALSE  
      2 NA     
    Code
      df_spaces$features$portfolios
    Output
      # A tibble: 2 x 1
        enabled
        <lgl>  
      1 FALSE  
      2 NA     

---

    Code
      cuf_get_spaces("1234", archived = TRUE)
    Output
      # A tibble: 2 x 6
        id    name               private           statuses multiple_assign~ features$due_da~
        <chr> <chr>              <lgl>   <list<tibble[,4]>> <lgl>            <lgl>           
      1 790   Updated Space Name FALSE              [2 x 4] FALSE            FALSE           
      2 791   Second Space Name  FALSE              [2 x 4] TRUE             TRUE            

