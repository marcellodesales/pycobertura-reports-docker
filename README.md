# docker-pycobertura

Pycobertura to process coverage.xml files and display text reports... 

# coverage.xml

* Generate test coverage with your language

## From Golang

```Makefile
	@mkdir -p $(GOBASE)/build
	go test -short ./... -coverprofile=$(GOBASE)/build/coverage.out
	go tool cover -html=$(GOBASE)/build/coverage.out -o=$(GOBASE)/build/coverage.html
	go get github.com/t-yuki/gocover-cobertura
	gocover-cobertura < $(PWD)/build/coverage.out > $(PWD)/build/coverage.xml
```

## From Java

* Use Gradle or Maven to generate the reports during tests

```console
./gradlew test cobertura
ls -la build/reports/cobertura/coverage.xml
```

# pycobertura reports

* Shows the report for a given coverage

```console
$ docker run -v $(pwd)/build:/build -w=/build marcellodesales/pycobertura show coverage.xml
Filename                                                     Stmts    Miss  Cover    Missing
---------------------------------------------------------  -------  ------  -------  ----------------
platform/miner/miner.go                                       22       6    72.73%   78-80, 82-84
platform/miner/dependency_graph.go                            48       3    93.75%   53-55
platform/admin/api.go                                         36      36    0.00%    11-55
platform/admin/http.go                                        32      32    0.00%    14-55
TOTAL                                                         2438    1684  29.13%
```
