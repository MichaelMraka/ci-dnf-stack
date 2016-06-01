Feature: Obsoleting packages one-to-one

Scenario: Updating should replace one package with another
 Given I use the repository "test-1"
 When I execute "dnf" command "-y install TestObsoletes" with "success"
 Then transaction changes are as follows
   | State     | Packages      |
   | installed | TestObsoletes |
 Given I use the repository "upgrade_1"
 When I execute "dnf" command "-y update" with "success"
 Then transaction changes are as follows
   | State     | Packages         |
   | installed | TestObsoletes-ng |
   | removed   | TestObsoletes    |
