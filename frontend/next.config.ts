import type { NextConfig } from "next";

const nextConfig: NextConfig = {
  eslint: {
    // Skip ESLint checks during production builds
    ignoreDuringBuilds: true,
  },
  typescript: {
    // Skip TypeScript type checking during production builds
    ignoreBuildErrors: true,
  },
};

export default nextConfig;
