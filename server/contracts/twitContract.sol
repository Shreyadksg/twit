// SPDX-License-Identifier: GPL-3.0
pragma solidity 0.8.19;

contract twitContract {

    event AddTweet(address recipient, uint tweetId);
    event DeleteTweet(uint tweetId, bool isDeleted);


    struct Tweet {
        uint id;
        address username;
        string tweetText;
        bool isDeleted;
    }

    //data strucure to privately store tweet IDs.
    Tweet[] private tweets;

    //Mapping of Tweet id to the wallet address of the user
    //helps to find out twitter IDs owned by respective person
    mapping(uint256 => address) tweetToOwner;

    //function to add a new tweet
    function addTweet(string memory tweetText, bool isDeleted) external {
        uint tweetId = tweets.length;
        tweets.push(Tweet(tweetId,msg.sender,tweetText,isDeleted));
        tweetToOwner[tweetId]=msg.sender;
        emit AddTweet(msg.sender, tweetId);
    }


    function getAllTweets() external view returns (Tweet[] memory){
        Tweet[] memory temporary = new Tweet[](tweets.length);

        uint count=0;
        for(uint i=0;i<tweets.length;i++){
            if(tweets[i].isDeleted==false){
                temporary[count]=tweets[i];
                count++;
            }
        }

        Tweet[] memory result=new Tweet[](count);
        for(uint i=0;i<count;i++){
            result[i]=temporary[i];
        }

        return result;
    }


    function getMyTweets() external view returns (Tweet[] memory){
        Tweet[] memory temporary = new Tweet[](tweets.length);

        uint counter=0;
        for(uint i=0;i<tweets.length;i++){
            if(tweetToOwner[i]==msg.sender && tweets[i].isDeleted==false){
                temporary[counter]=tweets[i];
                counter++;
            }
        }

        Tweet[] memory result=new Tweet[](counter);
        for(uint i=0;i<counter;i++){
            result[i]=temporary[i];
        }

        return result;
    }

    //To delete a Tweet
    function deleteTweet(uint tweetId,bool isDeleted) external {
        if(tweetToOwner[tweetId]==msg.sender){
            tweets[tweetId].isDeleted = isDeleted;
            emit DeleteTweet(tweetId,isDeleted);
        }
    }
}