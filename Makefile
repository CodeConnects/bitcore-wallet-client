.PHONY: cover

BIN_PATH:=node_modules/.bin/

all:	bitcore-wallet-client.min.js

clean:
	rm -f bitcore-wallet-client.js
	rm -f bitcore-wallet-client.min.js
	rm -rf node_modules/

bitcore-wallet-client.js: index.js lib/*.js
	${BIN_PATH}browserify $< > $@

bitcore-wallet-client.min.js: bitcore-wallet-client.js
	${BIN_PATH}uglifyjs  $< -s -o $@

cover:
	./node_modules/.bin/istanbul cover ./node_modules/.bin/_mocha -- --reporter spec test
