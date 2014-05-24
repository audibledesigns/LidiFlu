using System;
using System.Collections.Generic;
using System.Linq;
using System.Runtime.Serialization;
using System.ServiceModel;
using System.Text;

// NOTE: You can use the "Rename" command on the "Refactor" menu to change the class name "Service" in code, svc and config file together.
public class Service : IService
{
    public List<Job> jobList()
	{
        EngineeringDataContext dc = new EngineeringDataContext();

        var results = from q in dc.Jobs
                      select q;
        return results.ToList();

	}
}
