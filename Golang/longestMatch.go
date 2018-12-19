package main

import (
	"fmt"
)

type Position struct {
	p int
	consecutive int
}

// 比较当前字符的所有位置和前一字符的所有位置，查找是否有相邻的，如果有则那个位置的连续值较前一个的加1
// 返回最长的连续值所处的位置
func isNextTo(prev, curr []*Position, longest *Position) *Position {
	for _, p := range curr {
		for _, q := range prev {
			if (q.p + 1) == p.p {
				p.consecutive = q.consecutive + 1
				if longest == nil || p.consecutive > longest.consecutive {
					longest = p
				}
			}
		}
	}
	return longest
}

// 找出s1和s2中最长的相同字符串，如果有多个则返回第一个
func stringSimilarity(s1, s2 string) string {
	// to lower case and decomposite
	m2 := make(map[rune][]*Position)
	for i, r := range s2 {
		if 'A' <= r && r <= 'Z' {
			r += 'a' - 'A'
		}

		m2[r] = append(m2[r], &Position{i, 0})
	}

	var prevPos []*Position
	var longest *Position
	for _, r := range s1 {
		if 'A' <= r && r <= 'Z' {
			r += 'a' - 'A'
		}
		if currPos, ok := m2[r]; ok {
			if prevPos == nil {
				prevPos = currPos
			} else {
				longest = isNextTo(prevPos, currPos, longest)
				prevPos = currPos
			}
		}
	}

	return string(s2[longest.p - longest.consecutive : longest.p + 1])
}

func main() {
	// s1 := "eeeadeftth"
	// s2 := "abdefbb"
	s1 := "120"
	s2 := "2012"
	// s1 := "ekholilofooba-r-world"
	// s2 := "gpHOLYHIGHFOOBA-R"
	fmt.Printf("longest match: %v\n", stringSimilarity(s1, s2))
}
