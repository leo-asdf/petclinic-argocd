{{- define "volume_mount" }}
{{- range $k, $v := $.Values.volumeMounts }}
- name: {{ $k }}
  {{- toYaml $v | nindent 2}}
{{- end}}
{{- end }}