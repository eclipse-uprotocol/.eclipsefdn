local orgs = import 'vendor/otterdog-defaults/otterdog-defaults.libsonnet';

orgs.newOrg('automotive.uprotocol', 'eclipse-uprotocol') {
  rulesets+: [
    orgs.newOrgRuleset('disable_merge_commits') {
      include_repo_names: [
        "~ALL"
      ],
      include_refs+: [
        "~DEFAULT_BRANCH"
      ],
      requires_linear_history: true,
      required_pull_request+: {
        required_approving_review_count: 1,
      }
    },
    orgs.newOrgRuleset('pull_request_settings') {
      include_repo_names: [
        "~ALL"
      ],
      include_refs+: [
        "~DEFAULT_BRANCH"
      ],
      required_pull_request: orgs.newPullRequest() {
        required_approving_review_count: 0,
        requires_review_thread_resolution: true
      },
    }
  ],
  settings+: {
    description: "Project to enable connecting automotive applications and services anywhere",
    name: "Eclipse uProtocol",
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
    orgs.newOrgSecret('CENTRAL_SONATYPE_TOKEN_PASSWORD') {
      value: "pass:bots/automotive.uprotocol/central.sonatype.org/token-password",
    },
    orgs.newOrgSecret('CENTRAL_SONATYPE_TOKEN_USERNAME') {
      value: "pass:bots/automotive.uprotocol/central.sonatype.org/token-username",
    },
    orgs.newOrgSecret('PYPI_TOKEN') {
      value: "pass:bots/automotive.uprotocol/pypi.org/api-token",
    },
  ],
  _repositories+:: [
    orgs.newRepo('.github') {
      allow_update_branch: false,
      code_scanning_default_setup_enabled: true,
      delete_branch_on_merge: false,
      homepage: "",
      web_commit_signoff_required: false,
      branch_protection_rules: [
        orgs.newBranchProtectionRule('main') {
          required_approving_review_count: 1,
        },
      ],
    },
    orgs.newRepo('ci-cd') {
      allow_update_branch: false,
      description: "Shared resources for implementing CI/CD pipelines",
      web_commit_signoff_required: false,
      branch_protection_rules: [
        orgs.newBranchProtectionRule('main') {
          required_approving_review_count: 1,
        },
      ],
    },
    orgs.newRepo('eclipse-uprotocol.github.io') {
      allow_update_branch: false,
      code_scanning_default_setup_enabled: true,
      delete_branch_on_merge: false,
      description: "The landing page website for the uProtocol project",
      gh_pages_build_type: "workflow",
      homepage: "https://eclipse-uprotocol.github.io/",
      topics+: [
        "landing-page",
        "uprotocol"
      ],
      web_commit_signoff_required: false,
      environments: [
        orgs.newEnvironment('github-pages') {
          branch_policies+: [
            "main"
          ],
          deployment_branch_policy: "selected",
        },
      ],
      branch_protection_rules: [
        orgs.newBranchProtectionRule('main') {
          required_approving_review_count: 1,
        },
      ],
    },
    orgs.newRepo('manifests') {
      allow_update_branch: false,
      code_scanning_default_setup_enabled: true,
      description: "Collection of repo manifests for pulling uProtocol projects",
      web_commit_signoff_required: false,
      branch_protection_rules: [
        orgs.newBranchProtectionRule('main') {
          required_approving_review_count: 1,
        },
      ],
    },
    orgs.newRepo('up-akka') {
      allow_update_branch: false,
      delete_branch_on_merge: false,
      description: "uProtocol Implementation on Kalix",
      web_commit_signoff_required: false,
    },
    orgs.newRepo('up-android-core') {
      allow_update_branch: false,
      code_scanning_default_setup_enabled: true,
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
      allow_update_branch: false,
      code_scanning_default_setup_enabled: true,
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
      allow_update_branch: false,
      code_scanning_default_setup_enabled: true,
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
      allow_update_branch: false,
      code_scanning_default_setup_enabled: true,
      delete_branch_on_merge: false,
      description: "Implementation of COVESA/HelloWorld Application and Service for Android",
      web_commit_signoff_required: false,
    },
    orgs.newRepo('up-conan-recipes') {
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
    orgs.newRepo('up-core-api') {
      allow_update_branch: false,
      archived: true,
      code_scanning_default_setup_enabled: true,
      delete_branch_on_merge: false,
      description: "uProtocol Core APIs and Data Model",
      secret_scanning_push_protection: "disabled",
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
          required_approving_review_count: 1,
          required_status_checks+: [
            "CI status checks"
          ],
        },
        orgs.newBranchProtectionRule('v*.*_up-v*.*.*') {
          required_approving_review_count: 1,
          required_status_checks+: [
            "CI status checks"
          ],
        },
        orgs.newBranchProtectionRule('up-v1.5.7') {
          required_approving_review_count: 1,
          required_status_checks+: [
            "CI status checks"
          ],
        },
      ],
    },
    orgs.newRepo('up-discovery-cpp') {
      allow_update_branch: false,
      description: "uDiscovery service written in C++",
      topics+: [
        "cpp",
        "udiscovery",
        "uprotocol"
      ],
      web_commit_signoff_required: false,
    },
    orgs.newRepo('up-experiments') {
      allow_update_branch: false,
      code_scanning_default_setup_enabled: true,
      description: "Dumping ground for experiments that are WiP and there is no better home for the code",
      web_commit_signoff_required: false,
    },
    orgs.newRepo('up-java') {
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
            "lint",
            "verify-pr"
          ],
        },
      ],
    },
    orgs.newRepo('up-kotlin') {
      allow_update_branch: false,
      code_scanning_default_languages+: [
        "java-kotlin"
      ],
      code_scanning_default_setup_enabled: true,
      delete_branch_on_merge: false,
      description: "uProtocol Language Specific Library for Kotlin",
      topics+: [
        "core",
        "kotlin",
        "uprotocol"
      ],
      web_commit_signoff_required: false,
      branch_protection_rules: [
        orgs.newBranchProtectionRule('main') {
          required_approving_review_count: 1,
        },
      ],
    },
    orgs.newRepo('up-player-cpp') {
      allow_update_branch: false,
      description: "uProtocol Recorder",
      topics+: [
        "cpp",
        "uprotocol"
      ],
      web_commit_signoff_required: false,
      branch_protection_rules: [
        orgs.newBranchProtectionRule('main') {
          required_approving_review_count: 1,
        },
      ],
    },
    orgs.newRepo('up-python') {
      allow_update_branch: false,
      code_scanning_default_languages+: [
        "actions",
        "python"
      ],
      code_scanning_default_setup_enabled: true,
      delete_branch_on_merge: false,
      description: "uProtocol Language Specific Library for Python",
      topics+: [
        "core",
        "python",
        "uprotocol"
      ],
      web_commit_signoff_required: false,
      branch_protection_rules: [
        orgs.newBranchProtectionRule('main') {
          required_approving_review_count: 1,
          required_status_checks+: [
            "Test with coverage",
            "lint"
          ],
        },
      ],
    },
    orgs.newRepo('up-recorder-cpp') {
      allow_update_branch: false,
      description: "uProtocol Recorder",
      topics+: [
        "cpp",
        "uprotocol"
      ],
      web_commit_signoff_required: false,
    },
    orgs.newRepo('up-rust') {
      allow_update_branch: false,
      code_scanning_default_languages+: [
        "actions"
      ],
      code_scanning_default_setup_enabled: true,
      delete_branch_on_merge: false,
      description: "uProtocol Language Specific Library for Rust",
      topics+: [
        "core",
        "rust",
        "uprotocol"
      ],
      web_commit_signoff_required: false,
      variables: [
      ],
      branch_protection_rules: [
        orgs.newBranchProtectionRule('main') {
          required_approving_review_count: 1,
        },
      ],
    },
    orgs.newRepo('up-simulator') {
      allow_update_branch: false,
      code_scanning_default_setup_enabled: true,
      delete_branch_on_merge: false,
      description: "Simulator implementation of uProtocol to simulate other implementations (zenoh, android, cloud, etc..)",
      web_commit_signoff_required: false,
    },
    orgs.newRepo('up-simulator-proxy') {
      allow_update_branch: false,
      code_scanning_default_setup_enabled: true,
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
      allow_update_branch: false,
      code_scanning_default_setup_enabled: true,
      code_scanning_default_languages+: [
        "actions",
      ],
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
          required_approving_review_count: 1,
        },
      ],
    },
    orgs.newRepo('up-streamer-rust') {
      allow_update_branch: false,
      code_scanning_default_languages+: [
        "actions"
      ],
      code_scanning_default_setup_enabled: true,
      description: "Generic uStreamer implementation written in Rust",
      web_commit_signoff_required: false,
      environments: [
        orgs.newEnvironment('production'),
      ],
      branch_protection_rules: [
        orgs.newBranchProtectionRule('main') {
          required_approving_review_count: 1,
        },
      ],
    },
    orgs.newRepo('up-subscription-rust') {
      allow_update_branch: false,
      description: "uSubscription service written in Rust",
      topics+: [
        "rust",
        "uprotocol",
        "usubscription"
      ],
      web_commit_signoff_required: false,
      branch_protection_rules: [
        orgs.newBranchProtectionRule('main') {
          required_approving_review_count: 1,
        },
      ],
    },
    orgs.newRepo('up-tck') {
      allow_update_branch: false,
      code_scanning_default_languages+: [
        "python"
      ],
      code_scanning_default_setup_enabled: true,
      description: "uProtocol Test Compatibility Kit",
      web_commit_signoff_required: false,
    },
    orgs.newRepo('up-tools') {
      allow_update_branch: false,
      description: "Repository for code generators and other uProtocol tools",
      web_commit_signoff_required: false,
    },
    orgs.newRepo('up-transport-android-java') {
      allow_update_branch: false,
      code_scanning_default_setup_enabled: true,
      description: "Java Client Library to connect to the Android implementation of uProtocol",
      topics+: [
        "android",
        "java",
        "up-transport",
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
    orgs.newRepo('up-transport-android-kotlin') {
      allow_update_branch: false,
      code_scanning_default_setup_enabled: true,
      description: "Kotlin Client Library to connect to the Android implementation of uProtocol",
      web_commit_signoff_required: false,
    },
    orgs.newRepo('up-transport-android-rust') {
      allow_update_branch: false,
      code_scanning_default_setup_enabled: true,
      description: "Rust client side Library for Android implementation of uProtocol",
      web_commit_signoff_required: false,
    },
    orgs.newRepo('up-transport-azure-java') {
      allow_update_branch: false,
      code_scanning_default_setup_enabled: true,
      description: "Java client side Library to build uEs that will run on Azure",
      web_commit_signoff_required: false,
    },
    orgs.newRepo('up-transport-mqtt5-java') {
      allow_update_branch: false,
      description: "Java uPClient for MQTT5",
      topics+: [
        "java",
        "mqtt5",
        "up-transport",
        "uprotocol"
      ],
      web_commit_signoff_required: false,
    },
    orgs.newRepo('up-transport-mqtt5-python') {
      allow_update_branch: false,
      description: "Python uPClient for MQTT5 to be used by up-simulator and others",
      topics+: [
        "mqtt5",
        "python",
        "up-transport",
        "uprotocol"
      ],
      web_commit_signoff_required: false,
    },
    orgs.newRepo('up-transport-mqtt5-rust') {
      allow_update_branch: false,
      description: "Rust client to communicate with a MQTT5 broker",
      web_commit_signoff_required: false,
      branch_protection_rules: [
        orgs.newBranchProtectionRule('main') {
          required_approving_review_count: 1,
        },
      ],
    },
    orgs.newRepo('up-transport-socket') {
      allow_update_branch: false,
      description: "Simple socket implementations of uTransport written in C++, Rust, Python, and Java to test uE-2-uE communication",
      topics+: [
        "cpp",
        "java",
        "python",
        "rust",
        "socket",
        "up-transport",
        "uprotocol"
      ],
      web_commit_signoff_required: false,
    },
    orgs.newRepo('up-transport-springboot-java') {
      allow_update_branch: false,
      description: "Springboot implementation of uProtocol that could be used for development of cloud microservices",
      topics+: [
        "java",
        "springboot",
        "up-transport",
        "uprotocol"
      ],
      web_commit_signoff_required: false,
    },
    orgs.newRepo('up-transport-vsomeip-cpp') {
      allow_update_branch: false,
      description: "C++ uPClient for vsomeip (SOME/IP)",
      topics+: [
        "cpp",
        "up-transport",
        "uprotocol",
        "vsomeip"
      ],
      web_commit_signoff_required: false,
    },
    orgs.newRepo('up-transport-vsomeip-python') {
      allow_update_branch: false,
      description: "Python uPClient implementation for SOME/IP using vsomeip",
      topics+: [
        "python",
        "up-transport",
        "uprotocol",
        "vsomeip"
      ],
      web_commit_signoff_required: false,
    },
    orgs.newRepo('up-transport-vsomeip-rust') {
      allow_update_branch: false,
      description: "Rust uPClient for vsomeip (SOME/IP)",
      topics+: [
        "rust",
        "up-transport",
        "uprotocol",
        "vsomeip"
      ],
      web_commit_signoff_required: false,
    },
    orgs.newRepo('up-transport-zenoh-cpp') {
      allow_update_branch: false,
      description: "C++ client library to connect to the zenoh implementation of uProtocol",
      topics+: [
        "cpp",
        "up-transport",
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
        orgs.newBranchProtectionRule('v*.*_up-v*.*.*') {
          required_approving_review_count: 1,
          required_status_checks+: [
            "CI status checks"
          ],
        },
      ],
    },
    orgs.newRepo('up-transport-zenoh-python') {
      allow_update_branch: false,
      code_scanning_default_languages+: [
        "python"
      ],
      code_scanning_default_setup_enabled: true,
      description: "Python uPClient implementation for the Zenoh transport",
      topics+: [
        "python",
        "up-transport",
        "uprotocol",
        "zenoh"
      ],
      web_commit_signoff_required: false,
    },
    orgs.newRepo('up-transport-zenoh-rust') {
      allow_update_branch: false,
      code_scanning_default_languages+: [
        "actions"
      ],
      code_scanning_default_setup_enabled: true,
      description: "Rust client-side library to talk to the Zenoh implementation of uProtocol",
      topics+: [
        "rust",
        "up-transport",
        "zenoh"
      ],
      web_commit_signoff_required: false,
      branch_protection_rules: [
        orgs.newBranchProtectionRule('main') {
          required_approving_review_count: 1,
        },
      ],
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
      description: "C++ Example application and service that utilizes up-transport-zenoh-cpp",
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
      description: "Example code for zenoh using up-transport-zenoh-rust",
      topics+: [
        "example",
        "rust",
        "uprotocol",
        "zenoh"
      ],
      web_commit_signoff_required: false,
    },
    orgs.newRepo('up-transport-iceoryx2-rust') {
      allow_update_branch: false,
      description: "Rust uTransport implementation for iceoryx2",
      web_commit_signoff_required: false,
      topics+: [
        "rust",
        "uprotocol",
        "iceoryx2"
      ],
      branch_protection_rules: [
        orgs.newBranchProtectionRule('main') {
          required_approving_review_count: 1,
        },
      ],
    }
  ],
}
