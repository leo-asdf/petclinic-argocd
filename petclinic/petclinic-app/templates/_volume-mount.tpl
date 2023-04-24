{{- define "volumeMount" }}
{{- range $k, $v := $.Values.volumeMounts }}
- name: {{ $k }}
  {{- toYaml $v | nindent 2}}
{{- end}}
{{- end }}