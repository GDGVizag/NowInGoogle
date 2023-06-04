String capitalize(String str) {
  return str
      .split(' ')
      .map((word) => word.length > 1
          ? word.substring(0, 1).toUpperCase() + word.substring(1)
          : word.toUpperCase())
      .join(' ');
}
