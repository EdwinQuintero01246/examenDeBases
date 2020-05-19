import {Entity, Column, PrimaryColumn} from "typeorm";
@Entity({schema:"example", database:"ingreso_vehiculos", name:"fact_summary"})

export class Factsummary{
    @PrimaryColumn() CustomerID: number;
    @Column() CustomerName: string;
    @Column() SupplierID: number;
    @Column() SupplierName: string;
    @Column() Mes: number;
    @Column() year: number;
    @Column() Total: number;
    @Column() SuperoPromedio: number;
    @Column() PorcentajeVentaMensual: number;
}
export interface Ifactsummary{
    CustomerID: number;
    CustomerName: string;
    SupplierID: number;
    SupplierName: string;
    Mes: number;
    year: number;
    Total: number;
    SuperoPromedio: number;
    PorcentajeVentaMensual: number;
}
export interface IResult{
    Successed: boolean;
    MSG:string;
}