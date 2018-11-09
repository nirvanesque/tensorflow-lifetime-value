-- Copyright 2018 Google Inc. All Rights Reserved.
--
-- Licensed under the Apache License, Version 2.0 (the "License");
-- you may not use this file except in compliance with the License.
-- You may obtain a copy of the License at
--
--     http://www.apache.org/licenses/LICENSE-2.0
--
-- Unless required by applicable law or agreed to in writing, software
-- distributed under the License is distributed on an "AS IS" BASIS,
-- WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
-- See the License for the specific language governing permissions and
-- limitations under the License.

SELECT
  *
FROM
  `{{ dag_run.conf['project'] }}.{{ dag_run.conf['dataset'] }}.features_n_target`
WHERE
  -- TRAIN
  MOD(ABS(FARM_FINGERPRINT(CAST(customer_id AS STRING))), 100000) > 70000 AND
  MOD(ABS(FARM_FINGERPRINT(CAST(customer_id AS STRING))), 100000) < 85000
