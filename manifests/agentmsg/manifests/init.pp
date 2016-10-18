class agentmsg {
  $timestamp = generate('/bin/date')
  notify { "Agent run starting at ${timestamp}": }
}
