package com.example;

/** Application entry point for the GitHub Actions demo. */
public final class App {

  private App() {
    // utility class should not be instantiated
  }

  /**
   * Adds two integers.
   *
   * @param a first operand
   * @param b second operand
   * @return sum of {@code a} and {@code b}
   */
  public static int add(final int a, final int b) {
    return a + b;
  }

  /**
   * Program entry point.
   *
   * @param args command line arguments
   */
  public static void main(final String[] args) {
    System.out.println("Dont play games");
  }
}
