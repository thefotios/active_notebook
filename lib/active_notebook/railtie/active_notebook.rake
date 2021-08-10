desc 'Create a ActiveNotebook kernel'
namespace :active_notebook do
  JUPYTER_DATA_DIR = Pathname.new('.jupyter')
  KERNEL_FILE = JUPYTER_DATA_DIR + 'kernels/active_notebook/kernel.json'

  task :kernel do
    require 'json'

    # TODO: Fail if not found
    kernel_spec = {
      argv: [
        'bundle',
        'exec',
        'iruby',
        'kernel',
        '{connection_file}',
        Gem.find_latest_files('active_notebook/boot').first
      ],
      display_name: 'ActiveNotebook',
      language: 'ruby'
    }

    KERNEL_FILE.parent.mkpath
    KERNEL_FILE.write(JSON.pretty_generate(kernel_spec))
  end

  task :run => [:kernel, :environment] do
    env = {
       'JUPYTER_DATA_DIR' => JUPYTER_DATA_DIR.to_s
     }
    exec(env, 'jupyter lab')
  end
end
