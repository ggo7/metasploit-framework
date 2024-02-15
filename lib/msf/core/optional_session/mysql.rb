# frozen_string_literal: true

module Msf
  module OptionalSession
    module MySQL
      include Msf::OptionalSession

      def initialize(info = {})
        super(
          update_info(
            info,
            'SessionTypes' => %w[mysql]
          )
        )

        if framework.features.enabled?(Msf::FeatureManager::MYSQL_SESSION_TYPE)
          register_options(
            [
              Msf::OptInt.new('SESSION', [ false, 'The session to run this module on' ]),
              Msf::Opt::RHOST(nil, false),
              Msf::Opt::RPORT(3306, false)
            ]
          )
          add_info('New in Metasploit 6.4 - This module can target a %grnSESSION%clr or an %grnRHOST%clr')

        end
      end

      def session
        return nil unless framework.features.enabled?(Msf::FeatureManager::MYSQL_SESSION_TYPE)

        super
      end
    end
  end
end