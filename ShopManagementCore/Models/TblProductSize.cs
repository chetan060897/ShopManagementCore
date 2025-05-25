using System;
using System.Collections.Generic;
using System.ComponentModel.DataAnnotations;
using System.ComponentModel.DataAnnotations.Schema;
using Microsoft.EntityFrameworkCore;

namespace ShopManagementCore.Models;

[Keyless]
[Table("TblProductSize")]
public partial class TblProductSize
{
    [Column("ProductSizeID")]
    public int ProductSizeId { get; set; }

    [Column("ProductNameID")]
    public int? ProductNameId { get; set; }

    [StringLength(50)]
    public string? ProductSize { get; set; }

    [StringLength(50)]
    public string? ProductPrice { get; set; }
}
