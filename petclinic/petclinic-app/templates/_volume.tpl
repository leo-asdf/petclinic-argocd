{{- define "volume" }}
{{- range $k, $v := $.volumes }}
- name: {{ $k }}
  {{- toYaml $v | nindent 2}}
{{- end}}
{{- end }}