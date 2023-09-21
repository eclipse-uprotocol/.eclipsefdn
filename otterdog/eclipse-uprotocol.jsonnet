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
  _repositories+:: [
    orgs.newRepo('.github') {
      allow_update_branch: false,
      secret_scanning_push_protection: "disabled",
      web_commit_signoff_required: false,
    },
    orgs.newRepo('uprotocol-core-api') {
      allow_update_branch: false,
      description: "uProtocol Core uE APIs",
      secret_scanning_push_protection: "disabled",
      web_commit_signoff_required: false,
    },
    orgs.newRepo('uprotocol-platform-android-api') {
      allow_update_branch: false,
      description: "uProtocol Android Platform APIs & Helper Libraries",
      secret_scanning_push_protection: "disabled",
      web_commit_signoff_required: false,
    },
    orgs.newRepo('uprotocol-sdk-cpp') {
      allow_update_branch: false,
      description: "uProtocol C++ SDK",
      secret_scanning_push_protection: "disabled",
      web_commit_signoff_required: false,
    },
    orgs.newRepo('uprotocol-sdk-java') {
      allow_update_branch: false,
      description: "uProtocol Java SDK",
      secret_scanning_push_protection: "disabled",
      web_commit_signoff_required: false,
    },
    orgs.newRepo('uprotocol-sdk-rust') {
      allow_update_branch: false,
      description: "uProtocol Rust SDK",
      secret_scanning_push_protection: "disabled",
      web_commit_signoff_required: false,
    },
    orgs.newRepo('uprotocol-sdk-python') {
      allow_update_branch: false,
      description: "uProtocol Python SDK",
      secret_scanning_push_protection: "disabled",
      web_commit_signoff_required: false,
    },
    orgs.newRepo('uprotocol-platform-simulator') {
      allow_update_branch: false,
      description: "uProtocol Platform Simulator",
      secret_scanning_push_protection: "disabled",
      web_commit_signoff_required: false,
    },
    orgs.newRepo('uprotocol-platform-android') {
      allow_update_branch: false,
      description: "Android uPlatform Implementation",
      secret_scanning_push_protection: "disabled",
      web_commit_signoff_required: false,
    },
    orgs.newRepo('uprotocol-spec') {
      allow_update_branch: false,
      description: "uProtocol Specifications",
      secret_scanning_push_protection: "disabled",
      web_commit_signoff_required: false,
    },
    orgs.newRepo('uprotocol-roadmap') {
      allow_update_branch: false,
      description: "uProtocol Roadmap",
      secret_scanning_push_protection: "disabled",
      web_commit_signoff_required: false,
    },
  ],
}
