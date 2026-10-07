$ErrorActionPreference = 'Stop'
$root = Split-Path $PSScriptRoot -Parent
$output = Join-Path $PSScriptRoot 'open_loop_spin.vvp'
$sources = @(
    (Join-Path $PSScriptRoot 'tb_open_loop_spin_top.v'),
    (Join-Path $root 'rtl/toptest/open_loop_spin_top.v'),
    (Join-Path $root 'rtl/foc/cordic_0.v'),
    (Join-Path $root 'rtl/foc/inv_park_transform.v'),
    (Join-Path $root 'rtl/foc/svpwm_generator.v'),
    (Join-Path $root 'rtl/foc/pwm_motor_driver.v')
)
& iverilog -g2012 -Wall -s tb_open_loop_spin_top -o $output @sources
if ($LASTEXITCODE -ne 0) { throw 'Icarus compilation failed' }
Push-Location $PSScriptRoot
try {
    & vvp $output
    if ($LASTEXITCODE -ne 0) { throw 'Simulation failed' }
} finally {
    Pop-Location
}
