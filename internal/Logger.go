package internal

import (
	"log"

	"github.com/restream/reindexer"
)

type Logger struct {
}

func (l *Logger) Printf(level int, format string, msg ...interface{}) {
	if level <= reindexer.TRACE {
		log.Printf(format, msg...)
	}
}
