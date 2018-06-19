package main

import (
	"fmt"
	"os"
	"os/exec"
	"strconv"
	"strings"
	"time"
)

var (
	command string
	delay   int
)

func main() {
	delay, _ = strconv.Atoi(os.Args[1])
	command = os.Args[2]
	fmt.Printf("Running %v every %v seconds\n", command, delay)
	Action()
}

func Action() {
	splitCommand := strings.Split(command, " ")
	out, err := exec.Command(splitCommand[0], splitCommand[1:]...).Output()
	if err != nil {
		panic(err)
	}
	fmt.Println("Command Output: ", string(out))
	duration := time.Duration(delay)
	time.Sleep(duration * time.Second)
	Action()
}
