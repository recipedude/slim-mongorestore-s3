#!/bin/bash

# MONGORESTORE
if [[ -z "${MONGO_URI}" ]]; then
	echo "MONGO_URI not set, sleeping to leave the container running"
	sleep 900000000
else
  cd /data
  AWS_CMD="aws s3 cp $AWS_S3_URI ."
  echo "$AWS_CMD"
  $AWS_CMD

  CMD="mongorestore $MONGO_RESTORE_OPTIONS"

  # dryrun
  if [[ -n "${MONGORESTORE_DRYRUN}" ]]; then
    CMD="$CMD --dryRun"
  fi

  # restore from compressed backup/archive
  if [[ -n "${MONGORESTORE_GZIP}" ]]; then
    CMD="$CMD --gzip"
  fi

  # backup a specific database only?
  if [[ -n "${MONGORESTORE_DB}" ]]; then
    BACKUP_NAME="$BACKUP_NAME-$MONGORESTORE_DB"
    CMD="$CMD --db=$MONGORESTORE_DB"
  fi

  # archive
  if [[ -n "${MONGORESTORE_ARCHIVE}" ]]; then
    CMD="$CMD --archive=$MONGORESTORE_ARCHIVE"
  fi

  # batchSize
  if [[ -n "${MONGORESTORE_BATCHSIZE}" ]]; then
    CMD="$CMD --batchSize=$MONGORESTORE_BATCHSIZE"
  fi

  # ns-from
  if [[ -n "${MONGORESTORE_NS_FROM}" ]]; then
    CMD="$CMD --nsFrom='$MONGORESTORE_NS_FROM'"
  fi

  # ns-to
  if [[ -n "${MONGORESTORE_NS_TO}" ]]; then
    CMD="$CMD --nsTo='$MONGORESTORE_NS_TO'"
  fi

  # ns include
  if [[ -n "${MONGORESTORE_NS_INCLUDE}" ]]; then
    CMD="$CMD --nsFrom='$MONGORESTORE_NS_INCLUDE'"
  fi

  # ns exclude
  if [[ -n "${MONGORESTORE_NS_EXCLUDE}" ]]; then
    CMD="$CMD --nsFrom='$MONGORESTORE_NS_EXCLUDE'"
  fi

  # drop
  if [[ -n "${MONGORESTORE_DROP}" ]]; then
    CMD="$CMD --drop"
  fi

  # number of parallel connections
  if [[ -n "${MONGORESTORE_NUM_PARALLEL}" ]]; then
    CMD="$CMD -j=$MONGORESTORE_NUM_PARALLEL"
  fi

  # number of parallel connections
  if [[ -n "${MONGORESTORE_NUM_INSERTWORKERS}" ]]; then
    CMD="$CMD --numInsertionWorkersPerCollection=$MONGORESTORE_NUM_INSERTWORKERS"
  fi

  echo "Running: $CMD"
  CMD="$CMD --uri=\"$MONGO_URI\""
  date
  $CMD
  date
  
fi

echo "finished"
date
