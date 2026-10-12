using System;
using System.Security.Cryptography;
using System.Text;

public static class PasswordHelper
{
    public static string HashPassword(string password)
    {
        using (SHA256 sha256 = SHA256.Create())
        {
            byte[] bytes = Encoding.UTF8.GetBytes(password);
            byte[] hash = sha256.ComputeHash(bytes);

            StringBuilder result = new StringBuilder();

            foreach (byte b in hash)
            {
                result.Append(b.ToString("x2"));
            }

            return result.ToString();
        }
    }

    public static bool VerifyPassword(string password, string passwordHash)
    {
        string hashedPassword = HashPassword(password);

        return string.Equals(
            hashedPassword,
            passwordHash,
            StringComparison.OrdinalIgnoreCase
        );
    }
}