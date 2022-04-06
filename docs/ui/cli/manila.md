# To use Manila via Openstack CLI

On a terminal that has the Openstack Clients installed and the appropriate login credentials you can do the following:

### 1. Create a share

`openstack share create --name $manila-share-name cephfs $vol-size --os-share-api-version 2.63`

Example:
`openstack share create --name manila-share-cli cephfs 10 --os-share-api-version 2.63`

Metadata for the share created above:

    +---------------------------------------+--------------------------------------+
    | Field                                 | Value                                |
    +---------------------------------------+--------------------------------------+
    | access_rules_status                   | active                               |
    | availability_zone                     | None                                 |
    | create_share_from_snapshot_support    | False                                |
    | created_at                            | 2022-03-01T03:40:48.468421           |
    | description                           | None                                 |
    | has_replicas                          | False                                |
    | id                                    | 23c511b2-66e7-4986-b6a6-231b490210d4 |
    | is_public                             | False                                |
    | metadata                              | {}                                   |
    | mount_snapshot_support                | False                                |
    | name                                  | manila-share-cli                     |
    | progress                              | None                                 |
    | project_id                            | 55d7efb46dd945a2b86f7ce8aa657e1a     |
    | replication_type                      | None                                 |
    | revert_to_snapshot_support            | False                                |
    | share_group_id                        | None                                 |
    | share_network_id                      | None                                 |
    | share_proto                           | CEPHFS                               |
    | share_type                            | de7b9e68-2357-4837-880f-858d7358b05c |
    | share_type_name                       | cephfsnativetype                     |
    | size                                  | 10                                   |
    | snapshot_id                           | None                                 |
    | snapshot_support                      | False                                |
    | source_share_group_snapshot_member_id | None                                 |
    | status                                | creating                             |
    | task_state                            | None                                 |
    | user_id                               | a9e55b395bcb494aaf5938f5f8382e71     |
    | volume_type                           | cephfsnativetype                     |
    +---------------------------------------+--------------------------------------+
`id` is the share_id. You can use this to look up information about your share. See step 4.


### 2. Create an access rule

`openstack share access create $manila-share-name cephx $anyName --os-share-api-version 2.63`

Example:
`openstack share access create manila-share-cli cephx manilaAccess --os-share-api-version 2.63`

Metadata for the access rule:

    +--------------+--------------------------------------+
    | Field        | Value                                |
    +--------------+--------------------------------------+
    | id           | 95067b4f-f77c-4b76-be12-ac5c3a8e8897 |
    | share_id     | 23c511b2-66e7-4986-b6a6-231b490210d4 |
    | access_level | rw                                   |
    | access_to    | manilaAccess                         |
    | access_type  | cephx                                |
    | state        | queued_to_apply                      |
    | access_key   | None                                 |
    | created_at   | 2022-03-01T13:41:09.984126           |
    | updated_at   | None                                 |
    | properties   |                                      |
    +--------------+--------------------------------------+

Make a note of the id value. This is the `access rule id`. In the above example it is `95067b4f-f77c-4b76-be12-ac5c3a8e8897`. You can look up the access rule id in openstack to get your `access_key`.

### 3. Get access key

`openstack share access show $access-rule-id --os-share-api-version 2.63`

Example:

`openstack share access show 95067b4f-f77c-4b76-be12-ac5c3a8e8897 --os-share-api-version 2.63`

Metadata for the access rule:

    +--------------+------------------------------------------+
    | Field        | Value                                    |
    +--------------+------------------------------------------+
    | id           | 95067b4f-f77c-4b76-be12-ac5c3a8e8897     |
    | share_id     | 23c511b2-66e7-4986-b6a6-231b490210d4     |
    | access_level | rw                                       |
    | access_to    | manilaAccess                             |
    | access_type  | cephx                                    |
    | state        | active                                   |
    | access_key   | AQB2Ih5iyQKpChAAIKunDZ6Ztr1VfNn+AFxlGA== |
    | created_at   | 2022-03-01T13:41:09.984126               |
    | updated_at   | 2022-03-01T13:41:10.227543               |
    | properties   |                                          |
    +--------------+------------------------------------------+

The access rule is active and you can use the `access_key` generated above.



### 4. View share information


`openstack share show $share_id --os-share-api-version 2.63`
Example:

`openstack share show 23c511b2-66e7-4986-b6a6-231b490210d4 --os-share-api-version 2.63`

Metadata for your share will now look a little different:

    +---------------------------------------+----------------------------------------------------------------------------------------------------------------------------------------+
    | Field                                 | Value                                                                                                                                  |
    +---------------------------------------+----------------------------------------------------------------------------------------------------------------------------------------+
    | access_rules_status                   | active                                                                                                                                 |
    | availability_zone                     | nova                                                                                                                                   |
    | create_share_from_snapshot_support    | False                                                                                                                                  |
    | created_at                            | 2022-03-01T03:40:48.468421                                                                                                             |
    | description                           | None                                                                                                                                   |
    | export_locations                      |                                                                                                                                        |
    |                                       | id = 1138760f-2ba4-4d9f-ad8b-312d39c4e4b8                                                                                              |
    |                                       | path = 149.165.158.38:6789,149.165.158.22:6789,149.165.158.54:6789,149.165.158.70:6789,149.165.158.86:6789:/volumes/_nogroup/1ca2d54e- |
    |                                       | 16a5-43b8-90de-75a91c1b96e9/fba3f935-5047-4eef-8b4d-3c27f356c2c7                                                                       |
    |                                       | preferred = False                                                                                                                      |
    | has_replicas                          | False                                                                                                                                  |
    | id                                    | 23c511b2-66e7-4986-b6a6-231b490210d4                                                                                                   |
    | is_public                             | False                                                                                                                                  |
    | mount_snapshot_support                | False                                                                                                                                  |
    | name                                  | manila-share-cli                                                                                                                       |
    | progress                              | 100%                                                                                                                                   |
    | project_id                            | 55d7efb46dd945a2b86f7ce8aa657e1a                                                                                                       |
    | properties                            |                                                                                                                                        |
    | replication_type                      | None                                                                                                                                   |
    | revert_to_snapshot_support            | False                                                                                                                                  |
    | share_group_id                        | None                                                                                                                                   |
    | share_network_id                      | None                                                                                                                                   |
    | share_proto                           | CEPHFS                                                                                                                                 |
    | share_type                            | de7b9e68-2357-4837-880f-858d7358b05c                                                                                                   |
    | share_type_name                       | cephfsnativetype                                                                                                                       |
    | size                                  | 10                                                                                                                                     |
    | snapshot_id                           | None                                                                                                                                   |
    | snapshot_support                      | False                                                                                                                                  |
    | source_share_group_snapshot_member_id | None                                                                                                                                   |
    | status                                | available                                                                                                                              |
    | task_state                            | None                                                                                                                                   |
    | user_id                               | a9e55b395bcb494aaf5938f5f8382e71                                                                                                       |
    | volume_type                           | cephfsnativetype                                                                                                                       |
    +---------------------------------------+----------------------------------------------------------------------------------------------------------------------------------------+

You will need the path of your `export_locations`

In the above example it is:

    149.165.158.38:6789,149.165.158.22:6789,149.165.158.54:6789,149.165.158.70:6789,149.165.158.86:6789:/volumes/_nogroup/1ca2d54e-16a5-43b8-90de-75a91c1b96e9/fba3f935-5047-4eef-8b4d-3c27f356c2c7

---

Important things to note down:

- Share id (Step 1)
- Access rule id (Step 2)
- Acccess key (Step 3)
- Export location path (Step 4)


### Using Manila Share on a VM

This is the same whether you're using Horizon or the CLI. Please refer to [Configuring a VM to use Manila Shares](../../general/manilaVM.md)
