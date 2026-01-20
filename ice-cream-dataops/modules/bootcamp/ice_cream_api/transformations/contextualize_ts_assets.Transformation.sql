/* We aren't going to schedule this transformation. The reason why will become clear when you get to (see) the Data Orchestration module. */
select
  timeseries.externalId,
  array(node_reference("icapi_dm_space", assets.externalId)) as assets,
  timeseries.isStep,
  timeseries.type,
  timeseries.space
from
  cdf_data_models("cdf_cdm", "CogniteCore", "v1", "CogniteTimeSeries") as timeseries
left join
  cdf_data_models("cdf_cdm", "CogniteCore", "v1", "CogniteAsset") as assets
ON
  split_part(timeseries.externalId, ":", 1) = assets.externalId