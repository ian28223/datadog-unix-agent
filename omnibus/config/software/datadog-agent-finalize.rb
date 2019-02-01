# Unless explicitly stated otherwise all files in this repository are licensed
# under the Apache License Version 2.0.
# This product includes software developed at Datadog (https:#www.datadoghq.com/).
# Copyright 2018 Datadog, Inc.

# This software definition doesn"t build anything, it"s the place where we create
# files outside the omnibus installation directory, so that we can add them to
# the package manifest using `extra_package_file` in the project definition.
require './lib/ostools.rb'

name "datadog-agent-finalize"
description "steps required to finalize the build"
default_version "1.0.0"
skip_transitive_dependency_licensing true

build do
  # TODO too many things done here, should be split
  block do
    # Conf files

    if aix?
      # Move checks and configuration files
      mkdir "/etc/datadog-agent"
      move "#{install_dir}/etc/datadog-agent/datadog.yaml.example", "/etc/datadog-agent"
      move "#{install_dir}/etc/datadog-agent/conf.d", "/etc/datadog-agent", :force=>true

      # Create empty directories so that they're owned by the package
      # (also requires `extra_package_file` directive in project def)
      mkdir "/etc/datadog-agent/checks.d"
      mkdir "/var/log/datadog"

      # cleanup clutter
      delete "#{install_dir}/etc"
    end
  end
end

