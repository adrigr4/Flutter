using Microsoft.EntityFrameworkCore.Migrations;

namespace JomelAPI.Migrations
{
    public partial class Initial2 : Migration
    {
        protected override void Up(MigrationBuilder migrationBuilder)
        {
            migrationBuilder.DropForeignKey(
                name: "FK_Events_EventType_TypeId",
                table: "Events");

            migrationBuilder.DropForeignKey(
                name: "FK_EventTimeMembers_Events_EventId",
                table: "EventTimeMembers");

            migrationBuilder.DropForeignKey(
                name: "FK_EventTimeMembers_Members_MemberId",
                table: "EventTimeMembers");

            migrationBuilder.DropForeignKey(
                name: "FK_PointsMembers_Members_MemberId",
                table: "PointsMembers");

            migrationBuilder.DropForeignKey(
                name: "FK_PointsMembers_Tops_TopId",
                table: "PointsMembers");

            migrationBuilder.DropColumn(
                name: "IdMember",
                table: "PointsMembers");

            migrationBuilder.DropColumn(
                name: "IdTop",
                table: "PointsMembers");

            migrationBuilder.DropColumn(
                name: "IdEvent",
                table: "EventTimeMembers");

            migrationBuilder.DropColumn(
                name: "IdMember",
                table: "EventTimeMembers");

            migrationBuilder.DropColumn(
                name: "IdType",
                table: "Events");

            migrationBuilder.AlterColumn<int>(
                name: "TopId",
                table: "PointsMembers",
                nullable: false,
                oldClrType: typeof(int),
                oldType: "int",
                oldNullable: true);

            migrationBuilder.AlterColumn<int>(
                name: "MemberId",
                table: "PointsMembers",
                nullable: false,
                oldClrType: typeof(int),
                oldType: "int",
                oldNullable: true);

            migrationBuilder.AlterColumn<int>(
                name: "MemberId",
                table: "EventTimeMembers",
                nullable: false,
                oldClrType: typeof(int),
                oldType: "int",
                oldNullable: true);

            migrationBuilder.AlterColumn<int>(
                name: "EventId",
                table: "EventTimeMembers",
                nullable: false,
                oldClrType: typeof(int),
                oldType: "int",
                oldNullable: true);

            migrationBuilder.AlterColumn<int>(
                name: "TypeId",
                table: "Events",
                nullable: false,
                oldClrType: typeof(int),
                oldType: "int",
                oldNullable: true);

            migrationBuilder.AddForeignKey(
                name: "FK_Events_EventType_TypeId",
                table: "Events",
                column: "TypeId",
                principalTable: "EventType",
                principalColumn: "Id",
                onDelete: ReferentialAction.Cascade);

            migrationBuilder.AddForeignKey(
                name: "FK_EventTimeMembers_Events_EventId",
                table: "EventTimeMembers",
                column: "EventId",
                principalTable: "Events",
                principalColumn: "Id",
                onDelete: ReferentialAction.Cascade);

            migrationBuilder.AddForeignKey(
                name: "FK_EventTimeMembers_Members_MemberId",
                table: "EventTimeMembers",
                column: "MemberId",
                principalTable: "Members",
                principalColumn: "Id",
                onDelete: ReferentialAction.Cascade);

            migrationBuilder.AddForeignKey(
                name: "FK_PointsMembers_Members_MemberId",
                table: "PointsMembers",
                column: "MemberId",
                principalTable: "Members",
                principalColumn: "Id",
                onDelete: ReferentialAction.Cascade);

            migrationBuilder.AddForeignKey(
                name: "FK_PointsMembers_Tops_TopId",
                table: "PointsMembers",
                column: "TopId",
                principalTable: "Tops",
                principalColumn: "Id",
                onDelete: ReferentialAction.Cascade);
        }

        protected override void Down(MigrationBuilder migrationBuilder)
        {
            migrationBuilder.DropForeignKey(
                name: "FK_Events_EventType_TypeId",
                table: "Events");

            migrationBuilder.DropForeignKey(
                name: "FK_EventTimeMembers_Events_EventId",
                table: "EventTimeMembers");

            migrationBuilder.DropForeignKey(
                name: "FK_EventTimeMembers_Members_MemberId",
                table: "EventTimeMembers");

            migrationBuilder.DropForeignKey(
                name: "FK_PointsMembers_Members_MemberId",
                table: "PointsMembers");

            migrationBuilder.DropForeignKey(
                name: "FK_PointsMembers_Tops_TopId",
                table: "PointsMembers");

            migrationBuilder.AlterColumn<int>(
                name: "TopId",
                table: "PointsMembers",
                type: "int",
                nullable: true,
                oldClrType: typeof(int));

            migrationBuilder.AlterColumn<int>(
                name: "MemberId",
                table: "PointsMembers",
                type: "int",
                nullable: true,
                oldClrType: typeof(int));

            migrationBuilder.AddColumn<int>(
                name: "IdMember",
                table: "PointsMembers",
                type: "int",
                nullable: false,
                defaultValue: 0);

            migrationBuilder.AddColumn<int>(
                name: "IdTop",
                table: "PointsMembers",
                type: "int",
                nullable: false,
                defaultValue: 0);

            migrationBuilder.AlterColumn<int>(
                name: "MemberId",
                table: "EventTimeMembers",
                type: "int",
                nullable: true,
                oldClrType: typeof(int));

            migrationBuilder.AlterColumn<int>(
                name: "EventId",
                table: "EventTimeMembers",
                type: "int",
                nullable: true,
                oldClrType: typeof(int));

            migrationBuilder.AddColumn<int>(
                name: "IdEvent",
                table: "EventTimeMembers",
                type: "int",
                nullable: false,
                defaultValue: 0);

            migrationBuilder.AddColumn<int>(
                name: "IdMember",
                table: "EventTimeMembers",
                type: "int",
                nullable: false,
                defaultValue: 0);

            migrationBuilder.AlterColumn<int>(
                name: "TypeId",
                table: "Events",
                type: "int",
                nullable: true,
                oldClrType: typeof(int));

            migrationBuilder.AddColumn<int>(
                name: "IdType",
                table: "Events",
                type: "int",
                nullable: false,
                defaultValue: 0);

            migrationBuilder.AddForeignKey(
                name: "FK_Events_EventType_TypeId",
                table: "Events",
                column: "TypeId",
                principalTable: "EventType",
                principalColumn: "Id",
                onDelete: ReferentialAction.Restrict);

            migrationBuilder.AddForeignKey(
                name: "FK_EventTimeMembers_Events_EventId",
                table: "EventTimeMembers",
                column: "EventId",
                principalTable: "Events",
                principalColumn: "Id",
                onDelete: ReferentialAction.Restrict);

            migrationBuilder.AddForeignKey(
                name: "FK_EventTimeMembers_Members_MemberId",
                table: "EventTimeMembers",
                column: "MemberId",
                principalTable: "Members",
                principalColumn: "Id",
                onDelete: ReferentialAction.Restrict);

            migrationBuilder.AddForeignKey(
                name: "FK_PointsMembers_Members_MemberId",
                table: "PointsMembers",
                column: "MemberId",
                principalTable: "Members",
                principalColumn: "Id",
                onDelete: ReferentialAction.Restrict);

            migrationBuilder.AddForeignKey(
                name: "FK_PointsMembers_Tops_TopId",
                table: "PointsMembers",
                column: "TopId",
                principalTable: "Tops",
                principalColumn: "Id",
                onDelete: ReferentialAction.Restrict);
        }
    }
}
