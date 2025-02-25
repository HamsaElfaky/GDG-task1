
using System;

class Calculator
{
    static void Main()
    {
        do
        {
            double num1 = GetNumber("Enter first number: ");
            double num2 = GetNumber("Enter second number: ");
            char operation = GetOperator();
            
            double result = PerformCalculation(num1, num2, operation);
            Console.WriteLine($"Result: {result}");
            
        } while (ContinueCalculation());
    }

    static double GetNumber(string message)
    {
        double number;
        while (true)
        {
            Console.Write(message);
            if (double.TryParse(Console.ReadLine(), out number))
                return number;
            Console.WriteLine("Invalid input");
        }
    }

    static char GetOperator()
    {
        while (true)
        {
            Console.Write("Enter operator (+, -, *, /): ");
            char op = Console.ReadKey().KeyChar;
            Console.WriteLine();
            if (op == '+' || op == '-' || op == '*' || op == '/')
                return op;
            Console.WriteLine("Invalid operator");
        }
    }

    static double PerformCalculation(double num1, double num2, char operation)
    {
        if (operation == '+') return num1 + num2;
        if (operation == '-') return num1 - num2;
        if (operation == '*') return num1 * num2;
        if (operation == '/') 
        {
            if (num2 == 0)
            {
                Console.WriteLine("Error: Division by zero is not allowed.");
                return double.NaN;
            }
            return num1 / num2;
        }
        return 0;
    }

    static bool ContinueCalculation()
    {
        Console.Write("Do you want to perform another calculation? ");
        char response = Console.ReadKey().KeyChar;
        Console.WriteLine();
        return response == 'y' || response == 'Y';
    }
}
