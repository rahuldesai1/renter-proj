# README

# Title: Rails Decal Project!!

**Team Members:**   Rahul Desai, Anjali Kantharuban, Kelvin Zhang, Sophia Ding, Carolyn Wang

**Demo Link (optional)**: https://stormy-savannah-37932.herokuapp.com/

**Prompt:** Come up with your own prompt!

## **Abstract**

Our app is an e-commerce website that faciltates the renting of products between users. Similar to any other ecommerce site, our app allows users to create an account, post products to sell to others, and rent products that other users have posted. Everytime a user rents a product, their total balance decreases and the product is stamped with a return date that is specified by the renter. When a user logs into their profile, they are able to view all the products that they have currently put up for sale, whether or not those products have been purchased, and all of the products they have currently purchased. We have also included functionality for users to write reviews for products once they have returned it to the original owner. 

## **Models:**

**User**

- has name, email, and many products, many transactions, and many reviews

**Product**

- has title, description, owner, status, many reviews, price 

**Transaction**

- has seller, renter, duration, status, product

**Review**

- has rating, comment, user, product

## **Features:**

- Sellers can post items for sale
- Buyers can purchase items from sellers and return them after a certain time period
- Buyers can write reviews for products

## **Ambition Features:**

- Deployed to Heroku
- Use Devise 
- Styling 

## **Division of Labor:**

This is a general outline of how the work has split up; however, our tasks tended to overlap. 

- Devise, database management, Heroku: Rahul 
- Profile Page, CSS: Anjali
- Home, display images, video presentation: Sophia 
- Product Description, Transactions: Carolyn
- Add a Product, Write a Review: Kelvin

