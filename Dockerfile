ARG IMAGE_TAG="10-alpine"

FROM node:$IMAGE_TAG

# Add Git to enable Yarn to install Git repositories directly as dependencies.
RUN apk update && apk add git

USER node

CMD ["node"]
