# SQL Query Performance Optimization Demo

This project demonstrates significant performance improvements for the given SQL query through various optimization techniques. The implementation includes a user-friendly web interface to compare the performance of the original and optimized queries.

## Key Optimizations

1. **FULLTEXT Indexes**
   - Replaced multiple `LIKE '%keyword%'` patterns with `MATCH AGAINST` for better performance
   - Added FULLTEXT indexes on searchable text columns

2. **Improved JOIN Strategy**
   - Restructured JOINs to reduce the result set early
   - Used subqueries for matching related entities
   - Optimized JOIN order placing filtering joins first

3. **Index Optimizations**
   - Added composite indexes for frequently used conditions
   - Created indexes for foreign keys and commonly filtered columns

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
- Chart.js for performance visualization

## Testing

The web interface allows you to:
1. Enter any search keyword (e.g., キャビンアテンダント)
2. View execution times for both queries
3. Compare results and performance metrics
4. Visualize the performance difference

## Database Schema Optimizations

The `init/schema.sql` file includes:
- Optimized table structures
- FULLTEXT indexes for text searches
- Strategic indexes for JOIN operations
- Proper character set and collation settings
