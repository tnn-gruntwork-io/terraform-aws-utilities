variable "executable" {
  type        = string
  description = "The executable to look for on the system PATH and in var.install_dir. If not found, this executable will be downloaded from var.download_url."
  default     = "kubergrunt"
}

variable "download_url" {
  type        = string
  description = "The URL to download the executable from if var.executable is not found on the system PATH or in var.install_dir."
  default     = "https://github.com/tnn-gruntwork-io/kubergrunt/releases/download/v0.5.12/kubergrunt"
}

variable "executable_args" {
  type        = string
  description = "The CLI args to pass when running the executable."
  default     = "--version"
}

variable "append_os_arch" {
  type        = bool
  description = "If set to true, append the operating system and architecture to the URL. E.g., Append linux_amd64 if this code is being run on a 64 bit Linux OS."
  default     = true
}

variable "enabled" {
  description = "Set to false to have disable this module, so it does not try to download the executable, and always returns its path unchanged. This weird parameter exists solely because Terraform does not support conditional modules. Therefore, this is a hack to allow you to conditionally decide if this module should run or not."
  type        = bool
  default     = true
}
