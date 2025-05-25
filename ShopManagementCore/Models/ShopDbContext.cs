using System;
using System.Collections.Generic;
using Microsoft.EntityFrameworkCore;

namespace ShopManagementCore.Models;

public partial class ShopDbContext : DbContext
{
    public ShopDbContext()
    {
    }

    public ShopDbContext(DbContextOptions<ShopDbContext> options)
        : base(options)
    {
    }

    public virtual DbSet<TblOrder> TblOrders { get; set; }

    public virtual DbSet<TblProductRagistration> TblProductRagistrations { get; set; }

    public virtual DbSet<TblProductSize> TblProductSizes { get; set; }

    public virtual DbSet<TblRagistration> TblRagistrations { get; set; }

    public virtual DbSet<TblType> TblTypes { get; set; }

    protected override void OnConfiguring(DbContextOptionsBuilder optionsBuilder)
    {
        if (!optionsBuilder.IsConfigured)
        {

        }
    }
//#warning To protect potentially sensitive information in your connection string, you should move it out of source code. You can avoid scaffolding the connection string by using the Name= syntax to read it from configuration - see https://go.microsoft.com/fwlink/?linkid=2131148. For more guidance on storing connection strings, see https://go.microsoft.com/fwlink/?LinkId=723263.
//        => optionsBuilder.UseSqlServer("Server=DESKTOP-534SU1S\\SQLEXPRESS;Database=ShopManagement;Trusted_Connection=True;TrustServerCertificate=True;");

    protected override void OnModelCreating(ModelBuilder modelBuilder)
    {
        modelBuilder.Entity<TblOrder>(entity =>
        {
            entity.Property(e => e.OrderId).ValueGeneratedOnAdd();
        });

        modelBuilder.Entity<TblProductRagistration>(entity =>
        {
            entity.Property(e => e.ProductNameId).ValueGeneratedOnAdd();
        });

        modelBuilder.Entity<TblProductSize>(entity =>
        {
            entity.Property(e => e.ProductSizeId).ValueGeneratedOnAdd();
        });

        modelBuilder.Entity<TblRagistration>(entity =>
        {
            entity.Property(e => e.CustomerId).ValueGeneratedOnAdd();
        });

        modelBuilder.Entity<TblType>(entity =>
        {
            entity.Property(e => e.ProductTypeId).ValueGeneratedOnAdd();
        });

        OnModelCreatingPartial(modelBuilder);
    }

    partial void OnModelCreatingPartial(ModelBuilder modelBuilder);
}
