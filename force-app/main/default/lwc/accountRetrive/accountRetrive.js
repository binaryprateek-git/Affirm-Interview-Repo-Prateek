import { LightningElement, track, wire } from 'lwc';
import getAccount from '@salesforce/apex/AccountRetriver.getAccount'
import getAccDetails from '@salesforce/apex/AccountRetriver.getSelectedAccDetails'

export default class AccountRetrive extends LightningElement {
    @track selectedAccId;
    @track accountdetailObj;

    @wire(getAccount)
    accountObj;
    
   /* @wire(getAccount)
    wiredAccount({ error, data }){
        console.log('dataAcc'+data);
        if(data) {
            let optionsValues = [];
            for(let i = 0; i < data.values.length; i++) {
                console.log('dataVal'+data.Name);
                optionsValues.push({
                    label: data.Name[i],
                    value: data.Name[i]
                })
            }
            this.options = optionsValues;
            window.console.log('optionsValues ===> '+JSON.stringify(optionsValues));
        }
        else if(error) {
            window.console.log('error ===> '+JSON.stringify(error));
        }
    };*/

    //datalist;

   get responseReceived(){
        if(this.accountObj){
            return true;
        }else{
            return false;
        }
    }


    selectedAccountHandler(event){
        console.log('Selected'+'$recordId');
        this.selectedAccId = '$recordId';
    }
    onClickHandler(event){
        getAccDetails({selectedAcc:this.selectedAccId}).then(response =>{
            this.accountdetailObj=response;
        }).catch(error =>{
            console.error('Error in details', error.body.message);
        })
    }
}