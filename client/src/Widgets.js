import React from 'react'
import "./widgets.css";

import {
  TwitterTimeLineEmbed,
  TwitterShareButton,
  TwitterTweetEmbed,
 } from "react-twitter-embed";

 import SearchIcon from "@material-ui/icons/Search";

const Widgets = () => {
  return (
    <div className="widgets">
      <div className ="widgets_input">
        <SearchIcon className ="widgets_searchIcon"/>
        <input placeholder="Search Twitter" type="text"/>
      </div>
      <div className="widgets_widgetContainer">
        <h2> What's The Update !</h2>
        <TwitterTimeLineEmbed
        sourceType="profile"
        screenName="kmmtmm92"
        options={{height: 800}}
        />
    

      </div>
    </div>
  )
}

export default Widgets