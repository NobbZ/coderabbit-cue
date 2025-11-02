package coderabbit

import (
	"strings"
	"list"
)

#Config: {
	@jsonschema(schema="http://json-schema.org/draft-07/schema#")

	#schema

	#schema: close({
		// Set the language for reviews by using the corresponding ISO
		// language code.
		language?: "de" | "de-DE" | "de-AT" | "de-CH" | "en" | "en-US" | "en-AU" | "en-GB" | "en-CA" | "en-NZ" | "en-ZA" | "es" | "es-AR" | "fr" | "fr-CA" | "fr-CH" | "fr-BE" | "nl" | "nl-BE" | "pt-AO" | "pt" | "pt-BR" | "pt-MZ" | "pt-PT" | "ar" | "ast-ES" | "ast" | "be-BY" | "be" | "br-FR" | "br" | "ca-ES" | "ca" | "ca-ES-valencia" | "ca-ES-balear" | "da-DK" | "da" | "de-DE-x-simple-language" | "el-GR" | "el" | "eo" | "fa" | "ga-IE" | "ga" | "gl-ES" | "gl" | "it" | "ja-JP" | "ja" | "km-KH" | "km" | "ko-KR" | "ko" | "pl-PL" | "pl" | "ro-RO" | "ro" | "ru-RU" | "ru" | "sk-SK" | "sk" | "sl-SI" | "sl" | "sv" | "ta-IN" | "ta" | "tl-PH" | "tl" | "tr" | "uk-UA" | "uk" | "zh-CN" | "zh" | "crh-UA" | "crh" | "cs-CZ" | "cs" | "nb" | "no" | "nl-NL" | "de-DE-x-simple-language-DE" | "es-ES" | "it-IT" | "fa-IR" | "sv-SE" | "de-LU" | "fr-FR" | "bg-BG" | "bg" | "he-IL" | "he" | "hi-IN" | "hi" | "vi-VN" | "vi" | "th-TH" | "th" | "bn-BD" | "bn"

		// Set the tone of reviews and chat. Example: 'You must use talk
		// like Mr. T. I pity the fool who doesn't!'
		tone_instructions?: strings.MaxRunes(250)

		// Enable early-access features.
		early_access?: bool

		// Enable free tier features for users not on a paid plan.
		enable_free_tier?: bool

		// Settings related to reviews.
		reviews?: close({
			// Set the profile for reviews. Assertive profile yields more
			// feedback, that may be considered nitpicky.
			profile?: "chill" | "assertive"

			// Approve the review once CodeRabbit’s comments are resolved and
			// no pre-merge checks are in an error state. Note: In GitLab,
			// all discussions must be resolved.
			request_changes_workflow?: bool

			// Generate a high level summary of the changes in the PR/MR
			// description.
			high_level_summary?: bool

			// Placeholder in the PR/MR description that gets replaced with
			// the high level summary.
			high_level_summary_placeholder?: string

			// Include the high level summary in the walkthrough comment.
			high_level_summary_in_walkthrough?: bool

			// Add this keyword in the PR/MR title to auto-generate the title.
			auto_title_placeholder?: string

			// Auto Title Instructions | Custom instructions for
			// auto-generating the PR/MR title.
			auto_title_instructions?: string

			// Post review details on each review. Additionally, post a review
			// status when a review is skipped in certain cases.
			review_status?: bool

			// Set the commit status to 'pending' when the review is in
			// progress and 'success' when it is complete.
			commit_status?: bool

			// Set the commit status to 'failure' when the PR cannot be
			// reviewed by CodeRabbit for any reason.
			fail_commit_status?: bool

			// Generate walkthrough in a markdown collapsible section.
			collapse_walkthrough?: bool

			// Generate a summary of the changed files in the walkthrough.
			changed_files_summary?: bool

			// Generate sequence diagrams in the walkthrough.
			sequence_diagrams?: bool

			// Estimate the code review effort in the walkthrough.
			estimate_code_review_effort?: bool

			// Generate an assessment of how well the changes address the
			// linked issues in the walkthrough.
			assess_linked_issues?: bool

			// Include possibly related issues in the walkthrough.
			related_issues?: bool

			// Related PRs | Include possibly related pull requests in the
			// walkthrough.
			related_prs?: bool

			// Suggest labels based on the changes in the pull request in the
			// walkthrough.
			suggested_labels?: bool

			// Labeling Instructions | Provide guidelines for suggesting
			// labels for the PR/MR. When specific labels or instructions are
			// provided, only those labels are considered, though previous
			// examples are still used to inform the suggestions. If no such
			// labels are provided, suggestions are based solely on previous
			// PR/MRs.
			labeling_instructions?: [...close({
				// Label to suggest for the PR/MR. Example: frontend
				label!: string

				// Instructions for the label. Example: Apply when the PR/MR
				// contains changes to the react components.
				instructions!: strings.MaxRunes(3000)
			})]

			// Automatically apply the suggested labels to the PR/MR.
			auto_apply_labels?: bool

			// Suggest reviewers based on the changes in the pull request in
			// the walkthrough.
			suggested_reviewers?: bool

			// Automatically assign suggested reviewers to the pull request
			auto_assign_reviewers?: bool

			// Post an in-progress fortune message while the review is in
			// progress.
			in_progress_fortune?: bool

			// Generate a poem in the walkthrough comment.
			poem?: bool

			// Specify file patterns to include or exclude in a review using
			// glob patterns (e.g., !dist/**, src/**). These patterns also
			// apply to 'git sparse-checkout', including specified patterns
			// and ignoring excluded ones (starting with '!') when cloning
			// the repository.
			path_filters?: [...string]

			// Path Instructions | Provide specific additional guidelines for
			// code review based on file paths.
			path_instructions?: [...close({
				// File path glob pattern. Example: **/*.js
				path!: string

				// Provides specific additional guidelines for code review based
				// on file paths.
				instructions!: strings.MaxRunes(20000)
			})]

			// Abort the in-progress review if the pull request is closed or
			// merged.
			abort_on_close?: bool

			// Disable caching of code and dependencies. This will force
			// CodeRabbit to download the code and dependencies fresh from
			// the repository each time.
			disable_cache?: bool
			auto_review?: close({
				// Automatic Review | Automatic code review
				enabled?: bool

				// Automatic Incremental Review | Automatic incremental code
				// review on each push
				auto_incremental_review?: bool

				// Ignore reviewing if the title of the pull request contains any
				// of these keywords (case-insensitive).
				ignore_title_keywords?: [...string]

				// List of labels to control which PRs/MRs to review. Labels
				// starting with '!' are negative matches. Examples: ['bug',
				// 'feature'] - reviews PRs with 'bug' OR 'feature' label.
				// ['!wip'] - reviews all PRs except those with 'wip' label.
				// ['bug', '!wip'] - reviews PRs with 'bug' label but not if they
				// have 'wip' label.
				labels?: [...string]

				// Review draft PRs/MRs.
				drafts?: bool

				// Base branches (other than the default branch) to review.
				// Accepts regex patterns. Use '.*' to match all branches.
				base_branches?: [...string]

				// Ignore reviewing pull requests by these usernames. These should
				// match the Git platform usernames exactly, not the email
				// addresses.
				ignore_usernames?: [...string]
			})
			finishing_touches?: close({
				// Docstrings | Options for generating Docstrings for your
				// PRs/MRs.
				docstrings?: close({
					// Docstrings | Allow CodeRabbit to generate docstrings for
					// PRs/MRs.
					enabled?: bool
				})

				// Unit Tests | Options for generating unit tests for your
				// PRs/MRs.
				unit_tests?: close({
					// Unit Tests | Allow CodeRabbit to generate unit tests for
					// PRs/MRs.
					enabled?: bool
				})
			})
			pre_merge_checks?: close({
				// Docstring Coverage | Checks if the code has sufficient
				// docstrings.
				docstrings?: close({
					// Mode | Determines how strictly the docstring coverage check is
					// enforced. Warning will only generate a warning and does not
					// require the user to resolve the check. Error requires the user
					// to resolve issues before merging the pull request. If set to
					// error and the request changes workflow is enabled, the pull
					// request will be blocked until the issues are resolved.
					mode?: "off" | "warning" | "error"

					// Percentage threshold for docstring coverage check.
					threshold?: >=0 & <=100
				})

				// Title Check | Checks if the pull request title is appropriate
				// and follows best practices.
				title?: close({
					// Mode | Determines how strictly the title check is enforced.
					// Warning will only generate a warning and does not require the
					// user to resolve the check. Error requires the user to resolve
					// issues before merging the pull request. If set to error and
					// the request changes workflow is enabled, the pull request will
					// be blocked until the issues are resolved.
					mode?: "off" | "warning" | "error"

					// Requirements | Requirements for the pull request title.
					// Example: 'Title should be concise and descriptive, ideally
					// under 50 characters.'
					requirements?: string
				})

				// Description Check | Checks if the pull request description is
				// appropriate and follows best practices.
				description?: close({
					// Mode | Determines how strictly the description check is
					// enforced. Warning will only generate a warning and does not
					// require the user to resolve the check. Error requires the user
					// to resolve issues before merging the pull request. If set to
					// error and the request changes workflow is enabled, the pull
					// request will be blocked until the issues are resolved.
					mode?: "off" | "warning" | "error"
				})

				// Linked Issue Assessment | Checks if the pull request addresses
				// the linked issues. Generate an assessment of how well the
				// changes address the linked issues.
				issue_assessment?: close({
					// Mode | Determines how strictly the issue assessment check is
					// enforced. Warning will only generate a warning and does not
					// require the user to resolve the check. Error requires the user
					// to resolve issues before merging the pull request. If set to
					// error and the request changes workflow is enabled, the pull
					// request will be blocked until the issues are resolved.
					mode?: "off" | "warning" | "error"
				})

				// Custom Pre-merge Checks | Add unique checks to enforce your
				// team's standards before merging a pull request. Each check
				// must have a unique name (up to 50 characters) and clear
				// instructions (up to 10000 characters). Use these to
				// automatically verify coding, security, documentation, or
				// business rules and maintain code quality.
				custom_checks?: list.MaxItems(5) & [...close({
					// Mode | Determines how strictly the custom check is enforced.
					// Warning will only generate a warning and does not require the
					// user to resolve the check. Error requires the user to resolve
					// issues before merging the pull request. If set to error and
					// the request changes workflow is enabled, the pull request will
					// be blocked until the issues are resolved.
					mode?: "off" | "warning" | "error"

					// Name | Name of the custom check. Maximum length is 50
					// characters.
					name!: strings.MaxRunes(50) & strings.MinRunes(1)

					// Instructions | Please ensure that the instructions specify
					// conditions that deterministically result in a clear pass or
					// fail outcome. The maximum length for this field is 10,000
					// characters.
					instructions!: strings.MaxRunes(10000) & strings.MinRunes(1)
				})]
			})

			// Tools that provide additional context to code reviews.
			tools?: close({
				// Enable ast-grep | ast-grep is a code analysis tool that helps
				// you to find patterns in your codebase using abstract syntax
				// trees patterns. | v0.39.6
				"ast-grep"?: close({
					// List of rules directories.
					rule_dirs?: [...string]

					// List of utils directories.
					util_dirs?: [...string]

					// Use ast-grep essentials package.
					essential_rules?: bool

					// Predefined packages to be used.
					packages?: [...string]
				})

				// ShellCheck is a static analysis tool that finds bugs in your
				// shell scripts.
				shellcheck?: close({
					// Enable ShellCheck | ShellCheck is a static analysis tool that
					// finds bugs in your shell. | Enable ShellCheck integration. |
					// v0.11.0
					enabled?: bool
				})

				// Ruff is a Python linter and code formatter.
				ruff?: close({
					// Enable Ruff | Ruff is a Python linter and code formatter. |
					// Enable Ruff integration. | v0.14.2
					enabled?: bool
				})

				// markdownlint-cli2 is a static analysis tool to enforce
				// standards and consistency for Markdown files.
				markdownlint?: close({
					// Enable markdownlint | markdownlint-cli2 is a static analysis
					// tool to enforce standards and consistency for Markdown files.
					// | Enable markdownlint integration. | v0.18.1
					enabled?: bool
				})

				// GitHub Checks integration configuration.
				"github-checks"?: close({
					// Enable GitHub Checks
					// | Enable integration, defaults to true
					// | Enable GitHub Checks integration.
					enabled?: bool

					// Time in milliseconds to wait for all GitHub Checks to conclude.
					// Default 90 seconds, max 15 minutes (900000ms).
					timeout_ms?: <=900000 & >=0
				})

				// LanguageTool is a style and grammar checker for 30+ languages.
				languagetool?: close({
					// Enable LanguageTool | Enable LanguageTool integration.
					enabled?: bool

					// IDs of rules to be enabled. The rule won't run unless 'level'
					// is set to a level that activates the rule.
					enabled_rules?: [...string]

					// IDs of rules to be disabled. Note: EN_UNPAIRED_BRACKETS, and
					// EN_UNPAIRED_QUOTES are always disabled.
					disabled_rules?: [...string]

					// IDs of categories to be enabled.
					enabled_categories?: [...string]

					// IDs of categories to be disabled. Note: TYPOS, TYPOGRAPHY, and
					// CASING are always disabled.
					disabled_categories?: [...string]

					// Only the rules and categories whose IDs are specified with
					// 'enabledRules' or 'enabledCategories' are enabled.
					enabled_only?: bool

					// If set to 'picky', additional rules will be activated, i.e.
					// rules that you might only find useful when checking formal
					// text.
					level?: "default" | "picky"
				})

				// Biome is a fast formatter, linter, and analyzer for web
				// projects.
				biome?: close({
					// Enable Biome | Biome is a fast formatter, linter, and analyzer
					// for web projects. | Enable Biome integration. | v2.1.2
					enabled?: bool
				})

				// Hadolint is a Dockerfile linter.
				hadolint?: close({
					// Enable Hadolint | Hadolint is a Dockerfile linter. | Enable
					// Hadolint integration. | v2.14.0
					enabled?: bool
				})

				// SwiftLint integration configuration object.
				swiftlint?: close({
					// Enable SwiftLint | SwiftLint is a Swift linter. | Enable
					// SwiftLint integration. | v0.57.0
					enabled?: bool

					// Optional path to the SwiftLint configuration file relative to
					// the repository. This is useful when the configuration file is
					// named differently than the default '.swiftlint.yml' or
					// '.swiftlint.yaml'.
					config_file?: string
				})

				// PHPStan is a tool to analyze PHP code.
				phpstan?: close({
					// Enable PHPStan | PHPStan requires [config
					// file](https://phpstan.org/config-reference#config-file) in
					// your repository root. Please ensure that this file contains
					// the `paths:` parameter. | v2.1.31
					enabled?: bool

					// Level | Specify the [rule
					// level](https://phpstan.org/user-guide/rule-levels) to run.
					// This setting is ignored if your configuration file already has
					// a `level:` parameter.
					level?: "default" | "0" | "1" | "2" | "3" | "4" | "5" | "6" | "7" | "8" | "9" | "max"
				})

				// PHPMD is a tool to find potential problems in PHP code.
				phpmd?: close({
					// Enable PHPMD | PHPMD is a tool to find potential problems in
					// PHP code. | v2.15.0
					enabled?: bool
				})

				// PHP CodeSniffer is a PHP linter and coding standard checker.
				phpcs?: close({
					// Enable PHP CodeSniffer | PHP CodeSniffer is a PHP linter and
					// coding standard checker. | v3.7.2
					enabled?: bool
				})

				// golangci-lint is a fast linters runner for Go.
				"golangci-lint"?: close({
					// Enable golangci-lint | golangci-lint is a fast linters runner
					// for Go. | Enable golangci-lint integration. | v2.5.0
					enabled?: bool

					// Optional path to the golangci-lint configuration file relative
					// to the repository. Useful when the configuration file is named
					// differently than the default '.golangci.yml',
					// '.golangci.yaml', '.golangci.toml', '.golangci.json'.
					config_file?: string
				})

				// YAMLlint is a linter for YAML files.
				yamllint?: close({
					// Enable YAMLlint | YAMLlint is a linter for YAML files. | Enable
					// YAMLlint integration. | v1.37.1
					enabled?: bool
				})

				// Gitleaks is a secret scanner.
				gitleaks?: close({
					// Enable Gitleaks | Gitleaks is a secret scanner. | Enable
					// Gitleaks integration. | v8.28.0
					enabled?: bool
				})

				// Checkov is a static code analysis tool for
				// infrastructure-as-code files.
				checkov?: close({
					// Enable Checkov | Checkov is a static code analysis tool for
					// infrastructure-as-code files. | v3.2.334
					enabled?: bool
				})

				// Detekt is a static code analysis tool for Kotlin files.
				detekt?: close({
					// Enable detekt | detekt is a static code analysis tool for
					// Kotlin files. | v1.23.8
					enabled?: bool

					// Optional path to the detekt configuration file relative to the
					// repository.
					config_file?: string
				})

				// ESLint is a static code analysis tool for JavaScript files.
				eslint?: close({
					// Enable ESLint | ESLint is a static code analysis tool for
					// JavaScript files.
					enabled?: bool
				})

				// Flake8 is a Python linter that wraps PyFlakes, pycodestyle and
				// Ned Batchelder's McCabe script.
				flake8?: close({
					// Enable Flake8 | Flake8 is a Python linter that wraps PyFlakes,
					// pycodestyle and Ned Batchelder's McCabe script. | v7.3.0
					enabled?: bool
				})

				// RuboCop is a Ruby static code analyzer (a.k.a. linter ) and
				// code formatter.
				rubocop?: close({
					// Enable RuboCop | RuboCop is a Ruby static code analyzer (a.k.a.
					// linter ) and code formatter. | v1.81.6
					enabled?: bool
				})

				// Buf offers linting for Protobuf files.
				buf?: close({
					// Enable Buf | Buf offers linting for Protobuf files. | v1.59.0
					enabled?: bool
				})

				// Regal is a linter and language server for Rego.
				regal?: close({
					// Enable Regal | Regal is a linter and language server for Rego.
					// | v0.36.1
					enabled?: bool
				})

				// actionlint is a static checker for GitHub Actions workflow
				// files.
				actionlint?: close({
					// Enable actionlint | is a static checker for GitHub Actions
					// workflow files. | v1.7.8
					enabled?: bool
				})

				// PMD is an extensible multilanguage static code analyzer. It’s
				// mainly concerned with Java.
				pmd?: close({
					// Enable PMD | PMD is an extensible multilanguage static code
					// analyzer. It’s mainly concerned with Java. | v7.17.0
					enabled?: bool

					// Optional path to the PMD configuration file relative to the
					// repository.
					config_file?: string
				})

				// Configuration for Clang to perform static analysis on C and C++
				// code
				clang?: close({
					// Enable Clang for C/C++ static analysis and code quality checks
					// | v14.0.6
					enabled?: bool
				})

				// Cppcheck is a static code analysis tool for the C and C++
				// programming languages.
				cppcheck?: close({
					// Enable Cppcheck | Cppcheck is a static code analysis tool for
					// the C and C++ programming languages. | v2.18.0
					enabled?: bool
				})

				// Semgrep is a static analysis tool designed to scan code for
				// security vulnerabilities and code quality issues.
				semgrep?: close({
					// Enable Semgrep | Semgrep is a static analysis tool designed to
					// scan code for security vulnerabilities and code quality
					// issues. | Enable Semgrep integration. | v1.141.0
					enabled?: bool

					// Optional path to the Semgrep configuration file relative to the
					// repository.
					config_file?: string
				})

				// CircleCI tool is a static checker for CircleCI config files.
				circleci?: close({
					// Enable CircleCI | CircleCI tool is a static checker for
					// CircleCI config files. | v0.1.33494
					enabled?: bool
				})

				// Clippy is a collection of lints to catch common mistakes and
				// improve your Rust code.
				clippy?: close({
					// Enable Clippy | Clippy is a collection of lints to catch common
					// mistakes and improve your Rust code. | Enable Clippy
					// integration.
					enabled?: bool
				})

				// SQLFluff is an open source, dialect-flexible and configurable
				// SQL linter.
				sqlfluff?: close({
					// Enable SQLFluff | SQLFluff is an open source, dialect-flexible
					// and configurable SQL linter. | v3.5.0
					enabled?: bool
				})

				// Configuration for Prisma Schema linting to ensure schema file
				// quality
				prismaLint?: close({
					// Enable Prisma Schema linting | Prisma Schema linting helps
					// maintain consistent and error-free schema files | v0.10.3
					enabled?: bool
				})

				// Pylint is a Python static code analysis tool.
				pylint?: close({
					// Enable Pylint | Pylint is a Python static code analysis tool. |
					// v4.0.2
					enabled?: bool
				})

				// Oxlint is a JavaScript/TypeScript linter for OXC written in
				// Rust.
				oxc?: close({
					// Enable Oxlint | Oxlint is a JavaScript/TypeScript linter for
					// OXC written in Rust. | v1.24.0
					enabled?: bool
				})

				// Configuration for Shopify Theme Check to ensure theme quality
				// and best practices
				shopifyThemeCheck?: close({
					// Enable Shopify Theme Check | A linter for Shopify themes that
					// helps you follow Shopify theme & Liquid best practices | cli
					// 3.84.2 | theme 3.58.2
					enabled?: bool
				})

				// Configuration for Lua code linting to ensure code quality
				luacheck?: close({
					// Enable Lua code linting | Luacheck helps maintain consistent
					// and error-free Lua code | v1.2.0
					enabled?: bool
				})

				// Brakeman is a static analysis security vulnerability scanner
				// for Ruby on Rails applications. | v7.1.0
				brakeman?: close({
					// Enable Brakeman | Brakeman is a static analysis security
					// vulnerability scanner for Ruby on Rails applications. | v7.1.0
					enabled?: bool
				})

				// dotenv-linter is a tool for checking and fixing .env files for
				// problems and best practices
				dotenvLint?: close({
					// Enable dotenv-linter | dotenv-linter is a tool for checking and
					// fixing .env files for problems and best practices | v4.0.0
					enabled?: bool
				})

				// HTMLHint is a static code analysis tool for HTML files.
				htmlhint?: close({
					// Enable HTMLHint | HTMLHint is a static code analysis tool for
					// HTML files. | Enable HTMLHint integration. | v1.7.1
					enabled?: bool
				})

				// checkmake is a linter for Makefiles.
				checkmake?: close({
					// Enable checkmake | checkmake is a linter for Makefiles. |
					// v0.2.2
					enabled?: bool
				})

				// OSV Scanner is a tool for vulnerability package scanning.
				osvScanner?: close({
					// Enable OSV Scanner | OSV Scanner is a tool for vulnerability
					// package scanning | v2.2.3
					enabled?: bool
				})
			})
		})
		chat?: close({
			// Generate art in response to chat messages. CodeRabbit expresses
			// emotions as either ASCII or Emoji art.
			art?: bool

			// Enable the bot to reply automatically without requiring the
			// user to tag it.
			auto_reply?: bool
			integrations?: close({
				jira?: close({
					// Jira | Enable the Jira integration for opening issues, etc.
					// 'auto' disables the integration for public repositories.
					usage?: "auto" | "enabled" | "disabled"
				})
				linear?: close({
					// Linear | Enable the Linear integration for opening issues, etc.
					// 'auto' disables the integration for public repositories.
					usage?: "auto" | "enabled" | "disabled"
				})
			})
		})
		knowledge_base?: close({
			// Opt Out | Disable all knowledge base features that require data
			// retention. If you opt out after opting in, all of your
			// existing knowledge base data will be removed from the system.
			opt_out?: bool
			web_search?: close({
				// Web Search | Enable the web search integration.
				enabled?: bool
			})

			// CodeRabbit will analyse and learn from your organization's code
			// guidelines, which you can mention in the file patterns
			// section. These guidelines will then be used to conduct
			// thorough code reviews.
			code_guidelines?: close({
				// Enabled | Enable CodeRabbit to enforce your organization's
				// coding standards during reviews.
				enabled?: bool

				// File Patterns | Specify files for your coding guideline
				// documents in this section. CodeRabbit will scan these files to
				// understand your team's standards and apply them during code
				// reviews. Multiple files supported. File names are
				// case-sensitive. Common files like: (**/.cursorrules,
				// .github/copilot-instructions.md,
				// .github/instructions/*.instructions.md, **/CLAUDE.md,
				// **/GEMINI.md, **/.cursor/rules/*, **/.windsurfrules,
				// **/.clinerules/*, **/.rules/*, **/AGENT.md, **/AGENTS.md) are
				// included by default.
				filePatterns?: [...string]
			})
			learnings?: close({
				// Learnings | Specify the scope of learnings to use for the
				// knowledge base. 'local' uses the repository's learnings,
				// 'global' uses the organization's learnings, and 'auto' uses
				// repository's learnings for public repositories and
				// organization's learnings for private repositories.
				scope?: "local" | "global" | "auto"
			})
			issues?: close({
				// Issues | Specify the scope of git platform (GitHub/GitLab)
				// issues to use for the knowledge base. 'local' uses the
				// repository's issues, 'global' uses the organization's issues,
				// and 'auto' uses repository's issues for public repositories
				// and organization's issues for private repositories.
				scope?: "local" | "global" | "auto"
			})
			jira?: close({
				// Jira | Enable the Jira knowledge base integration. 'auto'
				// disables the integration for public repositories.
				usage?: "auto" | "enabled" | "disabled"

				// Jira Project Keys | Specify the Jira project keys to use for
				// the knowledge base.
				project_keys?: [...string]
			})
			linear?: close({
				// Linear | Enable the Linear knowledge base integration. 'auto'
				// disables the integration for public repositories.
				usage?: "auto" | "enabled" | "disabled"

				// Linear Team Keys | Specify the Linear team keys (identifiers)
				// to use for the knowledge base. E.g. 'ENG'
				team_keys?: [...string]
			})
			pull_requests?: close({
				// Pull Requests | Specify the scope of pull requests to use for
				// the knowledge base. 'local' uses the repository's pull
				// requests, 'global' uses the organization's pull requests, and
				// 'auto' uses repository's pull requests for public repositories
				// and organization's pull requests for private repositories.
				scope?: "local" | "global" | "auto"
			})
			mcp?: close({
				// MCP | Enable the MCP knowledge base integration. 'auto'
				// disables the integration for public repositories.
				usage?: "auto" | "enabled" | "disabled"

				// MCP Disabled Servers | Specify MCP server labels to disable
				// (case-insensitive). These servers will be excluded from
				// reviews and knowledge base queries.
				disabled_servers?: [...string]
			})
		})
		code_generation?: close({
			// Settings related to the generation of docstrings.
			docstrings?: close({
				// Set the language for docstrings by using the corresponding ISO
				// language code.
				language?: "de" | "de-DE" | "de-AT" | "de-CH" | "en" | "en-US" | "en-AU" | "en-GB" | "en-CA" | "en-NZ" | "en-ZA" | "es" | "es-AR" | "fr" | "fr-CA" | "fr-CH" | "fr-BE" | "nl" | "nl-BE" | "pt-AO" | "pt" | "pt-BR" | "pt-MZ" | "pt-PT" | "ar" | "ast-ES" | "ast" | "be-BY" | "be" | "br-FR" | "br" | "ca-ES" | "ca" | "ca-ES-valencia" | "ca-ES-balear" | "da-DK" | "da" | "de-DE-x-simple-language" | "el-GR" | "el" | "eo" | "fa" | "ga-IE" | "ga" | "gl-ES" | "gl" | "it" | "ja-JP" | "ja" | "km-KH" | "km" | "ko-KR" | "ko" | "pl-PL" | "pl" | "ro-RO" | "ro" | "ru-RU" | "ru" | "sk-SK" | "sk" | "sl-SI" | "sl" | "sv" | "ta-IN" | "ta" | "tl-PH" | "tl" | "tr" | "uk-UA" | "uk" | "zh-CN" | "zh" | "crh-UA" | "crh" | "cs-CZ" | "cs" | "nb" | "no" | "nl-NL" | "de-DE-x-simple-language-DE" | "es-ES" | "it-IT" | "fa-IR" | "sv-SE" | "de-LU" | "fr-FR" | "bg-BG" | "bg" | "he-IL" | "he" | "hi-IN" | "hi" | "vi-VN" | "vi" | "th-TH" | "th" | "bn-BD" | "bn"

				// Path Instructions | Provide additional guidelines for docstring
				// generation based on file paths.
				path_instructions?: [...close({
					// File path glob pattern. Example: **/*.js
					path!: string

					// Provides additional guidelines for docstring generation based
					// on file paths.
					instructions!: strings.MaxRunes(20000)
				})]
			})

			// Settings related to the generation of unit tests.
			unit_tests?: close({
				// Unit Test Generation | Provide additional guidelines for unit
				// test generation based on file paths.
				path_instructions?: [...close({
					// File path glob pattern. Example: **/*.js
					path!: string

					// Provides additional guidelines for unit test generation based
					// on file paths.
					instructions!: strings.MaxRunes(20000)
				})]
			})
		})
	})
}
