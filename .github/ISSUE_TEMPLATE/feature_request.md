name: Feature Request
description: Suggest a new feature or enhancement
labels: ["enhancement"]
body:
  - type: markdown
    attributes:
      value: |
        ## Feature Request

        We'd love to hear your ideas! Please describe your feature request.

  - type: input
    id: title
    attributes:
      label: Feature Title
      description: Brief description of the feature
      placeholder: "e.g., Add packet loss detection"
    validations:
      required: true

  - type: textarea
    id: description
    attributes:
      label: Description
      description: Detailed description of the feature
      placeholder: "Describe what you'd like to see..."
    validations:
      required: true

  - type: textarea
    id: motivation
    attributes:
      label: Motivation
      description: Why would this feature be useful?
    validations:
      required: true

  - type: textarea
    id: implementation
    attributes:
      label: Proposed Implementation
      description: How do you think this could be implemented?

  - type: checkboxes
    id: checklist
    attributes:
      label: Checklist
      options:
        - label: This feature doesn't already exist
          required: true
        - label: I have described the use case
          required: true