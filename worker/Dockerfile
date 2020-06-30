from node:alpine
workdir '/app'
copy .package.json ./
run npm imstall
copy . .
cmd ["npm","run","start"]
