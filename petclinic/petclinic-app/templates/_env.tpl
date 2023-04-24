{{- define "env" }}
{{- range $k1, $v1 := $.env }}
- name: {{ $k1 | quote }}
  value: {{ $v1 | quote }}
{{- end }}