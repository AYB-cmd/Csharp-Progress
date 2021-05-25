using System;

namespace Rectangle
{
    class Program
    {
        static void Main(string[] args)
        {
            Console.WriteLine("type rectange width");
           string widthString = Console.ReadLine();
            Console.WriteLine("type rectange height");
           string  heightString = Console.ReadLine();
            Console.WriteLine("type rectange border width");
           string BorderWidthString = Console.ReadLine();

            int width = Convert.ToInt32(widthString);
            int height = Convert.ToInt32(heightString);
            int borderWidth = Convert.ToInt32(BorderWidthString);
            DrawRectangle(width, height, borderWidth);
            Console.ReadKey(true);

        }
        static void DrawRectangle(int width, int height, int borderWidth)
        {
            for (int i = 0; i < height; i++)
            {
                for (int j = 0; j < width; j++)
                {
                    if (i < borderWidth || i > height - 1 - borderWidth || j < borderWidth || j > width - 1 - borderWidth)
                    {
                        Console.Write('#');
                    }

                    else
                    {
                        Console.Write('.');
                    }
                    
                }
                Console.WriteLine();
            }
            Console.WriteLine();
        }
    }
}
