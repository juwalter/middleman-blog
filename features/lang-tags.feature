Feature: Internationalized tags

  Scenario: Default tags work
    Given the Server is running at "lang-tags-app"
    When I go to "/tags/sport.html"
    Then I should see "Tag: sport"
    When I go to "/tags/soccer.html"
    Then I should see "Tag: soccer"
    When I go to "/tags/спорт.html"
    Then I should see "Tag: спорт"
    When I go to "/tags/футбол.html"
    Then I should see "Tag: футбол"

  Scenario: Default tags with custom taglink work
    Given a fixture app "lang-tags-app"
    And a file named "config.rb" with:
      """
      activate :i18n

      activate :blog do |blog|
        blog.tag_template = "/tag.html"
         blog.taglink = "better-tags/{tag}.html"
      end
      """
    Given the Server is running at "lang-tags-app"
    When I go to "/tags/sport.html"
    Then I should see "File Not Found"
    When I go to "/better-tags/sport.html"
    Then I should see "Tag: sport"

  Scenario: taglink starts with {lang}
    Given a fixture app "lang-tags-app"
    And a file named "config.rb" with:
      """
      activate :i18n

      activate :blog do |blog|
        blog.tag_template = "/tag.html"
        blog.taglink = "{lang}/tags/{tag}.html"
      end
      """
    Given the Server is running at "lang-tags-app"
    When I go to "/tags/sport.html"
    Then I should see "File Not Found"
    When I go to "/tags/футбол.html"
    Then I should see "File Not Found"
    When I go to "/en/tags/sport.html"
    Then I should see "Tag: sport"
    And I should see "English article one"
    And I should see "English article two"
    When I go to "/en/tags/soccer.html"
    Then I should see "Tag: soccer"
    And I should see "English article one"
    And I should not see "English article two"
    When I go to "/ru/tags/спорт.html"
    Then I should see "Tag: спорт"
    When I go to "/ru/tags/футбол.html"
    Then I should see "Tag: футбол"

  Scenario: taglink includes {lang}
    Given a fixture app "lang-tags-app"
    And a file named "config.rb" with:
      """
      activate :i18n

      activate :blog do |blog|
        blog.tag_template = "/tag.html"
        blog.taglink = "something/{lang}/tags/{tag}.html"
      end
      """
    Given the Server is running at "lang-tags-app"
    When I go to "/something/tags/sport.html"
    Then I should see "File Not Found"
    When I go to "/something/tags/футбол.html"
    Then I should see "File Not Found"
    When I go to "/something/en/tags/sport.html"
    Then I should see "Hello, world!"
    And I should see "Tag: sport"
    And I should see "English article one"
    And I should see "English article two"
    When I go to "/something/en/tags/soccer.html"
    Then I should see "Hello, world!"
    And I should see "Tag: soccer"
    And I should see "English article one"
    And I should not see "English article two"
    When I go to "/something/ru/tags/спорт.html"
    Then I should see "Привет, мир!"
    And I should see "Tag: спорт"
    When I go to "/something/ru/tags/футбол.html"
    Then I should see "Привет, мир!"
    And I should see "Tag: футбол"
