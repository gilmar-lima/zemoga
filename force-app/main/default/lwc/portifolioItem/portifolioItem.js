import { api, LightningElement } from 'lwc';

export default class PortifolioItem extends LightningElement {

    @api
    img

    @api
    title

    @api
    text

}