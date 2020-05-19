import {Application} from "express";
import {FactSummaryS} from  "../services/FactSummary.service";

export class FactSummary{
    Fact_Summary: FactSummaryS;
    constructor(private app: Application){
        this.Fact_Summary = new FactSummaryS();
        this.routes();
    }
    private routes(){
        this.app.route("/FactSummary").get(this.Fact_Summary.getAll);
        this.app.route("/FactSummary/Customer/:id").get(this.Fact_Summary.getOneCustomer);
    }
}