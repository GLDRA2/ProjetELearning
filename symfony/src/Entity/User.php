<?php

namespace App\Entity;

use Symfony\Component\Validator\Constraints as Assert;
use Doctrine\ORM\Mapping as ORM;
use App\Repository\UserRepository;
use Doctrine\Common\Collections\Collection;
use Doctrine\Common\Collections\ArrayCollection;
use Symfony\Component\Security\Core\User\UserInterface;

/**
 * @ORM\Entity(repositoryClass=UserRepository::class)
 */
class User implements UserInterface
{
    /**
     * @ORM\Id
     * @ORM\GeneratedValue
     * @ORM\Column(type="integer")
     */
    private $id;

    /**
     * @ORM\Column(type="string", length=180, unique=true)
     */
    private $email;

    /**
     * @ORM\Column(type="json")
     */
    private $roles = [];

    /**
     * @var string The hashed password
     * @ORM\Column(type="string")
     * @Assert\Length(min="8", minMessage="You need larger password more than 8 charater!")
     * @Assert\EqualTo(propertyPath="confirm_password", message="You need to Enter the same password!")
     */
    private $password;

    /**
     * @Assert\EqualTo(propertyPath="confirm_password", message="You need to Enter the same password!"))
     */
    public $confirm_password;

    /**
     * @ORM\OneToMany(targetEntity=Activity::class, mappedBy="user", orphanRemoval=true)
     */
    private $activity;

    /**
     * @ORM\OneToMany(targetEntity=Cour::class, mappedBy="user", orphanRemoval=true)
     */
    private $cour;

    /**
     * @ORM\OneToMany(targetEntity=Upload::class, mappedBy="user", orphanRemoval=true)
     */
    private $upload;

    /**
     * @ORM\OneToMany(targetEntity=Depot::class, mappedBy="user", orphanRemoval=true)
     */
    private $depot;

    /**
     * @ORM\ManyToMany(targetEntity=Groupe::class, inversedBy="users")
     */
    private $groupe;

    /**
     * @ORM\Column(type="string", length=255, unique=true)
     */
    private $username;

    /**
     * @ORM\ManyToMany(targetEntity=Question::class, mappedBy="users")
     */
    private $questions;

    /**
     * @ORM\OneToMany(targetEntity=Archive::class, mappedBy="user", orphanRemoval=true)
     */
    private $archives;

    /**
     * @ORM\OneToMany(targetEntity=Message::class, mappedBy="user", orphanRemoval=true)
     */
    private $messages;

    public function __construct()
    {
        $this->activity = new ArrayCollection();
        $this->cour = new ArrayCollection();
        $this->upload = new ArrayCollection();
        $this->depot = new ArrayCollection();
        $this->groupe = new ArrayCollection();
        $this->questions = new ArrayCollection();
        $this->archives = new ArrayCollection();
        $this->messages = new ArrayCollection();
    }

    public function getId(): ?int
    {
        return $this->id;
    }

    public function getEmail(): ?string
    {
        return $this->email;
    }

    public function setEmail(string $email): self
    {
        $this->email = $email;

        return $this;
    }

    /**
     * A visual identifier that represents this user.
     *
     * @see UserInterface
     */
    public function getUsername(): string
    {
        return (string) $this->username;
    }

    /**
     * @see UserInterface
     */
    public function getRoles(): array
    {
        $roles = $this->roles;
        // guarantee every user at least has ROLE_USER
        $roles[] = 'ROLE_USER';

        return array_unique($roles);
    }

    public function setRoles(array $roles): self
    {
        $this->roles = $roles;

        return $this;
    }

    /**
     * @see UserInterface
     */
    public function getPassword(): string
    {
        return (string) $this->password;
    }

    public function setPassword(string $password): self
    {
        $this->password = $password;

        return $this;
    }

    /**
     * @see UserInterface
     */
    public function getSalt()
    {
        // not needed when using the "bcrypt" algorithm in security.yaml
    }

    /**
     * @see UserInterface
     */
    public function eraseCredentials()
    {
        // If you store any temporary, sensitive data on the user, clear it here
        // $this->plainPassword = null;
    }

    /**
     * @return Collection|Activity[]
     */
    public function getActivity(): Collection
    {
        return $this->activity;
    }

    public function addActivity(Activity $activity): self
    {
        if (!$this->activity->contains($activity)) {
            $this->activity[] = $activity;
            $activity->setUser($this);
        }

        return $this;
    }

    public function removeActivity(Activity $activity): self
    {
        if ($this->activity->removeElement($activity)) {
            // set the owning side to null (unless already changed)
            if ($activity->getUser() === $this) {
                $activity->setUser(null);
            }
        }

        return $this;
    }

    /**
     * @return Collection|Cour[]
     */
    public function getCour(): Collection
    {
        return $this->cour;
    }

    public function addCour(Cour $cour): self
    {
        if (!$this->cour->contains($cour)) {
            $this->cour[] = $cour;
            $cour->setUser($this);
        }

        return $this;
    }

    public function removeCour(Cour $cour): self
    {
        if ($this->cour->removeElement($cour)) {
            // set the owning side to null (unless already changed)
            if ($cour->getUser() === $this) {
                $cour->setUser(null);
            }
        }

        return $this;
    }

    /**
     * @return Collection|Upload[]
     */
    public function getUpload(): Collection
    {
        return $this->upload;
    }

    public function addUpload(Upload $upload): self
    {
        if (!$this->upload->contains($upload)) {
            $this->upload[] = $upload;
            $upload->setUser($this);
        }

        return $this;
    }

    public function removeUpload(Upload $upload): self
    {
        if ($this->upload->removeElement($upload)) {
            // set the owning side to null (unless already changed)
            if ($upload->getUser() === $this) {
                $upload->setUser(null);
            }
        }

        return $this;
    }

    /**
     * @return Collection|Depot[]
     */
    public function getDepot(): Collection
    {
        return $this->depot;
    }

    public function addDepot(Depot $depot): self
    {
        if (!$this->depot->contains($depot)) {
            $this->depot[] = $depot;
            $depot->setUser($this);
        }

        return $this;
    }

    public function removeDepot(Depot $depot): self
    {
        if ($this->depot->removeElement($depot)) {
            // set the owning side to null (unless already changed)
            if ($depot->getUser() === $this) {
                $depot->setUser(null);
            }
        }

        return $this;
    }

    /**
     * @return Collection|Groupe[]
     */
    public function getGroupe(): Collection
    {
        return $this->groupe;
    }

    public function addGroupe(Groupe $groupe): self
    {
        if (!$this->groupe->contains($groupe)) {
            $this->groupe[] = $groupe;
        }

        return $this;
    }

    public function removeGroupe(Groupe $groupe): self
    {
        $this->groupe->removeElement($groupe);

        return $this;
    }

    public function setUsername(string $username): self
    {
        $this->username = $username;

        return $this;
    }

    /**
     * @return Collection|Question[]
     */
    public function getQuestions(): Collection
    {
        return $this->questions;
    }

    public function addQuestion(Question $question): self
    {
        if (!$this->questions->contains($question)) {
            $this->questions[] = $question;
            $question->addUser($this);
        }

        return $this;
    }

    public function removeQuestion(Question $question): self
    {
        if ($this->questions->removeElement($question)) {
            $question->removeUser($this);
        }

        return $this;
    }

    /**
     * @return Collection|Archive[]
     */
    public function getArchives(): Collection
    {
        return $this->archives;
    }

    public function addArchive(Archive $archive): self
    {
        if (!$this->archives->contains($archive)) {
            $this->archives[] = $archive;
            $archive->setUser($this);
        }

        return $this;
    }

    public function removeArchive(Archive $archive): self
    {
        if ($this->archives->removeElement($archive)) {
            // set the owning side to null (unless already changed)
            if ($archive->getUser() === $this) {
                $archive->setUser(null);
            }
        }

        return $this;
    }

    /**
     * @return Collection|Message[]
     */
    public function getMessages(): Collection
    {
        return $this->messages;
    }

    public function addMessage(Message $message): self
    {
        if (!$this->messages->contains($message)) {
            $this->messages[] = $message;
            $message->setUser($this);
        }

        return $this;
    }

    public function removeMessage(Message $message): self
    {
        if ($this->messages->removeElement($message)) {
            // set the owning side to null (unless already changed)
            if ($message->getUser() === $this) {
                $message->setUser(null);
            }
        }

        return $this;
    }
}
