# Crypto Insights Chatbot

A natural language chatbot that answers real-time cryptocurrency-related queries — from price trends to advanced analytics — powered by Google BigQuery, dbt, OpenAI, and orchestrated using n8n.

## Project Overview

This project builds a 
full-stack data pipeline that fetches real-time crypto data, transforms it for analysis, and enables a user-friendly interface to query insights via a natural language chatbot.

## Key capabilities:

Responds to queries like "What’s the price of Bitcoin?", "Which coins gained the most today?", and "Show volume trends for Ethereum"

Integrates real-time data from the CoinGecko API

Uses dbt for scalable data modeling and SQL-based transformations

Hosted on BigQuery with OpenAI integration for the chatbot interface


## Component Tech Stack

**Workflow Orchestration:**	n8n

<img width="904" height="241" alt="image" src="https://github.com/user-attachments/assets/5059f3b8-0549-47c6-8428-685c0fbd0031" />

**Data Storage & Querying:**	Google BigQuery

**Data Transformation:** dbt  (The SQL models are stored in the models folder)

**LLM Chat Interface:**	OpenAI API 

**Data Source:**	CoinGecko API

