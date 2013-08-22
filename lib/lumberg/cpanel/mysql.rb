module Lumberg
  module Cpanel
    # Public: Allows you to access information about an account's MySQL users,
    # databases, and permissions
    class Mysql < Base
      # Public: Retrieve a list of databases that belong to username
      #
      # options - Hash options for API call params (default: {})
      #   :regex - String regular expression to filter results (optional)
      #
      # Returns Hash API response
      def list(options = {})
        perform_request({:api_module => "MysqlFE", :api_function => 'listdbs' }.merge(options))
      end

      # Public: List all of the MySQL users available to a cPanel account
      #
      # Returns Hash API response
      def accounts
        perform_request({:api_module => "MysqlFE", :api_function => 'listusers' })
      end

      # Public: Retrieve a list of remote MySQL connection hosts
      #
      # Returns Hash API response
      def remote_hosts
        perform_request({:api_module => "MysqlFE", :api_function => 'listhosts' })
      end

      # Public: Retrieve a list of existing database backups
      #
      # Returns Hash API response
      def backups
        perform_request({:api_module => "MysqlFE", :api_function => 'listdbsbackup' })
      end

      # Public: List users who can access a particular database
      #
      # options - Hash options for API call params (default: {})
      #   :db - String name of the database whose users you wish to review. Be
      #         sure to use Cpanel convention's full mysql database name, e.g:
      #         cpanelaccount_databasename
      #
      # Returns Hash API response
      def usernames_for_db(options = {})
        perform_request({:api_module => "MysqlFE", :api_function => 'listusersindb' })
      end

      # Public: Retrieve a list of permissions that correspond to a specific
      # user and database
      #
      # options - Hash options for API call params (default: {})
      #   :db - String database that corresponds to th user whose permission
      #         you wish to view
      #   :username - String user whose permissions you wish to view
      #
      # Returns Hash API response
      def permissions(options = {})
        perform_request({:api_module => "MysqlFE", :api_function => 'userdbprivs' }.merge(options))
      end

      def adduser(options = {})
        perform_request({:api_module => "Mysql", :api_version => 1 , :api_function => 'adduser' }.merge(options))
      end

      def deluser(options = {})
        perform_request({:api_module => "Mysql", :api_version => 1 , :api_function => 'deluser' }.merge(options))
      end

      def adddb(options = {})
        perform_request({:api_module => "Mysql", :api_version => 1 , :api_function => 'adddb' }.merge(options))
      end

      def deldb(options = {})
        perform_request({:api_module => "Mysql", :api_version => 1 , :api_function => 'adddb' }.merge(options))
      end

      def adduserdb(options = {})
        perform_request({:api_module => "Mysql", :api_version => 1 , :api_function => 'adduserdb' }.merge(options))
      end

    end
  end
end


