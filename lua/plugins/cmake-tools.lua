return {
  {
    'Civitasv/cmake-tools.nvim',
    event = { 'BufRead', 'BufNewFile' }, -- Load on file open
    dependencies = {
      'nvim-lua/plenary.nvim', -- Required dependency
    },
    config = function()
      require('cmake-tools').setup {
        cmake_command = 'cmake', -- Custom cmake command if needed
        cmake_build_directory = 'build', -- Where to build
        cmake_build_type = 'Debug', -- Build type
        cmake_generate_options = { -- Additional generate options
          '-D',
          'CMAKE_EXPORT_COMPILE_COMMANDS=ON',
        },
        cmake_build_options = {}, -- Build options
        cmake_console_size = 10, -- Size of the cmake console window
        cmake_show_console = 'always', -- When to show console
        cmake_dap_configuration = { -- Debugger configuration
          name = 'cpp',
          type = 'codelldb',
          request = 'launch',
        },
        cmake_executor = { -- Executor configuration
          name = 'toggleterm', -- Can use "toggleterm" if available
        },
        cmake_runner = { -- Runner configuration
          name = 'toggleterm', -- Can use "toggleterm"
        },
      }

      -- Optional: keybindings for CMake actions
      local map = vim.keymap.set
      local opts = { noremap = true, silent = true, desc = 'CMake Tools' }
      map('n', '<leader>cg', '<cmd>CMakeGenerate<CR>', vim.tbl_extend('force', opts, { desc = 'CMake Generate' }))
      map('n', '<leader>cb', '<cmd>CMakeBuild<CR>', vim.tbl_extend('force', opts, { desc = 'CMake Build' }))
      map('n', '<leader>cr', '<cmd>CMakeRun<CR>', vim.tbl_extend('force', opts, { desc = 'CMake Run' }))
      map('n', '<leader>cd', '<cmd>CMakeDebug<CR>', vim.tbl_extend('force', opts, { desc = 'CMake Debug' }))
    end,
  },
}
