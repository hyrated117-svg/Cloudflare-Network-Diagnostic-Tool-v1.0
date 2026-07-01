name: Bug Report
description: Report a bug or issue
labels: ["bug"]
body:
  - type: markdown
    attributes:
      value: |
        ## Bug Report

        Thank you for reporting a bug! Please provide as much detail as possible.

  - type: input
    id: title
    attributes:
      label: Bug Title
      description: Brief description of the bug
      placeholder: "e.g., App crashes on DNS benchmark test"
    validations:
      required: true

  - type: textarea
    id: description
    attributes:
      label: Description
      description: Detailed description of the bug
      placeholder: "Describe what happened..."
    validations:
      required: true

  - type: textarea
    id: steps
    attributes:
      label: Steps to Reproduce
      description: Steps to reproduce the bug
      placeholder: |
        1. Open the app
        2. Go to...
        3. Click on...
    validations:
      required: true

  - type: textarea
    id: expected
    attributes:
      label: Expected Behavior
      description: What should happen
    validations:
      required: true

  - type: textarea
    id: actual
    attributes:
      label: Actual Behavior
      description: What actually happened

  - type: input
    id: version
    attributes:
      label: Version
      description: App version where the bug occurs
      placeholder: "e.g., 1.0.0"
    validations:
      required: true

  - type: dropdown
    id: platform
    attributes:
      label: Platform
      options:
        - iOS
        - macOS
        - Web
    validations:
      required: true

  - type: textarea
    id: logs
    attributes:
      label: Logs or Error Messages
      description: Any error logs or messages
      render: bash

  - type: checkboxes
    id: checklist
    attributes:
      label: Checklist
      options:
        - label: I have searched for existing issues
          required: true
        - label: I have provided enough detail
          required: true