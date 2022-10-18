import { Component } from '@angular/core';

@Component({
  selector: 'navbar-main',
  templateUrl: './navbar.component.html',
  styleUrls: ['./navbar.component.css']
})
export class NavBarComponent {
  menuitems = [
    {"name": "Products", "href": "#",  "active" : false},
    {"name": "Case Studies", "href": "#",  "active" : false},
    {"name": "Our Work", "href": "#",  "active" : false},
    {"name": "About", "href": "#",  "active" : false},
    {"name": "Get Started", "href": "#", "active" : true}
  ];
  articleitems = [

  ];
}
