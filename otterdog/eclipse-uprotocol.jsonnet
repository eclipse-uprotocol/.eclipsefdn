local orgs = import 'vendor/otterdog-defaults/otterdog-defaults.libsonnet';

orgs.newOrg('eclipse-uprotocol') {
  settings+: {
    default_repository_permission: "none",
    dependabot_security_updates_enabled_for_new_repositories: false,
    description: "",
    members_can_change_project_visibility: false,
    name: "Eclipse uProtocol",
    packages_containers_internal: false,
    packages_containers_public: false,
    readers_can_create_discussions: true,
    two_factor_requirement: false,
    web_commit_signoff_required: false,
    workflows+: {
      actions_can_approve_pull_request_reviews: false,
    },
  },
  secrets+: [
    orgs.newOrgSecret('ORG_GPG_PASSPHRASE') {
      value: "pass:bots/automotive.uprotocol/gpg/passphrase",
    },
    orgs.newOrgSecret('ORG_GPG_PRIVATE_KEY') {
      value: "pass:bots/automotive.uprotocol/gpg/secret-subkeys.asc",
    },
    orgs.newOrgSecret('ORG_OSSRH_PASSWORD') {
      value: "pass:bots/automotive.uprotocol/oss.sonatype.org/password",
    },
    orgs.newOrgSecret('ORG_OSSRH_USERNAME') {
      value: "pass:bots/automotive.uprotocol/oss.sonatype.org/username",
    },
  ],
  _repositories+:: [
    orgs.newRepo('.github') {
      allow_merge_commit: true,
      allow_update_branch: false,
      delete_branch_on_merge: false,
      web_commit_signoff_required: false,
    },
    orgs.newRepo('uprotocol-core-api') {
      allow_merge_commit: true,
      allow_update_branch: false,
      delete_branch_on_merge: false,
      description: "uProtocol Core uE APIs",
      web_commit_signoff_required: false,
    },
    orgs.newRepo('uprotocol-platform-android') {
      allow_merge_commit: true,
      allow_update_branch: false,
      delete_branch_on_merge: false,
      description: "Android uPlatform Implementation",
      web_commit_signoff_required: false,
    },
    orgs.newRepo('uprotocol-ulink-android-java') {
      aliases: ["uprotocol-platform-android-api"],
      allow_update_branch: false,
      description: "Java uLink Library for Android Binder",
      web_commit_signoff_required: false,
    },
    orgs.newRepo('uprotocol-platform-simulator') {
      allow_merge_commit: true,
      allow_update_branch: false,
      delete_branch_on_merge: false,
      description: "uProtocol Platform Simulator",
      web_commit_signoff_required: false,
    },
    orgs.newRepo('uprotocol-roadmap') {
      allow_merge_commit: true,
      allow_update_branch: false,
      delete_branch_on_merge: false,
      description: "uProtocol Roadmap",
      web_commit_signoff_required: false,
    },
    orgs.newRepo('uprotocol-sdk-cpp') {
      allow_merge_commit: true,
      allow_update_branch: false,
      delete_branch_on_merge: false,
      description: "uProtocol C++ SDK",
      web_commit_signoff_required: false,
    },
    orgs.newRepo('uprotocol-sdk-java') {
      allow_merge_commit: true,
      allow_update_branch: false,
      delete_branch_on_merge: false,
      description: "uProtocol Java SDK",
      web_commit_signoff_required: false,
    },
    orgs.newRepo('uprotocol-sdk-python') {
      allow_merge_commit: true,
      allow_update_branch: false,
      delete_branch_on_merge: false,
      description: "uProtocol Python SDK",
      web_commit_signoff_required: false,
    },
    orgs.newRepo('uprotocol-sdk-rust') {
      allow_merge_commit: true,
      allow_update_branch: false,
      delete_branch_on_merge: false,
      description: "uProtocol Rust SDK",
      web_commit_signoff_required: false,
    },
    orgs.newRepo('uprotocol-spec') {
      allow_merge_commit: true,
      allow_update_branch: false,
      delete_branch_on_merge: false,
      description: "uProtocol Specifications",
      web_commit_signoff_required: false,
    },
    orgs.newRepo('uprotocol-roadmap') {
      allow_update_branch: false,
      description: "uProtocol Roadmap",
      web_commit_signoff_required: false,
    },
    orgs.newRepo('uprotocol-ulink-zenoh-java') {
      allow_update_branch: false,
      description: "Java uLink Library for zenoh transport",
      web_commit_signoff_required: false,
    },
    orgs.newRepo('uprotocol-ulink-zenoh-cpp') {
      allow_update_branch: false,
      description: "C++ uLink Library for zenoh transport",
      web_commit_signoff_required: false,
    },
    orgs.newRepo('uprotocol-tools') {
      allow_update_branch: false,
      description: "Collection of tools used by various other projects",
      web_commit_signoff_required: false,
    },
  ],
}
