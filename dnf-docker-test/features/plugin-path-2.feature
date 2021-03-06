Feature: DNF/Behave test (pluginspath and pluginsconfpath test)

Scenario: Redirect installroot pluginspath
  When I execute "dnf" command "--installroot=/dockertesting repoquery TestA" with "success"
  And I execute "dnf" command "--installroot=/dockertesting copr list rpmsoftwaremanagement" with "success"
  And I execute "dnf" command "--installroot=/dockertesting config-manager" with "success"
  When I copy plugin module "repoquery.py, copr.py" from default plugin path into "/test/plugins2"
  And I create a file "/dockertesting/etc/dnf/dnf.conf" with content: "[main]\npluginpath=/test/plugins2"
  Then I execute "dnf" command "--installroot=/dockertesting repoquery TestA" with "success"
  And I execute "dnf" command "--installroot=/dockertesting copr list rpmsoftwaremanagement" with "success"
  And I execute "dnf" command "--installroot=/dockertesting config-manager" with "fail"
  When I create a file "/etc/dnf/dnf.conf" with content: "[main]"
