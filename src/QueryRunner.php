<?php
class QueryRunner {
    private $pdo;
    private $originalQuery;
    private $optimizedQuery;

    public function __construct($pdo) {
        $this->pdo = $pdo;
        $this->initializeQueries();
    }

    private function initializeQueries() {
        $this->originalQuery = file_get_contents(__DIR__ . '/queries/original_query.sql');
        $this->optimizedQuery = file_get_contents(__DIR__ . '/queries/optimized_query.sql');
    }

    public function runComparison() {
        return [
            'original' => $this->executeQuery($this->originalQuery),
            'optimized' => $this->executeQuery($this->optimizedQuery)
        ];
    }

    private function executeQuery($query) {
        $start = microtime(true);
        
        try {
            $stmt = $this->pdo->query($query);
            $data = $stmt->fetchAll();
            $executionTime = (microtime(true) - $start) * 1000; // Convert to milliseconds
            
            return [
                'time' => round($executionTime, 2),
                'data' => $data,
                'success' => true,
                'count' => count($data)
            ];
        } catch (PDOException $e) {
            return [
                'time' => 0,
                'data' => [],
                'success' => false,
                'error' => $e->getMessage(),
                'count' => 0
            ];
        }
    }
}
