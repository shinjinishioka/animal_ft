import animal_ft.*;

class Tester
{
    public static void main(String[] args)
    {
		try
		{
			UranaiDAO dao = new UranaiDAO();
			
			System.out.println("kansan=" + dao.kansan(1978, 1, 1));
			System.out.println("kansan=" + dao.kansan(1990, 6, 27));
			
			UranaiDTO dto = dao.getDetailById(1, "m");
			
			System.out.println(dto.get60id());
			System.out.println(dto.get12Name());
			System.out.println(dto.get60Name());
			System.out.println(dto.getDetail());
			System.out.println(dto.get12Picture());
			System.out.println(dto.getLover_12id());
			System.out.println(dto.getLover_detail());
			System.out.println(dto.getLover_picture());
			System.out.println(dto.getFriend_12id());
			System.out.println(dto.getFriend_detail());
			System.out.println(dto.getFriend_picture());
			System.out.println(dto.getWork_12id());
			System.out.println(dto.getWork_detail());
			System.out.println(dto.getWork_picture());
		}
		catch (Exception e)
		{
			e.printStackTrace();
		}
    }
}

