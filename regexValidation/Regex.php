<?php

namespace Obiz\MegaBundle\Entity;

use Doctrine\Common\Collections\ArrayCollection;
use Doctrine\Common\Collections\Collection;
use Doctrine\ORM\Mapping\Column;
use Doctrine\ORM\Mapping\Entity;
use Doctrine\ORM\Mapping\GeneratedValue;
use Doctrine\ORM\Mapping\HasLifecycleCallbacks;
use Doctrine\ORM\Mapping\Id;
use Doctrine\ORM\Mapping\JoinColumn;
use Doctrine\ORM\Mapping\JoinTable;
use Doctrine\ORM\Mapping\ManyToMany;
use Doctrine\ORM\Mapping\ManyToOne;
use Doctrine\ORM\Mapping\OneToMany;
use Doctrine\ORM\Mapping\Table;
use Doctrine\ORM\Mapping\UniqueConstraint;
use Obiz\MegaBundle\Repository\RegexRepository;
use Obiz\MegaBundle\Traits\TimestampableTrait;

#[Table(name: 'regex', uniqueConstraints: [new UniqueConstraint(name: 'UNIQ_REGEX_NAME_LANG', columns: ['name', 'lang'])])]
#[Entity(repositoryClass: RegexRepository::class)]
#[HasLifecycleCallbacks]
class Regex implements \Stringable
{
    use TimestampableTrait;

    #[Column(name: 'id', type: 'integer')]
    #[Id]
    #[GeneratedValue(strategy: 'AUTO')]
    private int $id;

    #[Column(name: 'name', type: 'string', length: 100, nullable: false)]
    private string $name;

    #[Column(name: 'pattern', type: 'string', length: 200, nullable: false)]
    private string $pattern;

    #[ManyToOne(targetEntity: Lang::class)]
    #[JoinColumn(name: 'lang', referencedColumnName: 'lang_id', nullable: false)]
    private Lang $lang;

    #[Column(name: 'description', type: 'string', length: 500, nullable: true, options: ['default' => null])]
    private ?string $description = null;

    #[Column(name: 'associated_kv', type: 'string', length: 100, nullable: true, options: ['default' => null])]
    private ?string $associatedKv = null;

    #[JoinTable(
        name: 'program_regex',
        joinColumns: [new JoinColumn(name: 'regex_id', referencedColumnName: 'id')],
        inverseJoinColumns: [new JoinColumn(name: 'program_id', referencedColumnName: 'id')]
    )]
    #[ManyToMany(targetEntity: Program::class, inversedBy: 'regexes')]
    private Collection $programs;

    #[OneToMany(mappedBy: 'regex', targetEntity: RegexField::class, cascade: ['persist', 'remove'], orphanRemoval: true)]
    private Collection $fields;

    public function __construct()
    {
        $this->programs = new ArrayCollection();
        $this->fields = new ArrayCollection();
    }

    public function getId(): int
    {
        return $this->id;
    }

    public function getName(): string
    {
        return $this->name;
    }

    public function setName(string $name): self
    {
        $this->name = $name;

        return $this;
    }

    public function getPattern(): string
    {
        return $this->pattern;
    }

    public function setPattern(string $pattern): self
    {
        $this->pattern = $pattern;

        return $this;
    }

    public function getDescription(): ?string
    {
        return $this->description;
    }

    public function setDescription(?string $description): self
    {
        $this->description = $description;

        return $this;
    }

    public function getLang(): Lang
    {
        return $this->lang;
    }

    public function setLang(Lang $lang): self
    {
        $this->lang = $lang;

        return $this;
    }

    public function getAssociatedKv(): ?string
    {
        return $this->associatedKv;
    }

    public function setAssociatedKv(?string $associatedKv): self
    {
        $this->associatedKv = $associatedKv;

        return $this;
    }

    public function getPrograms(): Collection
    {
        return $this->programs;
    }

    public function setPrograms(Collection $programs): self
    {
        $this->programs = $programs;

        return $this;
    }

    public function addProgram(Program $program): self
    {
        if (!$this->programs->contains($program)) {
            $this->programs[] = $program;
            $program->addRegex($this);
        }

        return $this;
    }

    public function removeProgram(Program $program): self
    {
        if ($this->programs->contains($program)) {
            $this->programs->removeElement($program);
            $program->removeRegex($this);
        }

        return $this;
    }

    public function getFields(): Collection
    {
        return $this->fields;
    }

    public function setFields(Collection $fields): self
    {
        $this->fields = $fields;

        return $this;
    }

    public function addField(RegexField $field): self
    {
        if (!$this->fields->contains($field)) {
            $this->fields[] = $field;
        }

        return $this;
    }

    public function removeField(RegexField $field): self
    {
        if ($this->fields->contains($field)) {
            $this->fields->removeElement($field);
        }

        return $this;
    }

    public function __toString(): string
    {
        return '#'.$this->getId().' - '.$this->getName();
    }
}

