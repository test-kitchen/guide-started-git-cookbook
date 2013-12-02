include_recipe "git"
include_recipe "runit"

package "git-daemon-run"

runit_service "git-daemon" do
    sv_templates false
end
