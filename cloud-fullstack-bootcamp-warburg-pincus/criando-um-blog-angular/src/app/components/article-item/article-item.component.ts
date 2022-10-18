import { Component } from '@angular/core';

@Component({
  selector: 'article-item',
  templateUrl: './article-item.component.html',
  styleUrls: ['./article-item.component.css']
})
export class ArticleItemComponent {
  featured_image = 'https://www.tinkeringmonkey.com/wp-content/uploads/bfi_thumb/milkbomb-process-9-oh8942nnseq45jjom08ka6fvp6njxfdoccwfp2q4eo-oh8dljdlrvrai50drstglfmd7yte5odrvj73g7bjkg.jpg';
  title = 'Making a Bomb Sign for a Bomb Business';
  views = 2;
  content = 'See how we made an Instagram-friendly sign for a small business dropping ice cream-stuffed doughnuts at a new location.';
}
