{{- define "probe" }}
{{- $probe := get .Values .Values.probeType -}}

{{- with $probe }}
{{ toYaml . }}
{{- end }}

{{- end }}