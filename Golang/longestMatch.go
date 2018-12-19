package main

import (
	"strings"
	"fmt"
)

func isNextTo(prev, curr []int) bool {
	for _, p := range curr {
		for _, q := range prev {
			if (q + 1) == p {
				return true
			}
		}
	}
	return false
}

// 找出s1和s2中最长的相同的字符串，如果有多个则返回第一个
func stringSimilarity(s1, s2 string) string {
	s1 = strings.ToLower(s1)

	// to lower case and decomposite
	m2 := make(map[rune][]int)
	lowers2 := make([]rune, len(s2))
	for i, r := range s2 {
		if 'A' <= r && r <= 'Z' {
			r += 'a' - 'A'
		}
		lowers2[i] = r
		m2[r] = append(m2[r], i)
	}
	fmt.Printf("m2: %+v\n", m2)
	s2 = string(lowers2)

	var charArr, longest []rune
	var prevPos []int
	for _, r := range s1 {
		if currPos, ok := m2[r]; ok {
			if prevPos == nil {
				prevPos = currPos
				charArr = append(charArr, r)
			} else {
				// s1中相邻但s2中没有相邻的，则认为断开了，从此处重新开始查找
				if !isNextTo(prevPos, currPos) {
					if len(charArr) > len(longest) {
						longest = charArr
					}
					charArr = nil
				}
				charArr = append(charArr, r)
				prevPos = currPos
			}
		} else {
			// 如果s1中的一个字符在s2中没有，则认为断开了，从此处重新开始查找
			if len(charArr) > len(longest) {
				longest = charArr
			}
			charArr = nil
		}
	}

	if len(charArr) > len(longest) {
		longest = charArr
	}

	return string(longest)
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
