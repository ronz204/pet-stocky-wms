### Proof of Concepts | REST & GraphQL Server

Proof of concept server demonstrating both REST and GraphQL APIs using Elysia and the Bun runtime.

### Prerequisites

Install Bun using Scoop (Windows):
```bash
scoop install bun
```

For other installation methods, visit [bun.sh](https://bun.sh)

### Getting Started

1. Install dependencies:
```bash
bun install
```

2. Run the development server (with hot reload):
```bash
bun run dev
```

3. Open [http://localhost:3000](http://localhost:3000) to test the API.

### Project Structure

```
.
├── src/
│   └── entrypoint.ts     # Main server file
├── package.json          # Project configuration
├── tsconfig.json         # TypeScript configuration
└── Dockerfile            # Docker configuration
```