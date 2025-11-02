package coderabbit

import "strings"

#Config: {
	language?:          #Language
	tone_instructions?: string & strings.MaxRunes(255)
	early_access?:      bool
	enable_free_tier?:  bool
}
