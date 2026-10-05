# Test page

A simple webpage for testing Smith builds and Cloudflare deployments.

Site: https://test-page.redmarmosetstudios.com

## Local development

Requires Node.js 22.12+ (Node.js 24 recommended) and npm.

```sh
npm ci
npm run dev
```

## Build and deploy

```sh
npm run build        # Produce dist/
npm run preview      # Preview the build locally
npm run deploy:check # Build and validate deployment without uploading
npm run deploy       # Build and deploy to Cloudflare
```

Deployment uses the project's pinned Wrangler version and the account and
custom domain in `wrangler.jsonc`. Authenticate with `npx wrangler login`, or
provide `CLOUDFLARE_API_TOKEN` on the build agent. The token needs permission
to deploy Workers and configure the custom domain in the Cloudflare account
that owns `redmarmosetstudios.com`. Keep credentials out of source control.

Cloudflare manages the custom domain's DNS record and TLS certificate.
This project serves static assets directly; no server code is needed.

## Smith

Import `git@github.com:Red-Marmoset/test-page-project.git` into Smith.
`smith.json` defines two products:

- `build`: install from the lockfile and build on a Windows agent labeled `node`.
- `deploy`: install, build, and deploy `main` on a Windows agent labeled `node`
  and `wrangler`, with Cloudflare credentials available to the agent process.

Both products collect `dist/**` as a ZIP artifact. A polling trigger checks
`main` every 120 seconds for deployment; builds can also be started manually.

The same entry point can be used outside Smith:

```powershell
./deploy/build.ps1
./deploy/build.ps1 -Deploy
```

Builds and production deployment are handled by Smith or the npm commands
above. This project does not use GitHub Actions.

## License

MIT — see [LICENSE](LICENSE).
