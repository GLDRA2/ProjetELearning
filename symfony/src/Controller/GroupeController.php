<?php

namespace App\Controller;

use App\Entity\Cour;
use App\Entity\User;
use App\Entity\Groupe;
use App\Form\JoinType;
use App\Entity\Question;
use App\Form\AnswerType;
use App\Form\GroupeType;
use App\Repository\GroupeRepository;
use Symfony\Component\HttpFoundation\Request;
use Symfony\Component\HttpFoundation\Response;
use Symfony\Component\Routing\Annotation\Route;
use Symfony\Bundle\FrameworkBundle\Controller\AbstractController;

/**
 * @Route("/groupe")
 */
class GroupeController extends AbstractController
{

    /**
     * @Route("/", name="groupe_index", methods={"GET"})
     */
    public function index(GroupeRepository $groupeRepository): Response
    {
        return $this->render('groupe/index.html.twig', [
            'groupes' => $groupeRepository->findAll(),
        ]);
    }


    /**
     * @Route("/new", name="groupe_new", methods={"GET","POST"})
     */
    public function new(Request $request): Response
    {
        $groupe = new Groupe();
        $user = $this->getUser();
        $form = $this->createForm(GroupeType::class, $groupe);
        $form->handleRequest($request);

        if ($form->isSubmitted() && $form->isValid()) {
            $entityManager = $this->getDoctrine()->getManager();
            $groupe->addUser($user);
            $entityManager->persist($groupe);
            $entityManager->flush();

            return $this->redirectToRoute('groupe_index');
        }

        return $this->render('groupe/new.html.twig', [
            'groupe' => $groupe,
            'form' => $form->createView(),
        ]);
    }

    /**
     * @Route("/{id}", name="groupe_show", methods={"GET"})
     */
    public function show(Groupe $groupe): Response
    {
        return $this->render('groupe/show.html.twig', [
            'groupe' => $groupe,
        ]);
    }


    /**
     * @Route("/{id}/update", name="groupe_update", methods={"GET","POST"})
     */
    public function edit(Request $request, Groupe $groupe): Response
    {
        $user = $this->getUser();
        $form = $this->createForm(GroupeType::class, $groupe);
        $form->handleRequest($request);
      
      
        if ($form->isSubmitted() && $form->isValid()) {
            $this->getDoctrine()->getManager()->flush();
            
            return $this->redirectToRoute('groupe_show', [
            'id' => $groupe->getId(),
            ]);
        }

        return $this->render('groupe/update.html.twig', [
            'groupe' => $groupe,
            'form' => $form->createView(),
        ]);
    }


    /**
     * @Route("/{id}/edit", name="groupe_edit", methods={"GET","POST"})
     */
    public function join(Request $request, Groupe $groupe): Response
    {
        $user = $this->getUser();
        $form = $this->createForm(JoinType::class, $groupe);
        $form->handleRequest($request);
        $confirm = $groupe->getConfirm();
        $password = $groupe->getPassword();
      
        if ($form->isSubmitted() && $form->isValid() && $confirm == $password) {
            $groupe->addUser($user);
            $this->getDoctrine()->getManager()->flush();
            
            return $this->redirectToRoute('groupe_show', [
            'id' => $groupe->getId(),
            ]);
        }

        return $this->render('groupe/edit.html.twig', [
            'groupe' => $groupe,
            'form' => $form->createView(),
        ]);
    }
    
    /**
     * @Route("/{id}", name="groupe_delete", methods={"DELETE"})
     */
    public function delete(Request $request, Groupe $groupe): Response
    {
        if ($this->isCsrfTokenValid('delete'.$groupe->getId(), $request->request->get('_token'))) {
            $entityManager = $this->getDoctrine()->getManager();
            $entityManager->remove($groupe);
            $entityManager->flush();
        }

        return $this->redirectToRoute('groupe_index');
    }
}
