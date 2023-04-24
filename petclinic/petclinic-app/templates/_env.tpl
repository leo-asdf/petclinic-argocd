{{- define "env" }}
{{- range $k, $v := $.env }}
- name: {{ $k | quote }}
  value: {{ $v | quote }}
{{- end}}
{{- end }}