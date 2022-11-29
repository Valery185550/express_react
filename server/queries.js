const Pool = require('pg').Pool;
const pool = new Pool({
    user:"postgres",
    host:"localhost",
    database:"users",
    password:"",
    port:5432
})

const getUsers=(req, res)=>{
    pool.query(`SELECT s_bers.id AS subscriber_id, s_bers.first_name AS subscriber_first_name, s_bers.gender AS subscriber_gender, 
                s_ptions.id AS subscription_id, s_ptions.first_name AS subscription_first_name, s_ptions.gender AS subscription_gender FROM bonds as b 
                LEFT JOIN subscribers AS s_bers ON b.subscriber_id = s_bers.id
                LEFT JOIN subscriptions AS s_ptions ON b.subscription_id = s_ptions.id
                ORDER BY s_bers.id ASC`,(error, results)=>{
        if(error){
            console.log(error.stack)
        }
        else{
            console.log(results.rows);
            res.json(results.rows);
        }
        
    })
}

const getUser = (req, res)=>{
    let userId = req.params['id'];
    let orderBy = req.query.order_by;
    let orderType = req.query.order_type;
    pool.query(`SELECT s_bers.id AS subscriber_id, s_bers.first_name AS subscriber_first_name, s_bers.gender AS subscriber_gender, 
    s_ptions.id AS subscription_id, s_ptions.first_name AS subscription_first_name, s_ptions.gender AS subscription_gender FROM bonds as b 
    LEFT JOIN subscribers AS s_bers ON b.subscriber_id = s_bers.id
    LEFT JOIN subscriptions AS s_ptions ON b.subscription_id = s_ptions.id
    WHERE s_bers.id=${userId} AND s_ptions.id IN (SELECT subscriber_id from bonds WHERE subscription_id = ${userId})
    ORDER BY s_ptions.${orderBy} ${orderType}`, (error, result)=>{
        if(error){
            console.log(error.stack)
        }
        else{
            console.log(result.rows);
            res.json(result.rows);
        }
    })
}

const getMaxSubscriptions = (req, res)=>{
    pool.query(`SELECT s.id, s.first_name, s.gender, COUNT(b.subscription_id) as subscriptions from subscribers AS s 
    INNER JOIN bonds AS b on b.subscriber_id = s.id 
    GROUP BY s.id
    ORDER BY subscriptions DESC 
    LIMIT 5`, (error, result)=>{
        if(error){
            console.log(error.stack)
        }
        else{
            console.log(result.rows);
            res.json(result.rows);
        }
    })
}

const getZeroSubscription = (req, res)=>{
    pool.query(`SELECT s.id, s.first_name, s.gender, b.subscription_id as subscriptions from subscribers AS s 
    LEFT JOIN bonds AS b on s.id = b.subscriber_id 
    WHERE b.subscription_id IS NULL`, (error, result)=>{
        if(error){
            console.log(error.stack)
        }
        else{
            console.log(result.rows);
            res.json(result.rows);
        }
    })
}

module.exports={
    getUsers,
    getUser,
    getMaxSubscriptions,
    getZeroSubscription

}

const q2 = `SELECT b.subscriber_id as subscriber, a.subscriber_id as friends from bonds a, bonds b
WHERE a.id <> b.id AND a.subscriber_id = b.subscription_id AND b.subscriber_id = a.subscription_id`;