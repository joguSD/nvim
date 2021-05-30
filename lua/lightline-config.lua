-- Lightline config
vim.g.lightline = {
    colorscheme = 'nord',
    active = {
        left = {
            {'mode', 'paste'},
            {'gitbranch', 'readonly', 'filename', 'modified'}
        },
        right = {
            {'lineinfo'},
            {'percent'},
            {'fileformat', 'fileencoding', 'filetype'},
            {'linter_checking', 'linter_warnings', 'linter_errors', 'linter_ok'}
        }
    },
    component_function = {
        gitbranch = 'fugitive#head'
    },
}
