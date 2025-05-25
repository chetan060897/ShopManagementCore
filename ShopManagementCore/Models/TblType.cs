using System;
using System.Collections.Generic;
using System.ComponentModel.DataAnnotations;
using System.ComponentModel.DataAnnotations.Schema;
using Microsoft.EntityFrameworkCore;

namespace ShopManagementCore.Models;

[Keyless]
[Table("TblType")]
public partial class TblType
{
    [Column("ProductTypeID")]
    public int ProductTypeId { get; set; }

    [StringLength(50)]
    public string? ProductType { get; set; }
}
