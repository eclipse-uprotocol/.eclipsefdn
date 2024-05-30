local orgs = import 'vendor/otterdog-defaults/otterdog-defaults.libsonnet';

orgs.newOrg('eclipse-uprotocol') {
  settings+: {
    dependabot_security_updates_enabled_for_new_repositories: false,
    description: "Project to enable connecting automotive applications and services anywhere",
    name: "Eclipse uProtocol",
    two_factor_requirement: true,
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
    },
    orgs.newRepo('manifests') {
      allow_update_branch: false,
      description: "Collection of repo manifests for pulling uProtocol projects",
      web_commit_signoff_required: false,
    },
    orgs.newRepo('up-android-core') {
      allow_merge_commit: true,
      allow_update_branch: false,
      delete_branch_on_merge: false,
      description: "Android Implementation of Core uBus and uSubscription uProtocol",
      topics+: [
        "android",
        "java",
        "kotlin",
        "uprotocol"
      ],
      web_commit_signoff_required: false,
      branch_protection_rules: [
        orgs.newBranchProtectionRule('main') {
          required_approving_review_count: 0,
          required_status_checks+: [
            "build"
          ],
        },
      ],
    },
    orgs.newRepo('up-android-discovery') {
      allow_merge_commit: true,
      allow_update_branch: false,
      delete_branch_on_merge: false,
      description: "Android Implementation of uDiscovery service",
      web_commit_signoff_required: false,
      branch_protection_rules: [
        orgs.newBranchProtectionRule('main') {
          required_approving_review_count: 0,
          required_status_checks+: [
            "build"
          ],
        },
      ],
    },
    orgs.newRepo('up-android-example') {
      allow_merge_commit: true,
      allow_update_branch: false,
      delete_branch_on_merge: false,
      description: "Android Implementation of uDiscovery service",
      topics+: [
        "android",
        "java",
        "uprotocol"
      ],
      web_commit_signoff_required: false,
      branch_protection_rules: [
        orgs.newBranchProtectionRule('main') {
          required_approving_review_count: 0,
          required_status_checks+: [
            "build"
          ],
        },
      ],
    },
    orgs.newRepo('up-android-helloworld') {
      allow_merge_commit: true,
      allow_update_branch: false,
      delete_branch_on_merge: false,
      description: "Implementation of COVESA/HelloWorld Application and Service for Android",
      web_commit_signoff_required: false,
    },
    orgs.newRepo('up-client-android-java') {
      allow_update_branch: false,
      description: "Java Client Library to connect to the Android implementation of uProtocol",
      topics+: [
        "android",
        "java",
        "up-client",
        "uprotocol"
      ],
      web_commit_signoff_required: false,
      branch_protection_rules: [
        orgs.newBranchProtectionRule('main') {
          required_approving_review_count: 0,
          required_status_checks+: [
            "build"
          ],
        },
      ],
    },
    orgs.newRepo('up-client-android-kotlin') {
      allow_update_branch: false,
      description: "Kotlin Client Library to connect to the Android implementation of uProtocol",
      web_commit_signoff_required: false,
    },
    orgs.newRepo('up-client-android-rust') {
      allow_update_branch: false,
      description: "Rust client side Library for Android implementation of uProtocol",
      web_commit_signoff_required: false,
    },
    orgs.newRepo('up-client-azure-java') {
      allow_update_branch: false,
      description: "Java client side Library to build uEs that will run on Azure",
      web_commit_signoff_required: false,
    },
    orgs.newRepo('up-client-mqtt5-python') {
      allow_update_branch: false,
      description: "Python uPClient for MQTT5 to be used by up-simulator and others",
      topics+: [
        "mqtt5",
        "python",
        "up-client",
        "uprotocol"
      ],
      web_commit_signoff_required: false,
    },
    orgs.newRepo('up-client-mqtt5-java') {
      allow_update_branch: false,
      description: "Java uPClient for MQTT5",
      topics+: [
        "mqtt5",
        "java",
        "up-client",
        "uprotocol"
      ],
      web_commit_signoff_required: false,
    },
    orgs.newRepo('up-client-mqtt5-rust') {
      allow_update_branch: false,
      description: "Rust client to communicate with a MQTT5 broker",
      web_commit_signoff_required: false,
    },
    orgs.newRepo('up-client-sommr-rust') {
      allow_update_branch: false,
      description: "Rust uPClient Library for sommr (SOME/IP) transport",
      topics+: [
        "client",
        "rust",
        "sommr",
        "uprotocol"
      ],
      web_commit_signoff_required: false,
    },
    orgs.newRepo('up-client-vsomeip-cpp') {
      allow_update_branch: false,
      description: "C++ uPClient for vsomeip (SOME/IP)",
      topics+: [
        "cpp",
        "up-client",
        "uprotocol",
        "vsomeip"
      ],
      web_commit_signoff_required: false,
    },
    orgs.newRepo('up-client-vsomeip-python') {
      allow_update_branch: false,
      description: "Python uPClient implementation for SOME/IP using vsomeip",
      topics+: [
        "python",
        "up-client",
        "uprotocol",
        "vsomeip"
      ],
      web_commit_signoff_required: false,
    },
    orgs.newRepo('up-client-vsomeip-rust') {
      allow_update_branch: false,
      description: "Rust uPClient for vsomeip (SOME/IP)",
      topics+: [
        "rust",
        "up-client",
        "uprotocol",
        "vsomeip"
      ],
      web_commit_signoff_required: false,
    },
    orgs.newRepo('up-client-zenoh-cpp') {
      allow_update_branch: false,
      description: "C++ client library to connect to the zenoh implementation of uProtocol",
      topics+: [
        "cpp",
        "up-client",
        "uprotocol",
        "zenoh"
      ],
      web_commit_signoff_required: false,
      branch_protection_rules: [
        orgs.newBranchProtectionRule('main') {
          required_approving_review_count: 0,
          required_status_checks+: [
            "CI status checks"
          ],
        },
      ],

    },
    orgs.newRepo('up-client-zenoh-java') {
      allow_update_branch: false,
      description: "Java client side Library to connect to the Zenoh implementation of uProtocol",
      web_commit_signoff_required: false,
    },
    orgs.newRepo('up-client-zenoh-python') {
      allow_update_branch: false,
      description: "Python uPClient implementation for the Zenoh transport",
      topics+: [
        "python",
        "up-client",
        "uprotocol",
        "zenoh"
      ],
      web_commit_signoff_required: false,
    },
    orgs.newRepo('up-client-zenoh-rust') {
      allow_update_branch: false,
      description: "Rust client-side library to talk to the Zenoh implementation of uProtocol",
      topics+: [
        "rust",
        "up-client",
        "zenoh"
      ],
      web_commit_signoff_required: false,
    },
    orgs.newRepo('up-core-api') {
      allow_merge_commit: true,
      allow_update_branch: false,
      delete_branch_on_merge: false,
      archived: true,
      description: "DEPRECATED: uProtocol Core APIs and Data Model",
      topics+: [
        "core",
        "protos",
        "uprotocol"
      ],
      web_commit_signoff_required: false,
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
      allow_merge_commit: true,
      allow_update_branch: false,
      delete_branch_on_merge: false,
      description: "uProtocol Language Specific Library for C++",
      topics+: [
        "core",
        "cpp",
        "uprotocol"
      ],
      web_commit_signoff_required: false,
      branch_protection_rules: [
        orgs.newBranchProtectionRule('main') {
          required_approving_review_count: 0,
          required_status_checks+: [
            "CI status checks"
          ],
        },
      ],
    },
    orgs.newRepo('up-experiments') {
      allow_update_branch: false,
      description: "Dumping ground for experiments that are WiP and there is no better home for the code",
      web_commit_signoff_required: false,
    },
    orgs.newRepo('up-java') {
      allow_merge_commit: true,
      allow_update_branch: false,
      delete_branch_on_merge: false,
      description: "uProtocol Language Specific Library for Java",
      topics+: [
        "core",
        "java",
        "uprotocol"
      ],
      web_commit_signoff_required: false,
      branch_protection_rules: [
        orgs.newBranchProtectionRule('main') {
          required_approving_review_count: 1,
          required_status_checks+: [
            "verify-pr"
          ],
        },
      ],
    },
    orgs.newRepo('up-kalix') {
      allow_merge_commit: true,
      allow_update_branch: false,
      delete_branch_on_merge: false,
      description: "uProtocol Implementation on Kalix",
      web_commit_signoff_required: false,
    },
    orgs.newRepo('up-kotlin') {
      allow_merge_commit: true,
      allow_update_branch: false,
      delete_branch_on_merge: false,
      description: "uProtocol Language Specific Library for Kotlin",
      topics+: [
        "core",
        "kotlin",
        "uprotocol"
      ],
      web_commit_signoff_required: false,
    },
    orgs.newRepo('up-python') {
      allow_merge_commit: true,
      allow_update_branch: false,
      delete_branch_on_merge: false,
      description: "uProtocol Language Specific Library for Python",
      topics+: [
        "core",
        "python",
        "uprotocol"
      ],
      web_commit_signoff_required: false,
    },
    orgs.newRepo('up-rust') {
      allow_merge_commit: true,
      allow_update_branch: false,
      delete_branch_on_merge: false,
      description: "uProtocol Language Specific Library for Rust",
      topics+: [
        "core",
        "rust",
        "uprotocol"
      ],
      web_commit_signoff_required: false,
      branch_protection_rules: [
        orgs.newBranchProtectionRule('main') {
          required_approving_review_count: 0,
        },
      ],
    },
    orgs.newRepo('up-simulator') {
      allow_merge_commit: true,
      allow_update_branch: false,
      delete_branch_on_merge: false,
      description: "Simulator implementation of uProtocol to simulate other implementations (zenoh, android, cloud, etc..)",
      web_commit_signoff_required: false,
    },
    orgs.newRepo('up-simulator-proxy') {
      allow_merge_commit: true,
      allow_update_branch: false,
      delete_branch_on_merge: false,
      description: "Android Implementation of uDiscovery service",
      topics+: [
        "python",
        "simulator",
        "uprotocol"
      ],
      web_commit_signoff_required: false,
    },
    orgs.newRepo('up-spec') {
      allow_merge_commit: true,
      allow_update_branch: false,
      delete_branch_on_merge: false,
      description: "uProtocol Specifications",
      has_discussions: true,
      topics+: [
        "core",
        "uprotocol"
      ],
      web_commit_signoff_required: false,
      branch_protection_rules: [
        orgs.newBranchProtectionRule('main') {
          required_approving_review_count: 1
        },
      ],
    },
    orgs.newRepo('up-streamer-rust') {
      allow_update_branch: false,
      description: "Generic uStreamer implementation written in Rust",
      web_commit_signoff_required: false,
    },
    orgs.newRepo('up-tck') {
      allow_update_branch: false,
      description: "uProtocol Test Compatibility Kit",
      web_commit_signoff_required: false,
    },
    orgs.newRepo('up-vsomeip-helloworld') {
      allow_update_branch: false,
      description: "COVESA/uServices HelloWorld example for mechatronics hello world uService and client using vsomeip",
      topics+: [
        "cpp",
        "example",
        "uprotocol",
        "vsomeip"
      ],
      web_commit_signoff_required: false,
    },
    orgs.newRepo('up-zenoh-example-cpp') {
      allow_update_branch: false,
      description: "C++ Example application and service that utilizes up-client-zenoh-cpp",
      topics+: [
        "cpp",
        "example",
        "uprotocol",
        "zenoh"
      ],
      web_commit_signoff_required: false,
    },
    orgs.newRepo('up-zenoh-example-rust') {
      allow_update_branch: false,
      description: "Example code for zenoh using up-client-zenoh-rust",
      topics+: [
        "example",
        "rust",
        "uprotocol",
        "zenoh"
      ],
      web_commit_signoff_required: false,
    },

    orgs.newRepo('up-client-springboot-java') {
      allow_update_branch: false,
      description: "Springboot implementation of uProtocol that could be used for development of cloud microservices",
      topics+: [
        "up-client",
        "springboot",
        "java",
        "uprotocol"
      ],
      web_commit_signoff_required: false,
    },

    orgs.newRepo('up-conan-recipes') {
      allow_merge_commit: true,
      allow_update_branch: false,
      delete_branch_on_merge: false,
      description: "Conan recipes for uProtocol C++ libraries",
      topics+: [
        "conan",
        "cpp",
        "uprotocol"
      ],
      web_commit_signoff_required: false,
      branch_protection_rules: [
        orgs.newBranchProtectionRule('main') {
          required_approving_review_count: 0,
          required_status_checks+: [
            "CI status checks"
          ],
        },
      ],
    },
  ],
}
