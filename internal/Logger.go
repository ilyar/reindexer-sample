package internal

import (
	"fmt"

	"github.com/restream/reindexer"
)

type Logger struct {
}

func (l *Logger) Printf(level int, format string, msg ...interface{}) {
	if level <= reindexer.TRACE {
		fmt.Println(fmt.Sprintf(format, msg...))
	}
}
