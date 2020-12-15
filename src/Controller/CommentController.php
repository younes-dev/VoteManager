<?php

namespace App\Controller;

use Exception;
use Psr\Log\LoggerInterface;
use Symfony\Bundle\FrameworkBundle\Controller\AbstractController;
use Symfony\Component\HttpFoundation\JsonResponse;
use Symfony\Component\HttpFoundation\Response;
use Symfony\Component\Routing\Annotation\Route;

class CommentController extends AbstractController
{
    /**
     * @Route("/comments/{id}/vote/{direction<up|down>}",methods={"POST"})
     * @param $id
     * @param $direction
     * @param LoggerInterface $logger
     * @return JsonResponse
     * @throws Exception
     */
    public function commentVote($id, $direction,LoggerInterface $logger): JsonResponse
    {
        // todo - use id to query the database
        $currentVoteCount=null;
        // use real logic here to save this to the database
        if ($direction === 'up') {
            $logger->info('voting up');
            $currentVoteCount = random_int(7, 100);
        }
        if ($direction === 'down') {
            $logger->info('voting down');
            $currentVoteCount = random_int(0, 5);
        }
        return $this->json(['votes' => $currentVoteCount]);
    }
}
