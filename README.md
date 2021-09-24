# slim-mongorestore-s3

Debian slim + mongorestore + AWS CLI docker image for Kubernetes; rigged up to backup mongodb, a single database, or a single collection to an s3 bucket

[![docker pulls](https://img.shields.io/docker/pulls/recipedude/slim-mongorestore-s3.svg?style=plastic)](https://cloud.docker.com/u/recipedude/repository/docker/recipedude/slim-mongorestore-s3)

This docker image contains:

- Debian slim Slim
- [MongoDB Community Edition](https://docs.mongodb.com/manual/tutorial/install-mongodb-on-debian/)
- [AWS CLI](https://docs.aws.amazon.com/cli/latest/userguide/cli-chap-welcome.html)

## Environment variables

### Source archive

```AWS_S3_URI``` - the S3 URI to the archive to restore


### MongoDB and mongorestore options

- ```MONGO_URI``` - specifies the resolvable [URI connection string](https://docs.mongodb.com/database-tools/mongorestore/#std-option-mongorestore.--uri) of the MongoDB deployment
- ```MONGORESTORE_DB``` - specifies the [destination database to restore into](https://docs.mongodb.com/database-tools/mongorestore/#std-option-mongorestore.--db) when restoring from a BSON file
- ```MONGORESTORE_COLLECTION``` - specifies the [name of the destination collection](https://docs.mongodb.com/database-tools/mongorestore/#std-option-mongorestore.--db) to restore data into when restoring from a BSON file
- ```MONGORESTORE_NS_EXCLUDE``` - [--nsExclude](https://docs.mongodb.com/database-tools/mongorestore/#std-option-mongorestore.--nsExclude)
- ```MONGORESTORE_NS_INCLUDE``` - [--nsInclude](https://docs.mongodb.com/database-tools/mongorestore/#std-option-mongorestore.--nsInclude)
- ```MONGORESTORE_NS_FROM``` - [--nsFrom](https://docs.mongodb.com/database-tools/mongorestore/#std-option-mongorestore.--nsFrom)
- ```MONGORESTORE_NS_TO``` - [--nsTo](https://docs.mongodb.com/database-tools/mongorestore/#std-option-mongorestore.--nsTo)
- ```MONGORESTORE_DROP``` - string 'true' to enable [--drop](https://docs.mongodb.com/database-tools/mongorestore/#std-option-mongorestore.--drop)
- ```MONGORESTORE_DRYRUN``` - string 'true' to enable [--dryRun](https://docs.mongodb.com/database-tools/mongorestore/#std-option-mongorestore.--dryRun)
- ```MONGORESTORE_OPLOGREPLAY``` - string 'true' to enable [--oplogReplay](https://docs.mongodb.com/database-tools/mongorestore/#std-option-mongorestore.--oplogReplay)
- ```MONGORESTORE_NUM_PARALLEL``` - number of parallel connections [numParallelCollections](https://docs.mongodb.com/database-tools/mongorestore/#std-option-mongorestore.--numParallelCollections)
- ```MONGORESTORE_NUM_INSERTWORKERS``` - number of insertion workers [numInsertionWorkersPerCollection](https://docs.mongodb.com/database-tools/mongorestore/#std-option-mongorestore.--numInsertionWorkersPerCollection)
- ```MONGORESTORE_GZIP``` - restores from compressed files [--gzip](https://docs.mongodb.com/database-tools/mongorestore/#std-option-mongorestore.--gzip)
- ```MONGORESTORE_ARCHIVE``` - archive filename input from an [archive file](https://docs.mongodb.com/database-tools/mongorestore/#std-option-mongorestore.--archive)
- ```MONGORESTORE_BATCHSIZE``` - --batchsize (undocumented) - [Mongorestore uses huge amount of RAM](https://jira.mongodb.org/browse/TOOLS-2783)


### AWS Credentials and S3 options

Pass in the following environment variables for AWS CLI credientals.

- ```AWS_ACCESS_KEY_ID``` – Specifies an AWS access key associated with an IAM user or role.
- ```AWS_SECRET_ACCESS_KEY``` – Specifies the secret key associated with the access key. This is essentially the "password" for the access key.
- ```AWS_DEFAULT_REGION``` – Specifies the [AWS Region](https://docs.aws.amazon.com/cli/latest/userguide/cli-chap-configure.html#cli-quick-configuration-region) to send the request to.
- ```AWS_PROFILE```  - specifies a pre-configured AWS profile - see AWS CLI docs

For more options you can configure with environment variables refer to: [AWS Environment Variables](https://docs.aws.amazon.com/cli/latest/userguide/cli-configure-envvars.html)






