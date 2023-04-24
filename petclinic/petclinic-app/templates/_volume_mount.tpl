{{- define "volume_mount" }}
{{- range $k, $v := $.volumeMounts }}
- name: {{ $k }}
  {{- toYaml $v | nindent 2}}
{{- end}}
{{- end }}