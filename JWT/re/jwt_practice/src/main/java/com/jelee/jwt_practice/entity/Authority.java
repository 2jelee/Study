package com.jelee.jwt_practice.entity;

import lombok.*;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.Id;
import javax.persistence.Table;


@Entity
@Table(name = "authority")
@Getter
@Setter
@Builder
@AllArgsConstructor
@NoArgsConstructor
public class Authority {

    @Id // authorityName(권한명) 이라는 Primary Key
    @Column(name = "authority_name", length = 50)
    private String authorityName;
}