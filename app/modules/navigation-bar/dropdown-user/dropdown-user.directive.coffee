###
# Copyright (C) 2014-2016 Taiga Agile LLC <taiga@taiga.io>
#
# This program is free software: you can redistribute it and/or modify
# it under the terms of the GNU Affero General Public License as
# published by the Free Software Foundation, either version 3 of the
# License, or (at your option) any later version.
#
# This program is distributed in the hope that it will be useful,
# but WITHOUT ANY WARRANTY; without even the implied warranty of
# MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE. See the
# GNU Affero General Public License for more details.
#
# You should have received a copy of the GNU Affero General Public License
# along with this program. If not, see <http://www.gnu.org/licenses/>.
#
# File: dropdown-user.directive.coffee
###

DropdownUserDirective = (authService, configService, locationService,
        navUrlsService, feedbackService) ->

    link = (scope, el, attrs, ctrl) ->
        scope.vm = {}
        scope.vm.isFeedbackEnabled = configService.get("feedbackEnabled")
        taiga.defineImmutableProperty(scope.vm, "user", () -> authService.userData)

        scope.vm.logout = ->
            authService.logout()
            locationService.path(navUrlsService.resolve("login"))

        scope.vm.sendFeedback = ->
            feedbackService.sendFeedback()

    directive = {
        templateUrl: "navigation-bar/dropdown-user/dropdown-user.html"
        scope: {}
        link: link
    }

    return directive

DropdownUserDirective.$inject = [
    "$tgAuth",
    "$tgConfig",
    "$tgLocation",
    "$tgNavUrls",
    "tgFeedbackService"
]

angular.module("taigaNavigationBar").directive("tgDropdownUser", DropdownUserDirective)
