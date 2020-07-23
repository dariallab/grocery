package web

import (
	"encoding/json"
	"net/http"

	"github.com/dariallab/grocery/pkg/platform/errors"
)

// successResponse represents success response structure
type successResponse struct {
	Data Data `json:"data"`
}

// errorResponse represents error response structure
type errorResponse struct {
	Errors []string    `json:"errors"`
	Meta   interface{} `json:"meta"`
}

// Data represents data from jsonAPI
type Data struct {
	Attributes interface{} `json:"attributes"`
}

// WriteSuccessResponse writes successful response
func WriteSuccessResponse(w http.ResponseWriter, code int, data interface{}, typeInfo string) {
	payload := &successResponse{
		Data: Data{
			Attributes: data,
		},
	}
	writeJSON(w, code, payload)
}

// WriteErrorResponse writes error response
func WriteErrorResponse(w http.ResponseWriter, errs ...error) {
	var code int
	var errorsList []string
	for _, v := range errs {
		if v != nil {
			if e, ok := v.(*errors.Error); ok {
				switch e.Code {
				case errors.EINTERNAL:
					code = http.StatusInternalServerError
				case errors.ENOTFOUND:
					code = http.StatusNotFound
				case errors.EINVALID:
					code = http.StatusBadRequest
				case errors.EUNAUTHORIZED:
					code = http.StatusUnauthorized
				}
			}
		}
		errorsList = append(errorsList, errors.Message(v))
	}

	if code == 0 {
		code = http.StatusInternalServerError
	}

	payload := &errorResponse{
		Errors: errorsList,
	}

	writeJSON(w, code, payload)
}

// writeJSON writes json data to response
func writeJSON(w http.ResponseWriter, code int, data interface{}) {
	w.Header().Set("Content-Type", "application/json; charset=utf-8")
	w.WriteHeader(code)

	if data == nil || code == http.StatusNoContent {
		return
	}

	enc := json.NewEncoder(w)
	enc.SetEscapeHTML(true)
	if err := enc.Encode(data); err != nil {
		http.Error(w, "cannot encode data", http.StatusInternalServerError)
	}
}
