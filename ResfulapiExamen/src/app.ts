import express,{Application} from "express";
import bodyParser from "body-parser"; 

import cors from "cors";
import {config} from "dotenv";
import {resolve} from "path";

config({"path": resolve(__dirname,"../.env")});
import {createConnection} from "typeorm";
import {FactSummary} from "./controller/fact_summary.controller";
class App{
    public app: Application;
    public Fact_Summary : FactSummary;
    constructor(){
        this.app = express();
        this.setConfig();
        this.setBDConnection();
        this.Fact_Summary = new FactSummary(this.app);
    }
    private setConfig(){
        this.app.use(bodyParser.json({limit:"50mb"}));
        this.app.use(bodyParser.urlencoded({limit:"150mb"}));
        this.app.use(cors());
    }
    private setBDConnection(){
        createConnection().then(connection=>{
            console.log("DB connected");
        })
    }
}

export default new App().app;