# SQL Query Performance Optimization Demo

A simple PHP web application to compared performance of original and optimized SQL queries.

## Running with Docker

1. Clone this repository
2. Run the application:
   ```bash
   docker-compose up -d
   ```
3. Access the web interface:
   ```
   http://localhost:8080
   ```

## Performance Improvements

The optimized query achieves better performance through:
- Utilizing MySQL's FULLTEXT search capabilities
- Reducing the number of rows processed early in the query
- Leveraging proper indexes for JOIN and WHERE conditions
- Minimizing the impact of wildcard searches

## Technical Details

- PHP 8.2 with PDO for database operations
- MySQL 8.0 with optimized configuration
- Bootstrap 5 for the frontend
