<?php

namespace Obiz\MegaBundle\Entity;

use Doctrine\ORM\Mapping\Column;
use Doctrine\ORM\Mapping\Entity;
use Doctrine\ORM\Mapping\GeneratedValue;
use Doctrine\ORM\Mapping\Id;
use Doctrine\ORM\Mapping\JoinColumn;
use Doctrine\ORM\Mapping\ManyToOne;
use Doctrine\ORM\Mapping\Table;
use Obiz\MegaBundle\Repository\RegexFieldRepository;

#[Entity(repositoryClass: RegexFieldRepository::class)]
#[Table(name: 'regex_field')]
class RegexField implements \Stringable
{
    #[Column(name: 'id', type: 'integer')]
    #[Id]
    #[GeneratedValue(strategy: 'AUTO')]
    private ?int $id = null;

    #[Column(type: 'string', length: 255, nullable: false)]
    private ?string $field = null;

    #[ManyToOne(targetEntity: Regex::class, inversedBy: 'fields')]
    #[JoinColumn(name: 'regex_id', referencedColumnName: 'id', nullable: false)]
    private ?Regex $regex = null;

    public function getId(): ?int
    {
        return $this->id;
    }

    public function getField(): ?string
    {
        return $this->field;
    }

    public function setField(string $field): self
    {
        $this->field = $field;

        return $this;
    }

    public function getRegex(): ?Regex
    {
        return $this->regex;
    }

    public function setRegex(?Regex $regex): self
    {
        $this->regex = $regex;

        return $this;
    }

    public function __toString()
    {
        return '#'.$this->getId().' - '.$this->getField();
    }
}

