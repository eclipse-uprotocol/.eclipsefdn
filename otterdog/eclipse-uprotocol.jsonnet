local orgs = import 'vendor/otterdog-defaults/otterdog-defaults.libsonnet';

orgs.newOrg('eclipse-uprotocol') {
  settings+: {
    dependabot_security_updates_enabled_for_new_repositories: false,
    description: "",
    name: "Eclipse uProtocol",
    readers_can_create_discussions: true,
    security_managers+: [
      automotive-uprotocol-project-leads
    ],
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
    orgs.newRepo('up-spec') {
      aliases: ["uprotocol-spec"],
      allow_merge_commit: true,
      allow_update_branch: false,
      delete_branch_on_merge: false,
      description: "uProtocol Specifications",
      topics: [
        "core",
        "uprotocol",
      ],            
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
      topics: [
        "core",
        "protos",
        "uprotocol",
      ],            
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

    orgs.newRepo('up-java') {
      aliases: ["uprotocol-java"],
      allow_merge_commit: true,
      allow_update_branch: false,
      delete_branch_on_merge: false,
      description: "uProtocol Language Specific Library for Java",
      topics: [
        "core",
        "java",
        "uprotocol",
      ],
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
      topics: [
        "core",
        "cpp",
        "uprotocol",
      ],      
      web_commit_signoff_required: false,
      workflows+: {
        actions_can_approve_pull_request_reviews: false,
      },
      branch_protection_rules: [
        orgs.newBranchProtectionRule('main') {
          required_approving_review_count: 0,
          required_status_checks+: [
            "CI status checks"
          ],
        },
      ],

    },

    orgs.newRepo('up-rust') {
      aliases: ["uprotocol-rust"],
      allow_merge_commit: true,
      allow_update_branch: false,
      delete_branch_on_merge: false,
      description: "uProtocol Language Specific Library for Rust",
      topics: [
        "core",
        "rust",
        "uprotocol",
      ],            
      web_commit_signoff_required: false,
      workflows+: {
        actions_can_approve_pull_request_reviews: false,
      },
      branch_protection_rules: [
        orgs.newBranchProtectionRule('main') {
          required_approving_review_count: 0,
          required_status_checks+: [
            "Lint",
            "Test",
            "Build documentation"
          ],
        },
      ],

    },

    orgs.newRepo('up-kotlin') {
      aliases: ["uprotocol-kotlin"],
      allow_merge_commit: true,
      allow_update_branch: false,
      delete_branch_on_merge: false,
      description: "uProtocol Language Specific Library for Kotlin",
      topics: [
        "core",
        "kotlin",
        "uprotocol",
      ],            
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
      topics: [
        "core",
        "python",
        "uprotocol",
      ],            
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

    orgs.newRepo('manifests') {
      allow_update_branch: false,
      description: "Collection of repo manifests for pulling uProtocol projects",
      web_commit_signoff_required: false,
      workflows+: {
        actions_can_approve_pull_request_reviews: false,
      },
    },



    orgs.newRepo('up-client-sommr-rust') {
      aliases: ["uprotocol-rust-ulink-sommr", "uprotocol-rust-transport-sommr"],
      allow_update_branch: false,
      description: "Rust uPClient Library for sommr (SOME/IP) transport",
      topics: [
        "client",
        "rust",
        "sommr",
        "uprotocol",
      ],            
      web_commit_signoff_required: false,
      workflows+: {
        actions_can_approve_pull_request_reviews: false,
      },
    },

    orgs.newRepo('up-client-zenoh-rust') {
      aliases: ["uprotocol-rust-ulink-zenoh"],
      allow_update_branch: false,
      description: "Rust client-side library to talk to the Zenoh implementation of uProtocol",
      topics: [
        "rust",
        "up-client",
        "zenoh",
      ],            
      web_commit_signoff_required: false,
      workflows+: {
        actions_can_approve_pull_request_reviews: false,
      },
    },

    orgs.newRepo('up-client-zenoh-cpp') {
      aliases: ["uprotocol-cpp-ulink-zenoh"],
      allow_update_branch: false,
      description: "C++ client library to connect to the zenoh implementation of uProtocol",
      topics: [
        "cpp",
        "zenoh",
        "up-client",
        "uprotocol",
      ],            
      web_commit_signoff_required: false,
      workflows+: {
        actions_can_approve_pull_request_reviews: false,
      },
    },
    orgs.newRepo('up-client-android-java') {
      aliases: ["uprotocol-java-ulink-android"],
      allow_update_branch: false,
      description: "Java Client Library to connect to the Android implementation of uProtocol",
      topics: [
        "android",
        "java",
        "up-client",
        "uprotocol",
      ],
      web_commit_signoff_required: false,
      workflows+: {
        actions_can_approve_pull_request_reviews: false,
      },
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

    orgs.newRepo('up-client-mqtt5-rust') {
      allow_update_branch: false,
      description: "Rust client to communicate with a MQTT5 broker",
      web_commit_signoff_required: false,
      workflows+: {
        actions_can_approve_pull_request_reviews: false,
      },
    },
    
    orgs.newRepo('up-client-azure-java') {
      allow_update_branch: false,
      description: "Java client side Library to build uEs that will run on Azure",
      web_commit_signoff_required: false,
      workflows+: {
        actions_can_approve_pull_request_reviews: false,
      },
    },

    orgs.newRepo('up-client-android-rust') {
      allow_update_branch: false,
      description: "Rust client side Library for Android implementation of uProtocol",
      web_commit_signoff_required: false,
      workflows+: {
        actions_can_approve_pull_request_reviews: false,
      },
    },


    orgs.newRepo('up-android-core') {
      aliases: [
        "uprotocol-platform-android",
        "up-android"],
      allow_merge_commit: true,
      allow_update_branch: false,
      delete_branch_on_merge: false,
      description: "Android Implementation of Core uBus and uSubscription uProtocol",
      topics: [
        "java",
        "kotlin",
        "uprotocol",
        "android",
      ],            
      web_commit_signoff_required: false,
      workflows+: {
        actions_can_approve_pull_request_reviews: false,
      },
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
      workflows+: {
        actions_can_approve_pull_request_reviews: false,
      },
      branch_protection_rules: [
        orgs.newBranchProtectionRule('main') {
          required_approving_review_count: 0,
          required_status_checks+: [
            "build"
          ],
        },
      ],
    },

    orgs.newRepo('up-simulator-proxy') {
      allow_merge_commit: true,
      allow_update_branch: false,
      delete_branch_on_merge: false,
      description: "Android Implementation of uDiscovery service",
      topics: [
        "python",
        "uprotocol",
        "simulator",
      ],            
      web_commit_signoff_required: false,
      workflows+: {
        actions_can_approve_pull_request_reviews: false,
      },
    },


    orgs.newRepo('up-android-example') {
      allow_merge_commit: true,
      allow_update_branch: false,
      delete_branch_on_merge: false,
      description: "Android Implementation of uDiscovery service",
      topics: [
        "java",
        "uprotocol",
        "android",
      ],            
      web_commit_signoff_required: false,
      workflows+: {
        actions_can_approve_pull_request_reviews: false,
      },
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
      workflows+: {
        actions_can_approve_pull_request_reviews: false,
      },
    },

    orgs.newRepo('up-streamer-rust') {
      aliases: ["uprotocol-platform-linux-zenoh", "up-zenoh"],
      allow_update_branch: false,
      description: "Generic uStreamer implementation written in Rust",
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

    orgs.newRepo('up-client-zenoh-python') {
      aliases: ["uprotocol-python-ulink-zenoh"],
      allow_update_branch: false,
      description: "Python uPClient implementation for the Zenoh transport",
      topics: [
        "python",
        "up-client",
        "zenoh",
        "uprotocol",
      ],            
      web_commit_signoff_required: false,
      workflows+: {
        actions_can_approve_pull_request_reviews: false,
      },
    },

    orgs.newRepo('up-client-vsomeip-python') {
      allow_update_branch: false,
      description: "Python uPClient implementation for SOME/IP using vsomeip",
      topics: [
        "python",
        "up-client",
        "vsomeip",
        "uprotocol",
      ],            
      web_commit_signoff_required: false,
      workflows+: {
        actions_can_approve_pull_request_reviews: false,
      },
    },

    orgs.newRepo('up-vsomeip-helloworld') {
      allow_update_branch: false,
      description: "COVESA/uServices HelloWorld example for mechatronics hello world uService and client using vsomeip",
      topics: [
        "cpp",
        "example",
        "vsomeip",
        "uprotocol",
      ],            
      web_commit_signoff_required: false,
      workflows+: {
        actions_can_approve_pull_request_reviews: false,
      },
    },

    orgs.newRepo('up-zenoh-example-rust') {
      allow_update_branch: false,
      description: "Example code for zenoh using up-client-zenoh-rust",
      topics: [
        "rust",
        "example",
        "zenoh",
        "uprotocol",
      ],            
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

    orgs.newRepo('up-kalix') {
      allow_merge_commit: true,
      allow_update_branch: false,
      delete_branch_on_merge: false,
      description: "uProtocol Implementation on Kalix",
      web_commit_signoff_required: false,
      workflows+: {
        actions_can_approve_pull_request_reviews: false,
      },
    },


    orgs.newRepo('up-client-mqtt5-python') {
      allow_update_branch: false,
      description: "Python uPClient for MQTT5 to be used by up-simulator and others",
      topics: [
        "python",
        "up-client",
        "mqtt5",
        "uprotocol",
      ],            
      web_commit_signoff_required: false,
      workflows+: {
        actions_can_approve_pull_request_reviews: false,
      },
    },

    orgs.newRepo('up-client-vsomeip-rust') {
      allow_update_branch: false,
      description: "Rust uPClient for vsomeip (SOME/IP)",
      topics: [
        "rust",
        "up-client",
        "vsomeip",
        "uprotocol",
      ],            
      web_commit_signoff_required: false,
      workflows+: {
        actions_can_approve_pull_request_reviews: false,
      },
    },

    orgs.newRepo('up-client-vsomeip-cpp') {
      allow_update_branch: false,
      description: "C++ uPClient for vsomeip (SOME/IP)",
      topics: [
        "cpp",
        "up-client",
        "vsomeip",
        "uprotocol",
      ],            
      web_commit_signoff_required: false,
      workflows+: {
        actions_can_approve_pull_request_reviews: false,
      },
    },

   orgs.newRepo('up-zenoh-example-cpp') {
      allow_update_branch: false,
      description: "C++ Example application and service that utilizes up-client-zenoh-cpp",
      topics: [
        "cpp",
        "example",
        "zenoh",
        "uprotocol",
      ],            
      web_commit_signoff_required: false,
      workflows+: {
        actions_can_approve_pull_request_reviews: false,
      },
    },


  ],
}
