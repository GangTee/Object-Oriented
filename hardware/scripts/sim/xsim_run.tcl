set sim_mod [lindex ${::val} 0]
set sim_time [lindex ${::val} 1]

open_wave_config ${::script_dir}/sim/${sim_mod}.wcfg

set wave_obj [get_waves *]

foreach wave ${wave_obj} {
	set wave_fmt "add_wave \{\{$wave\}\}"

	eval ${wave_fmt}
}

run ${sim_time}us
