init:
	cargo install leo-lang

nix_shell:
	nix-shell

ops:
	redis-server --daemonize yes

stop_ops:
	redis-cli shutdown

ops_docker:
	docker-compose up -d redis

stop:
	redis-cli shutdown

stop_docker:
	docker-compose down redis	
	
build:
	cargo build --release

run_server:
	HOST="localhost" REDIS_URL="redis://127.0.0.1:6379" cargo run --release -p aleo-maci-server

run_dashboard:
	PORT=4000 REACT_APP_MACI_HOST=http://127.0.0.1:3000 npm start --prefix dashboard

run_server_docker:
	docker-compose up server

test:
	cargo test

run_docker:
	docker compose up

build_images:
	docker compose build

format:
	cargo fmt --all

build_circuits:
	cd circuits/tally;leo build
	cd circuits/whitelist;leo build

run_tally_circuit:
	cd circuits/tally;leo run

run_whitelist_circuit:
	cd circuits/whitelist;leo run

clean_circuits:
	cd circuits/tally;leo clean

send_vote:
	cargo run --release --bin aleo-maci-cli vote-for 1

start_tally:
	curl -X POST http://127.0.0.1:3000/election/tally/start
