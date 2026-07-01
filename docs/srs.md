# Software Requirements Specification
## For AMC Trip Reporting Tool

**Version:** 1.0.0
**Date:** 2026-06-15
**Status:** Draft

## Revision History

| Version | Date | Changes |
| :-----: | :--: | :-----: |
| 1.0.0 | 2026-06-15 | Initial Draft |

## Table of Contents
<!-- TOC -->
* [1. Introduction](#1-introduction)
    * [1.1 Document Purpose](#11-document-purpose)
    * [1.2 Product Scope](#12-product-scope)
    * [1.3 Definitions, Acronyms, and Abbreviations](#13-definitions-acronyms-and-abbreviations)
    * [1.4 References](#14-references)
    * [1.5 Document Overview](#15-document-overview)
* [2. Product Overview](#2-product-overview)
    * [2.1 Product Perspective](#21-product-perspective)
    * [2.2 Product Functions](#22-product-functions)
    * [2.3 Product Constraints](#23-product-constraints)
    * [2.4 User Characteristics](#24-user-characteristics)
    * [2.5 Assumptions and Dependencies](#25-assumptions-and-dependencies)
    * [2.6 Apportioning of Requirements](#26-apportioning-of-requirements)
* [3. Requirements](#3-requirements)
    * [3.1 External Interfaces](#31-external-interfaces)
    * [3.2 Functional](#32-functional)
    * [3.3 Quality of Service](#33-quality-of-service)
    * [3.4 Compliance](#34-compliance)
    * [3.5 Design and Implementation](#35-design-and-implementation)
* [4. Verification](#4-verification)
* [5. Appendixes](#5-appendixes)
<!-- TOC -->

## 1. Introduction
<!-- The purpose  -->

### 1.1 Purpose
<!-- why this SRS exists, its intended audiences, and how they'll use it; keep to 2–4 sentences and avoid implementation detail -->

This document defines the requirements for the AMC Trip Reporting Tool.

The document serves as the authoritative source for product requirements, testing, validation, and stakeholder alignment.

### 1.2 Product Scope
<!-- the product (name/version), its primary purpose, key capabilities, and boundaries. keep brief and focus on the "what" and "why", not the "how" -->

The AMC Trip Reporting Tool shall
- Track statistics about trips listed in OC
- Track attendees of each trip and their overall cumulative activity
- Display trip information in a reporting dashboard
- Allow for optional physical signed waiver upload and reporting

The AMC Trip Reporting Tool shall not
- Manage the activities in Outdoors Connector

### 1.3 Definitions, Acronyms, and Abbreviations
<!-- glossary of domain terms, acronyms, and abbreviations; keep entries alphabetized -->

| Term | Definition |
| :--: | :--------: |
| OC | Outdoors Connector |
| UI | User Interface - The visual part of computer application through which a user interacts with a software |
| API | Application Programming Interface - A set of definitions and protocols for building and integrating application software |
| OCI | [Open Container Initiative - an open governance structure for the express purpose of creating open industry standards around container formats and runtimes. |

### 1.4 References
<!-- normative and informative external sources; include title, owner, version, date, location/URL, and whether it is normative or informative -->

IEEE-29148-2018

[Open Container Initiative](https://opencontainers.org/)

[Semantic Versioning](https://semver.org/)

### 1.5 Document Overview
<!-- document structure and conventions -->

Requirement Identifiers will follow the pattern `REQ-[AREA]-[NNN]-[VER]` where
- `[AREA]` is the type of requirement. Allowed types are `FR` and `NFR` for Functional and Non-Functional, repsectively
- `[NNN]` is the requirement number where each `N` is an integer within the range `0-9`
- Optional, `[VER]` follows semantic versioning `MAJOR.MINOR.PATCH`

Requirement Identifiers must be unique and immutable; changes to Requirements increment `[VER]` and are recorded in the Revision History.

## 2. Product Overview
<!-- background and context that shape the product's requirements -->

### 2.1 Product Perspective
<!-- context of the system: a new product, a replacement, or part of a family; note relationships to other systems -->

An additional web service, adjacent to OC, enriching data about chapter led Activities.

### 2.2 Product Functions
<!-- major functional areas or features the product provides in 5–10 concise bullets -->

- Enableds trip leaders to enter additional information about an OC Activity while not creating redundant data
- Enables AMC to perform analysis on data about Activities
- Stores physical signed waivers in a PII compliant fashion

### 2.3 Product Constraints
<!-- design and implementation constraints that affect the solution -->

- Utilizes the [Flask](https://flask.palletsprojects.com/en/stable/) web application framework
- Must execute within a container
- Utilizes a relational database
- PII Storage Compliance

### 2.4 User Characteristics
<!-- classes, roles, expertise, access levels, frequency of use, and accessibility or localization needs -->

* Leaders
  * After a trip is completed, the AMC Trip Leader will fill out the report and upload a scan of any waivers signed in person and not online.
* Reviewers
  * AMC Members who review and verify the data entries of each Trip Report.

### 2.5 Assumptions and Dependencies
<!-- assumptions about environment, third-party services, usage patterns, and other external factors; note potential impact/risk. -->

- Runs via OCI compliant containers in a cloud environment
- Depends on API Access to OC

### 2.6 Apportioning of Requirements
<!-- map major requirements to subsystems, services, or releases/iterations -->

## 3. Requirements
<!-- identifiable, verifiable, testable requirements; avoid implementation details -->

### 3.1 External Interfaces
<!-- inputs/outputs (formats, protocols, timing, etc); reference interface schemas where available. -->

#### 3.1.1 User Interfaces
<!-- user interactions (UI elements, dialogs, flows); reference design/style guides -->

Web UI

Activity Entry
- A drop down menu to select the geographic region of the activity.
- A free text description of events, weather, geography, flora and fauna of the activity.
- A box to enter a free text count of the number of participants
- A box to enter a free text number for the mileage of the activity

TODO: Insert wireframes

#### 3.1.2 Hardware Interfaces
<!-- interactions with physical devices (types, signals, etc) -->

N/A

#### 3.1.3 Software Interfaces
<!-- integrations with other systems (APIs, contracts, owner, etc) -->

Integrates with an OC API.

### 3.2 Functions
<!-- externally observable behaviors organized by feature/use case -->

If an Activity participant signed a waiver in person, an email is sent to <Insert AMC Waiver Email Here>.

### 3.3 Quality of Service
<!-- measurable non-functional attributes section -->

#### 3.3.1 Performance
<!-- time (latency, throughput, etc.) and space (memory, storage, bandwidth, etc.) -->

#### 3.3.2 Security
<!-- protection of data, identities, and operations (transit/rest, auth, encryption, etc); safety, confidentiality, privacy, integrity, and availability -->

Encryption of Data in Motion and Data At Rest.

#### 3.3.3 Reliability
<!-- ability to consistently perform as specified (MTBF, redundancy/failover, caches, etc) -->

#### 3.3.4 Availability
<!-- readiness to deliver service (target SLAs, maintenance windows, recovery/restore, etc) -->

Maintenance windows will be communicated via official AMC email at least a month in advance of a planned maintenance window. Additionally, notifications will be sent out the week of, and the day of.

#### 3.3.5 Observability
<!--  logs, metrics, traces, alerting and dashboards -->

Expose runtime metrics for consumption by Prometheus.

### 3.4 Compliance
<!-- laws, standards, contracts, or policies; cite the authority and verifiable criteria. -->

PII for physically signed waivers.

### 3.5 Design and Implementation
<!-- constraints and mandates on design, deployment, and maintenance section -->

#### 3.5.1 Installation
<!-- ensure software runs smoothly in its target environments (supported platforms, prerequisites, configuration, etc) -->

#### 3.5.2 Build and Delivery
<!-- controls for building and delivering (dependency management, automation, integrity/traceability, etc) -->

#### 3.5.3 Distribution
<!-- distributed deployments, data, and devices (topologies, replication/placement, etc) -->

#### 3.5.4 Maintainability
<!-- measurable attributes that make the software easier to modify, fix, and evolve (modularity, standards, documentation, observability, etc) -->

#### 3.5.5 Reusability
<!-- components intended for reuse -->

#### 3.5.6 Portability
<!-- ability to run on multiple environments (supported OSs/runtimes, cloud providers, etc) -->

#### 3.5.7 Cost
<!-- targets/budgets that influence design or implementation (cloud spend, per-transaction, licensing, etc) -->

#### 3.5.8 Deadline
<!-- milestones, delivery dates, and readiness criteria -->

#### 3.5.9 Proof of Concept
<!-- objectives, scope, timebox, and success criteria for any POC -->

#### 3.5.10 Change Management
<!-- how changes are introduced and communicated (categories, required artifacts and workflow, etc) -->

## 4. Verification

| Requirement ID | Verification Method | Test/Artifact Link | Status | Evidence |
|----------------|---------------------|--------------------|--------|----------|
|                |                     |                    |        |          |
|                |                     |                    |        |          |

## 5. Appendixes
