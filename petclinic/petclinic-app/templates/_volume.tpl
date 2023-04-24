{{- define "volume" }}
{{- range $k, $v := $.Values.volumes }}
- name: {{ $k }}
  {{- toYaml $v | nindent 2}}
{{- end}}
{{- end }}