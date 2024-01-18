local orgs = import 'vendor/otterdog-defaults/otterdog-defaults.libsonnet';

orgs.newOrg('eclipse-uprotocol') {
  settings+: {
    dependabot_security_updates_enabled_for_new_repositories: false,
    description: "",
    name: "Eclipse uProtocol",
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
    orgs.newOrgSecret('CRATES_IO_TOKEN') {
      value: "pass:bots/automotive.uprotocol/crates.io/api-token",
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
    orgs.newOrgSecret('PYPI_TOKEN') {
      value: "pass:bots/automotive.uprotocol/pypi.org/api-token",
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
    orgs.newRepo('up-core-api') {
      aliases: ["uprotocol-core-api"],
      allow_merge_commit: true,
      allow_update_branch: false,
      delete_branch_on_merge: false,
      description: "uProtocol Core APIs and Data Model",
      web_commit_signoff_required: false,
      workflows+: {
        actions_can_approve_pull_request_reviews: false,
      },
      branch_protection_rules: [
        orgs.newBranchProtectionRule('main') {
          required_approving_review_count: 1,
          required_status_checks+: [
            "verify-pr"
          ],
        },
      ],
    },
    orgs.newRepo('up-cpp') {
      aliases: ["uprotocol-cpp"],
      allow_merge_commit: true,
      allow_update_branch: false,
      delete_branch_on_merge: false,
      description: "uProtocol Language Specific Library for C++",
      web_commit_signoff_required: false,
      workflows+: {
        actions_can_approve_pull_request_reviews: false,
      },
    },
    orgs.newRepo('up-client-sommr-rust') {
      aliases: ["uprotocol-rust-ulink-sommr", "uprotocol-rust-transport-sommr"],
      allow_update_branch: false,
      description: "Rust uLink Library for sommr (SOME/IP) transport",
      web_commit_signoff_required: false,
      workflows+: {
        actions_can_approve_pull_request_reviews: false,
      },
    },
    orgs.newRepo('up-client-zenoh-rust') {
      aliases: ["uprotocol-rust-ulink-zenoh"],
      allow_update_branch: false,
      description: "Rust client-side library to talk to the Zenoh implementation of uProtocol",
      web_commit_signoff_required: false,
      workflows+: {
        actions_can_approve_pull_request_reviews: false,
      },
    },
    orgs.newRepo('up-tck') {
      aliases: ["uprotocol-tck"],
      allow_update_branch: false,
      description: "uProtocol Test Compatibility Kit",
      web_commit_signoff_required: false,
      workflows+: {
        actions_can_approve_pull_request_reviews: false,
      },
    },
    orgs.newRepo('up-client-zenoh-cpp') {
      aliases: ["uprotocol-cpp-ulink-zenoh"],
      allow_update_branch: false,
      description: "C++ client library to connect to the zenoh implementation of uProtocol",
      web_commit_signoff_required: false,
      workflows+: {
        actions_can_approve_pull_request_reviews: false,
      },
    },
    orgs.newRepo('up-java') {
      aliases: ["uprotocol-java"],
      allow_merge_commit: true,
      allow_update_branch: false,
      delete_branch_on_merge: false,
      description: "uProtocol Language Specific Library for Java",
      web_commit_signoff_required: false,
      workflows+: {
        actions_can_approve_pull_request_reviews: false,
      },
      branch_protection_rules: [
        orgs.newBranchProtectionRule('main') {
          required_approving_review_count: 1,
          required_status_checks+: [
            "verify-pr"
          ],
        },
      ],
    },
    orgs.newRepo('up-client-android-java') {
      aliases: ["uprotocol-java-ulink-android"],
      allow_update_branch: false,
      description: "Java Client Library to connect to the Android implementation of uProtocol",
      web_commit_signoff_required: false,
      workflows+: {
        actions_can_approve_pull_request_reviews: false,
      },
    },
    orgs.newRepo('up-client-zenoh-java') {
      aliases: ["uprotocol-java-ulink-zenoh"],
      allow_update_branch: false,
      description: "Java client side Library to connect to the Zenoh implementation of uProtocol",
      web_commit_signoff_required: false,
      workflows+: {
        actions_can_approve_pull_request_reviews: false,
      },
    },
    orgs.newRepo('up-kotlin') {
      aliases: ["uprotocol-kotlin"],
      allow_merge_commit: true,
      allow_update_branch: false,
      delete_branch_on_merge: false,
      description: "uProtocol Language Specific Library for Kotlin",
      web_commit_signoff_required: false,
      workflows+: {
        actions_can_approve_pull_request_reviews: false,
      },
    },
    orgs.newRepo('up-android') {
      aliases: ["uprotocol-platform-android"],
      allow_merge_commit: true,
      allow_update_branch: false,
      delete_branch_on_merge: false,
      description: "Android Implementation of uProtocol",
      web_commit_signoff_required: false,
      workflows+: {
        actions_can_approve_pull_request_reviews: false,
      },
    },
    orgs.newRepo('up-zenoh') {
      aliases: ["uprotocol-platform-linux-zenoh"],
      allow_update_branch: false,
      description: "Zenoh implementation of uProtocol",
      web_commit_signoff_required: false,
      workflows+: {
        actions_can_approve_pull_request_reviews: false,
      },
    },
    orgs.newRepo('up-simulator') {
      aliases: ["uprotocol-platform-simulator"],
      allow_merge_commit: true,
      allow_update_branch: false,
      delete_branch_on_merge: false,
      description: "Simulator implementation of uProtocol to simulate other implementations (zenoh, android, cloud, etc..)",
      web_commit_signoff_required: false,
      workflows+: {
        actions_can_approve_pull_request_reviews: false,
      },
    },
    orgs.newRepo('up-python') {
      aliases: ["uprotocol-python"],
      allow_merge_commit: true,
      allow_update_branch: false,
      delete_branch_on_merge: false,
      description: "uProtocol Language Specific Library for Python",
      web_commit_signoff_required: false,
      workflows+: {
        actions_can_approve_pull_request_reviews: false,
      },
    },
    orgs.newRepo('up-client-zenoh-python') {
      aliases: ["uprotocol-python-ulink-zenoh"],
      allow_update_branch: false,
      description: "Python uLink implementation for the Zenoh transport",
      web_commit_signoff_required: false,
      workflows+: {
        actions_can_approve_pull_request_reviews: false,
      },
    },
    orgs.newRepo('up-rust') {
      aliases: ["uprotocol-rust"],
      allow_merge_commit: true,
      allow_update_branch: false,
      delete_branch_on_merge: false,
      description: "uProtocol Language Specific Library for Rust",
      web_commit_signoff_required: false,
      workflows+: {
        actions_can_approve_pull_request_reviews: false,
      },
    },
    orgs.newRepo('up-spec') {
      aliases: ["uprotocol-spec"],
      allow_merge_commit: true,
      allow_update_branch: false,
      delete_branch_on_merge: false,
      description: "uProtocol Specifications",
      web_commit_signoff_required: false,
      workflows+: {
        actions_can_approve_pull_request_reviews: false,
      },
    },
    orgs.newRepo('up-experiments') {
      allow_update_branch: false,
      description: "Dumping ground for experiments that are WiP and there is no better home for the code",
      web_commit_signoff_required: false,
      workflows+: {
        actions_can_approve_pull_request_reviews: false,
      },
    },
  ],
}
