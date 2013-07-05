class accounts::operations {

  # Create The Operations Group
  include accounts::group::operations

  # Create The Users
  include accounts::user::user

}