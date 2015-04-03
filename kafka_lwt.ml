open Kafka

external consume_job : topic -> partition -> int -> message Lwt_unix.job = "ocaml_kafka_consume_job"
let consume ?(timeout_ms = 1000) topic partition =
  Lwt_unix.run_job (consume_job topic partition timeout_ms)

external consume_queue_job : queue -> int -> message Lwt_unix.job = "ocaml_kafka_consume_queue_job"
let consume_queue ?(timeout_ms = 1000) queue =
  Lwt_unix.run_job (consume_queue_job queue timeout_ms)

external consume_batch_job : topic -> partition -> int -> int -> message list Lwt_unix.job = "ocaml_kafka_consume_batch_job"
let consume_batch ?(timeout_ms = 1000) ?(msg_count = 1024) topic partition =
  Lwt_unix.run_job (consume_batch_job topic partition timeout_ms msg_count)

external consume_batch_queue_job : queue -> int -> int -> message list Lwt_unix.job = "ocaml_kafka_consume_batch_queue_job"
let consume_batch_queue ?(timeout_ms = 1000) ?(msg_count = 1024) queue =
  Lwt_unix.run_job (consume_batch_queue_job queue timeout_ms msg_count)
