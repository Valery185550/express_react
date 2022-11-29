import './App.css';
import {useState, useEffect} from "react";
import axios from 'axios';

function App() {

  const [allUsers, setAllUsers] = useState(null);
  const [friends, setFriends] = useState(null);
  const [maxSubscriptions, setMaxSubscriptions] = useState(null);
  const [zeroSubscriptions, setZeroSubscriptions] = useState(null);

  useEffect(()=>{
    async function fetchData(){
      let users = await axios("http://localhost:3010/users");
      setAllUsers(users.data);

      let friends = await axios("http://localhost:3010/users/123/friends?order_by=id&order_type=desc");
      setFriends(friends.data);

      let maxSubscriptions = await axios ("http://localhost:3010/max-following");
      setMaxSubscriptions(maxSubscriptions.data);

      let zeroSubscriptions = await axios ("http://localhost:3010/not-following");
      setZeroSubscriptions(zeroSubscriptions.data);
      
    }
    fetchData();
  },[])


  return (
    <div className="App">
      <h2>ALL USERS</h2>
      <table>
        <thead>
          <tr><th>subscriber_id</th><th>subscriber_first_name</th><th>subscriber_gender</th><th>subscription_id</th><th>subscription_first_name</th><th>subscription_gender</th></tr>
        </thead>
        <tbody>
          {allUsers && allUsers.map(obj=><tr key={obj.subscriber_id+Math.random()}><td>{obj.subscriber_id}</td><td>{obj.subscriber_first_name}</td>
            <td>{obj.subscriber_gender}</td><td>{obj.subscription_id}</td><td>{obj.subscription_first_name}</td><td>{obj.subscription_gender}</td></tr>)
          }
        </tbody>
      </table>

      <h2>USER's 123 FRIENDS</h2>
      <table>
          <thead>
            <tr><th>subscriber_id</th><th>subscriber_first_name</th><th>subscriber_gender</th><th>subscription_id</th><th>subscription_first_name</th><th>subscription_gender</th></tr>
          </thead>
          <tbody>
            {
              friends && friends.map(obj=><tr key={obj.subscriber_id+Math.random()}><td>{obj.subscriber_id}</td><td>{obj.subscriber_first_name}</td>
              <td>{obj.subscriber_gender}</td><td>{obj.subscription_id}</td><td>{obj.subscription_first_name}</td><td>{obj.subscription_gender}</td></tr>)
            }
          </tbody>
      </table>

      <h2>Max-following</h2>
      <table>
        <thead>
          <tr><th>id</th><th>first_name</th><th>gender</th><th>subscriptions</th></tr>
        </thead>
        <tbody>
          {
            maxSubscriptions && maxSubscriptions.map(obj=><tr key={obj.id}><td>{obj.id}</td><td>{obj.first_name}</td><td>{obj.gender}</td>
            <td>{obj.subscriptions}</td>
            </tr>)
          }
        </tbody>
      </table>

      <h2>Not-following</h2>
      <table>
        <thead>
          <tr><th>id</th><th>first_name</th><th>gender</th></tr>
        </thead>
        <tbody>
          {
            zeroSubscriptions && zeroSubscriptions.map(obj=><tr key={obj.id}><td>{obj.id}</td><td>{obj.first_name}</td><td>{obj.gender}</td></tr>)
          }
        </tbody>
      </table>
    </div>
  );
}

export default App;
