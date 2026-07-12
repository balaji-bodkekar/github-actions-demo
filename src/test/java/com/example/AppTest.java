package com.example;

import static org.junit.jupiter.api.Assertions.assertEquals;

import org.junit.jupiter.api.Test;

class AppTest {
  @Test
  void addShouldWork() {
    assertEquals(5, App.add(2, 3));
  }
}
