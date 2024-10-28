# Nama: Mohamad Arvin Fadriansyah
def hitung_bmi(massa, tinggi):
    """
    Fungsi untuk menghitung nilai BMI (Body Mass Index) berdasarkan berat badan dan tinggi badan yang diberikan.

    Args:
        massa (float): Berat badan dalam kilogram
        tinggi (float): Tinggi badan dalam meter

    Returns:
        float: Nilai BMI

    Raises:
        ValueError: Jika berat badan atau tinggi badan kurang dari atau sama dengan 0
    """
    if massa <= 0 or tinggi <= 0:
        raise ValueError("Berat badan dan tinggi badan harus lebih dari 0.")

    bmi = massa / (tinggi ** 2)
    return bmi


def interpretasi_bmi(bmi):
    """
    Fungsi untuk menginterpretasikan nilai BMI dan memberikan keterangan yang sesuai.

    Args:
        bmi (float): Nilai BMI

    Returns:
        str: Keterangan interpretasi BMI
    """
    if bmi < 18.5:
        return "Berat badan kurang (Underweight)"
    elif bmi <= 22.9:
        return "Berat badan normal"
    elif bmi <= 24.9:
        return "Kelebihan berat badan (Overweight) dengan resiko"
    elif bmi <= 29.9:
        return "Obesitas I"
    else:
        return "Obesitas II"
