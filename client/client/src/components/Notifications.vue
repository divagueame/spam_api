<template> 

    <div>
          <h1>Notifications</h1>
          <button @click="postSuccessfulNotification">Send successult</button>
          <button @click="postFailingNotification">Send failing</button>
          
    </div>
  
  </template>
  
  <script setup lang="ts">
import {ref } from 'vue'

const notifications = ref([])

const API_URL = "http://localhost:3000/api/v1/notifications"


const postSuccessfulNotification = async () => {
    const bodyObj = {
        "RecordType": "Bounce",
        "Type": "SpamNotification",
        "TypeCode": 512,
        "Name": "Spam notification",
        "Tag": "",
        "MessageStream": "outbound",
        "Description": "The message was delivered, but was either blocked by the user, or classified as spam, bulk mail, or had rejected content.",
        "Email": "zaphod@example.com",
        "From": "notifications@honeybadger.io",
        "BouncedAt": "2023-02-27T21:41:30Z",
        }

    const res = await fetch(API_URL, {
        method: 'POST',
        headers: {
            'Content-Type': 'application/json'
        },
        body: JSON.stringify(bodyObj)
    }) 

}

const postFailingNotification = async () => {
    const bodyObj = {
        "RecordType": "Bounce",
        "MessageStream": "outbound",
        "Type": "HardBounce",
        "TypeCode": 1,
        "Name": "Hard bounce",
        "Tag": "Test",
        "Description": "The server was unable to deliver your message (ex: unknown user, mailbox not found).",
        "Email": "arthur@example.com",
        "From": "notifications@honeybadger.io",
        "BouncedAt": "2019-11-05T16:33:54.9070259Z",
        }

    const res = await fetch(API_URL, {
        method: 'POST',
        headers: {
            'Content-Type': 'application/json'
        },
        body: JSON.stringify(bodyObj)
    }) 

}





</script>



<style scoped>
</style>
