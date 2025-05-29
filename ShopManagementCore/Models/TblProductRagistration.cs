using System;
using System.Collections.Generic;
using System.ComponentModel.DataAnnotations;
using System.ComponentModel.DataAnnotations.Schema;
using Microsoft.AspNetCore.Mvc.Rendering;
using Microsoft.EntityFrameworkCore;

namespace ShopManagementCore.Models;

[Keyless]
[Table("TblProductRagistration")]
public partial class TblProductRagistration
{
    [Column("ProductNameID")]
    public int ProductNameId { get; set; }

    [Column("ProductTypeID")]
    public int? ProductTypeId { get; set; }

    [StringLength(50)]
    public string? ProductName { get; set; }

    [NotMapped]
    public List<SelectListItem> ProductTypes { get; set; }
    [NotMapped]
    public List<SelectListItem> ProductNames { get; set; }

}
