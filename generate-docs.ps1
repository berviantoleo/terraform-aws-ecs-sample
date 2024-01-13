docker run --rm --volume "$(pwd):/terraform-docs" quay.io/terraform-docs/terraform-docs:0.17.0 markdown /terraform-docs > doc.md
