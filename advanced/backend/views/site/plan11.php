<?php

use \backend\models\Plan11;

$plan11 = Plan11::find()->all();

foreach ($plan11 as $plan): ?>

    <?= $plan['username']?>
    <?= $plan['status_oplaty']?>
    <?= $plan['referal']?>
    <?= $plan['pay']?>
<?php endforeach;
