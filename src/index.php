<?php
require_once 'config.php';
require_once 'QueryRunner.php';

$queryRunner = new QueryRunner($pdo);
$results = null;

if (isset($_POST['query'])) {
    $results = $queryRunner->runComparison();
}
?>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>SQL Query Performance Comparison - キャビンアテンダント Search</title>
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/css/bootstrap.min.css" rel="stylesheet">
    <script src="https://cdn.jsdelivr.net/npm/chart.js"></script>
    <style>
        .query-container {
            font-family: monospace;
            background: #f8f9fa;
            padding: 15px;
            border-radius: 5px;
            margin-bottom: 20px;
            white-space: pre-wrap;
            max-height: 300px;
            overflow-y: auto;
        }
        .performance-metric {
            font-size: 24px;
            font-weight: bold;
        }
        .performance-improvement {
            font-size: 18px;
            color: #28a745;
        }
    </style>
</head>
<body>
    <div class="container mt-5">
        <h1 class="mb-4">SQL Query Performance</h1>
        
        
        <form method="POST" class="mb-4">
            <button type="submit" name="query" class="btn btn-primary btn-lg">Run Query</button>
        </form>

        <?php if ($results): ?>
        <div class="row">
            <div class="col-md-6">
                <div class="card">
                    <div class="card-header">
                        <h5>Original Query</h5>
                        <div class="performance-metric">
                            <?= $results['original']['time'] ?> ms
                        </div>
                    </div>
                    <div class="card-body">
                        <div class="query-container">
                            <!-- adding original query for preview  -->
                            <pre><code><?php echo htmlspecialchars(file_get_contents(__DIR__ . '/queries/original_query.sql')); ?></code></pre>
                        </div>
                       
                        <?php if (!$results['original']['success']): ?>
                            <div class="alert alert-danger"><?= htmlspecialchars($results['original']['error']) ?></div>
                        <?php endif; ?>
                    </div>
                </div>
            </div>
            
            <div class="col-md-6">
                <div class="card">
                    <div class="card-header">
                        <h5>Optimized Query</h5>
                        <div class="performance-metric">
                            <?= $results['optimized']['time'] ?> ms
                        </div>
                        <?php if ($results['original']['success'] && $results['optimized']['success']): ?>
                        <div class="performance-improvement">
                            <?php
                            $improvement = (($results['original']['time'] - $results['optimized']['time']) / $results['original']['time']) * 100;
                            echo round($improvement, 1) . '% faster';
                            ?>
                        </div>
                        <?php endif; ?>
                    </div>
                    <div class="card-body">
                        <div class="query-container">
                            <!-- adding optimized query for preview -->
                            <pre><code><?php echo htmlspecialchars(file_get_contents(__DIR__ . '/queries/optimized_query.sql')); ?></code></pre>
                        </div>
                        
                        <?php if (!$results['optimized']['success']): ?>
                            <div class="alert alert-danger"><?= htmlspecialchars($results['optimized']['error']) ?></div>
                        <?php endif; ?>
                    </div>
                </div>
            </div>
        </div>

        <?php if ($results['original']['success'] && $results['optimized']['success']): ?>
       
        <?php endif; ?>
        <?php endif; ?>
    </div>
</body>
</html>
