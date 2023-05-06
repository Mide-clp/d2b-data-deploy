import sys
from awsglue.transforms import *
from awsglue.utils import getResolvedOptions
from pyspark.context import SparkContext
from awsglue.context import GlueContext
from awsglue.job import Job
from awsglue.dynamicframe import DynamicFrame
from pyspark.sql import functions as SqlFuncs


def sparkAggregate(
    glueContext, parentFrame, groups, aggs, transformation_ctx
) -> DynamicFrame:
    aggsFuncs = []
    for column, func in aggs:
        aggsFuncs.append(getattr(SqlFuncs, func)(column))
    result = (
        parentFrame.toDF().groupBy(*groups).agg(*aggsFuncs)
        if len(groups) > 0
        else parentFrame.toDF().agg(*aggsFuncs)
    )
    return DynamicFrame.fromDF(result, glueContext, transformation_ctx)


args = getResolvedOptions(sys.argv, ["JOB_NAME"])
sc = SparkContext()
glueContext = GlueContext(sc)
spark = glueContext.spark_session
job = Job(glueContext)
job.init(args["JOB_NAME"], args)

# Script generated for node S3 bucket
S3bucket_node1 = glueContext.create_dynamic_frame.from_options(
    format_options={"quoteChar": '"', "withHeader": True, "separator": ","},
    connection_type="s3",
    format="csv",
    connection_options={
        "paths": ["s3://d2b-mide-raw-layer/cyclistic_trip.csv"],
        "recurse": True,
    },
    transformation_ctx="S3bucket_node1",
)

# Script generated for node ApplyMapping
ApplyMapping_node2 = ApplyMapping.apply(
    frame=S3bucket_node1,
    mappings=[
        ("ride_id", "string", "ride_id", "int"),
        ("rideable_type", "string", "rideable_type", "string"),
        ("started_at", "string", "started_at", "string"),
        ("ended_at", "string", "ended_at", "string"),
        ("start_station_name", "string", "start_station_name", "string"),
        ("start_station_id", "string", "start_station_id", "string"),
    ],
    transformation_ctx="ApplyMapping_node2",
)

# Script generated for node Aggregate
Aggregate_node1683393370958 = sparkAggregate(
    glueContext,
    parentFrame=ApplyMapping_node2,
    groups=["rideable_type"],
    aggs=[["rideable_type", "count"]],
    transformation_ctx="Aggregate_node1683393370958",
)

# Script generated for node Amazon S3
AmazonS3_node1683393538501 = glueContext.write_dynamic_frame.from_options(
    frame=Aggregate_node1683393370958,
    connection_type="s3",
    format="json",
    connection_options={"path": "s3://d2b-mide-qualified-layer", "partitionKeys": []},
    transformation_ctx="AmazonS3_node1683393538501",
)

job.commit()
