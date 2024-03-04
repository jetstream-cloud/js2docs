> [!CAUTION]
> This repository has been permanently migrated to GitLab: [https://gitlab.com/jetstream-cloud/docs](https://gitlab.com/jetstream-cloud/docs).

# Jetstream2 Documentation

Test this one out locally by installing mkdocs in your local python venv!
`pip install mkdocs`

Then build:
`mkdocs build`

and serve, to view on `localhost:8000`:
`mkdocs serve`

## Updating the Usage Estimation Calculator
The usage estimator calculator (located at docs/alloc/estimator/) is a web component written in Vue 3 and TypeScript, and source code can be found at https://github.com/kjunuh/js2-usage-estimator. 

To update the estimator, follow the "project setup" found at https://github.com/kjunuh/js2-usage-estimator#project-setup. After making edits and building, copy and rename the resulting javascript file found at `usage-estimator/dist/assets/index.{build}.js` into `docs/js/usage_estimator.js`. After mkdocs rebuilds, the estimator page should load using the updated calculator web component.
