# Java Maven CI/CD Demo

A reference project that demonstrates how to build an enterprise-style CI/CD pipeline for a Java application using Maven and GitHub Actions.

The goal of this repository is not just to build a Java application, but to showcase the engineering practices commonly used by Platform Engineering and DevOps teams in production environments.

---

# Objectives

* Build a production-style GitHub Actions pipeline
* Apply code quality and security gates
* Produce immutable build artifacts
* Build and scan container images
* Demonstrate cloud authentication using GitHub OIDC
* Follow enterprise CI/CD design patterns

---

# Technology Stack

| Component            | Technology                 |
| -------------------- | -------------------------- |
| Language             | Java 17                    |
| Build Tool           | Maven                      |
| Testing              | JUnit 5                    |
| CI Platform          | GitHub Actions             |
| Containerization     | Docker                     |
| Container Registry   | Amazon ECR                 |
| Cloud Authentication | GitHub OIDC + AWS IAM Role |

---

# Repository Structure

```text
.
├── .github/
│   └── workflows/
│       └── ci.yml
├── config/
│   └── checkstyle/
├── src/
│   ├── main/
│   └── test/
├── pom.xml
├── Dockerfile
├── .gitattributes
└── README.md
```

---

# CI/CD Pipeline

The current pipeline includes the following stages:

```text
Repository Validation
        │
        ├── Pre-Commit Hooks
        ├── Dependency Review
        ├── Secret Scan
        └── CodeQL
                │
                ▼
Code Quality
        ├── Spotless
        ├── Checkstyle
        ├── PMD
        └── SpotBugs
                │
                ▼
Build
        │
        ▼
Smoke Test
        │
        ▼
Docker Build
        │
        ▼
Container Security Scan
        │
        ▼
Push Image to Amazon ECR
```

---

# Quality Gates

## Spotless

Ensures consistent source code formatting across all environments.

Checks include:

* Google Java Format
* Remove unused imports
* Trim trailing whitespace
* Ensure newline at end of file

Developer commands:

```bash
mvn spotless:apply
mvn spotless:check
```

---

## Checkstyle

Enforces Java coding standards.

Examples include:

* Naming conventions
* Import rules
* Brace placement
* Coding style consistency

Developer command:

```bash
mvn checkstyle:check
```

---

## PMD

Performs static code analysis to detect poor coding practices.

Examples include:

* Empty catch blocks
* Duplicate code
* Unused variables
* Inefficient code patterns

Developer command:

```bash
mvn pmd:check
```

---

## SpotBugs

Analyzes compiled bytecode to identify potential defects.

Examples include:

* Null pointer issues
* Resource leaks
* Incorrect API usage
* Concurrency problems

Developer command:

```bash
mvn spotbugs:check
```

---

# Security

The pipeline currently performs several security checks.

## Dependency Review

Runs on Pull Requests to detect newly introduced vulnerable dependencies.

## CodeQL

Performs static application security testing (SAST) using GitHub CodeQL.

## Gitleaks

Scans the repository history for accidentally committed secrets.

## Trivy

Scans Docker images for:

* Operating system vulnerabilities
* Library vulnerabilities
* High and Critical CVEs

Results are uploaded to GitHub Code Scanning using SARIF.

---

# Build Process

The project is built using Maven.

Typical build commands:

```bash
mvn clean compile
mvn test
mvn package
```

Build artifacts are uploaded to GitHub Actions and reused by downstream jobs.

---

# Containerization

The pipeline builds a Docker image after a successful build.

Features include:

* Docker Buildx
* GitHub Actions cache
* Immutable image tagging
* Amazon ECR integration

Image tags follow the pattern:

```text
<project-version>-<short-git-sha>
```

Example:

```text
1.0-SNAPSHOT-a1b2c3d
```

---

# AWS Integration

Authentication is performed using GitHub OpenID Connect (OIDC).

Benefits:

* No long-lived AWS access keys
* Short-lived credentials
* IAM Role assumption
* Improved security

---

# Running Locally

Clone the repository:

```bash
git clone <repository-url>
cd java-maven-ci-demo
```

Build the application:

```bash
mvn clean package
```

Run quality checks:

```bash
mvn spotless:check
mvn checkstyle:check
mvn pmd:check
mvn spotbugs:check
```

Run tests:

```bash
mvn test
```

Run the application:

```bash
java -jar target/*.jar
```

---

# Current Features

* Java 17 project
* Maven build
* JUnit 5 tests
* GitHub Actions CI
* Spotless formatting
* Checkstyle
* PMD
* SpotBugs
* Dependency Review
* CodeQL
* Gitleaks
* Docker image build
* Trivy image scanning
* Amazon ECR publishing
* GitHub OIDC authentication
* Build artifact management

---

# Planned Improvements

The repository is being developed incrementally to demonstrate enterprise CI/CD practices.

Upcoming additions include:

* JaCoCo code coverage
* SonarQube integration
* OWASP Dependency-Check
* Integration testing
* SBOM generation
* Container signing
* Reusable GitHub Actions workflows
* Multi-environment deployments
* Deployment approvals
* GitHub Environments
* Progressive delivery strategies
* Release automation

---

# Purpose

This repository serves as a hands-on reference for engineers who want to understand how enterprise organizations structure Java CI/CD pipelines using GitHub Actions, Maven, Docker, AWS, and modern DevSecOps practices.
