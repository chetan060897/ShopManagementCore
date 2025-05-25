using System;
using System.Collections.Generic;
using System.ComponentModel.DataAnnotations;
using System.ComponentModel.DataAnnotations.Schema;
using Microsoft.EntityFrameworkCore;

namespace ShopManagementCore.Models;

[Keyless]
[Table("TblOrder")]
public partial class TblOrder
{
    [Column("OrderID")]
    public int OrderId { get; set; }

    [Column("ProductSizeID")]
    public int? ProductSizeId { get; set; }

    [Column(TypeName = "datetime")]
    public DateTime? Date { get; set; }

    [Column("CustomerID")]
    public int? CustomerId { get; set; }

    [StringLength(50)]
    public string? Status { get; set; }

    public int? Discount { get; set; }

    public int? IsDeleted { get; set; }
}
