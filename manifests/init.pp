class java {
  $jre_url = 'https://pathable-deploy.s3.amazonaws.com/jre-7u17-macosx-x64.dmg'
  $jdk_url = 'https://pathable-deploy.s3.amazonaws.com/jdk-7u17-macosx-x64.dmg'
  $wrapper = "${boxen::config::bindir}/java"

  package {
    'jre-7u17.dmg':
      ensure   => present,
      alias    => 'java-jre',
      provider => pkgdmg,
      source   => $jre_url ;
    'jdk-7u17.dmg':
      ensure   => present,
      alias    => 'java',
      provider => pkgdmg,
      source   => $jdk_url ;
  }

  file { $wrapper:
    source  => 'puppet:///modules/java/java.sh',
    mode    => 0755,
    require => Package['java']
  }
}
