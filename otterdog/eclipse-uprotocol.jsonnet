local orgs = import 'vendor/otterdog-defaults/otterdog-defaults.libsonnet';

orgs.newOrg('eclipse-uprotocol') {
  settings+: {
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
    orgs.newOrgSecret('BOT_GITHUB_TOKEN') {
      value: "pass:bots/automotive.uprotocol/github.com/api-token",
    },
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
      workflows+: {
        actions_can_approve_pull_request_reviews: false,
      },
    },
    orgs.newRepo('uprotocol-core-api') {
      allow_merge_commit: true,
      allow_update_branch: false,
      delete_branch_on_merge: false,
      description: "uProtocol Core APIs and Data Model",
      web_commit_signoff_required: false,
      branch_protection_rules: [
        orgs.newBranchProtectionRule('main') {
          required_status_checks+: ["verify-pr"],
          required_approving_review_count: 1,
        }
      ],
      workflows+: {
        actions_can_approve_pull_request_reviews: false,
      },
    },
    orgs.newRepo('uprotocol-platform-android') {
      allow_merge_commit: true,
      allow_update_branch: false,
      delete_branch_on_merge: false,
      description: "Android uPlatform Implementation",
      web_commit_signoff_required: false,
      workflows+: {
        actions_can_approve_pull_request_reviews: false,
      },
    },
    orgs.newRepo('uprotocol-platform-simulator') {
      allow_merge_commit: true,
      allow_update_branch: false,
      delete_branch_on_merge: false,
      description: "uProtocol Platform Simulator",
      web_commit_signoff_required: false,
      workflows+: {
        actions_can_approve_pull_request_reviews: false,
      },
    },
    orgs.newRepo('uprotocol-roadmap') {
      allow_update_branch: false,
      description: "uProtocol Roadmap",
      web_commit_signoff_required: false,
      workflows+: {
        actions_can_approve_pull_request_reviews: false,
      },
    },
    orgs.newRepo('uprotocol-cpp') {
      aliases: ["uprotocol-sdk-cpp"],
      allow_merge_commit: true,
      allow_update_branch: false,
      delete_branch_on_merge: false,
      description: "uProtocol Language Specific Library for C++",
      web_commit_signoff_required: false,
      workflows+: {
        actions_can_approve_pull_request_reviews: false,
      },
    },
    orgs.newRepo('uprotocol-java') {
      aliases: ["uprotocol-sdk-java"],
      allow_merge_commit: true,
      allow_update_branch: false,
      delete_branch_on_merge: false,
      description: "uProtocol Language Specific Library for Java",
      web_commit_signoff_required: false,
      workflows+: {
        actions_can_approve_pull_request_reviews: false,
      },
    },
    orgs.newRepo('uprotocol-python') {
      aliases: ["uprotocol-sdk-python"],
      allow_merge_commit: true,
      allow_update_branch: false,
      delete_branch_on_merge: false,
      description: "uProtocol Language Specific Library for Python",
      web_commit_signoff_required: false,
      workflows+: {
        actions_can_approve_pull_request_reviews: false,
      },
    },
    orgs.newRepo('uprotocol-rust') {
      aliases: ["uprotocol-sdk-rust"],
      allow_merge_commit: true,
      allow_update_branch: false,
      delete_branch_on_merge: false,
      description: "uProtocol Language Specific Library for Rust",
      web_commit_signoff_required: false,
      workflows+: {
        actions_can_approve_pull_request_reviews: false,
      },
    },
    orgs.newRepo('uprotocol-spec') {
      allow_merge_commit: true,
      allow_update_branch: false,
      delete_branch_on_merge: false,
      description: "uProtocol Specifications",
      web_commit_signoff_required: false,
      workflows+: {
        actions_can_approve_pull_request_reviews: false,
      },
    },
    orgs.newRepo('uprotocol-tools') {
      allow_update_branch: false,
      description: "Collection of tools used by various other projects",
      web_commit_signoff_required: false,
      workflows+: {
        actions_can_approve_pull_request_reviews: false,
      },
    },
    orgs.newRepo('uprotocol-java-ulink-android') {
      aliases: ["uprotocol-ulink-android-java"],
      allow_update_branch: false,
      description: "Java uLink Library for Android Binder Transport",
      web_commit_signoff_required: false,
      workflows+: {
        actions_can_approve_pull_request_reviews: false,
      },
    },
    orgs.newRepo('uprotocol-ulink-zenoh-cpp') {
      aliases: ["uprotocol-cpp-ulink-zenoh"],
      allow_update_branch: false,
      description: "C++ uLink Library for zenoh transport",
      web_commit_signoff_required: false,
      workflows+: {
        actions_can_approve_pull_request_reviews: false,
      },
    },
    orgs.newRepo('uprotocol-java-ulink-zenoh') {
      aliases: ["uprotocol-ulink-zenoh-java"],
      allow_update_branch: false,
      description: "Java uLink Library for zenoh transport",
      web_commit_signoff_required: false,
      workflows+: {
        actions_can_approve_pull_request_reviews: false,
      },
    },
    orgs.newRepo('uprotocol-python-ulink-zenoh') {
      aliases: ["uprotocol-ulink-zenoh-python"],
      allow_update_branch: false,
      description: "Python uLink implementation for the Zenoh transport",
      web_commit_signoff_required: false,
      workflows+: {
        actions_can_approve_pull_request_reviews: false,
      },
    },
  ],
}
