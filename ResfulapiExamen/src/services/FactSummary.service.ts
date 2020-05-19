import {Request,Response} from "express";
import {getConnection} from "typeorm";
import {Factsummary,Ifactsummary,IResult} from "../entity/Factsummary.entity";

export class FactSummaryS{
    public async getAll(req: Request, res:Response){
        const factummaryS: IResult[] = await getConnection().query(`
        EXEC example.SP_factummaryS
        `)
        res.status(201).json(factummaryS);
    }
    public async getOneCustomer(req:Request,res:Response){
        const factummaryS: IResult[] = await getConnection().query(`
        EXEC example.SP_factummarySListar
        @CustomerID = ${req.params.id}`);
        res.status(200).json(factummaryS);
    }
}