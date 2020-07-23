package admin

import (
	"fmt"
	"html/template"
	"net/http"
	"time"

	"github.com/gobuffalo/packr"
	log "github.com/sirupsen/logrus"
)

// render renders template with data and send it to writer
func render(w http.ResponseWriter, t *template.Template, templateName string, data interface{}, l *log.Logger) {
	if err := t.ExecuteTemplate(w, templateName, data); err != nil {
		if _, err := w.Write([]byte(err.Error())); err != nil {
			l.Error(err)
		}
	}
}

// getTemplate returns template
//   for local environment - from local files
//   for staging and production - from binary, where packr builds them to
func getTemplate(name string) (*template.Template, error) {
	box := packr.NewBox("./templates")

	t := template.New(name)

	t = t.Funcs(template.FuncMap{
		"formatTime": formatTime,
		"attr": func(s string) template.HTMLAttr {
			return template.HTMLAttr(s)
		},
	})

	t, err := parseTemplate(t, box, "header.html")
	if err != nil {
		return nil, err
	}

	t, err = parseTemplate(t, box, fmt.Sprintf("%s.html", name))
	if err != nil {
		return nil, err
	}

	t, err = parseTemplate(t, box, "footer.html")
	if err != nil {
		return nil, err
	}

	return t, nil
}

func parseTemplate(t *template.Template, box packr.Box, name string) (*template.Template, error) {
	templ, err := box.FindString(name)
	if err != nil {
		return nil, err
	}

	return t.Parse(templ)
}

// formatTime returns formatted time
func formatTime(v *time.Time) string {
	return v.UTC().Format("02.01.2006 15:04:05")
}
