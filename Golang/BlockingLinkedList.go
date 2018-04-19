package BlockingLinkedList

import (
	"container/list"
	"sync"
)

type BlockingLinkedList struct {
	c    chan bool
	l    *list.List
	lock sync.Mutex
}

func (b *BlockingLinkedList) put(v interface{}) {
	b.lock.Lock()
	b.l.PushBack(v)
	b.lock.Unlock()

	select {
		case <- b.c:
		default:
	}
}

func (b *BlockingLinkedList) take() (v interface{}) {
	b.lock.Lock()
	empty := (b.l.Len() == 0)
	b.lock.Unlock()

	if empty {
		select {
			case b.c <- true:
		}
	}

	b.lock.Lock()
	e := b.l.Front()
	b.l.Remove(e)
	b.lock.Unlock()
	return e.Value
}

