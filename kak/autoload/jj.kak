define-command -override jj-log %{
    set-register | %sh{
        jj log
    }
    edit -scratch '*jj-log*'
    exec '"|p;'
}

define-command -override jj-show %{
    set-register | %sh{
        jj show
    }
    edit -scratch '*jj-show*'
    exec '"|p;'
}
