import { LightningElement } from 'lwc'
import { NavigationMixin } from 'lightning/navigation';

import IMAGES from '@salesforce/resourceUrl/portifolioImages'
import PRESENTATION_TEXT from '@salesforce/label/c.presentationText'

export default class Portifolio extends NavigationMixin(LightningElement) {

    firstName = 'John'
    lastName = 'Snow'
    presentationText = PRESENTATION_TEXT

    avatarLarge = IMAGES + '/avatar_large.png'
    avatarSmall = IMAGES + '/avatar_small.png'

    get portifolioItems() {

        let portifolioItems = [{
            key: 1,
            img: this.avatarSmall,
            title: 'Lorem Ipsum',
            text: 'Lorem Ipsum'
        },
        {
            key: 2,
            img: this.avatarSmall,
            title: 'Lorem Ipsum',
            text: 'Lorem Ipsum'
        },
        {
            key: 3,
            img: this.avatarSmall,
            title: 'Lorem Ipsum',
            text: 'Lorem Ipsum'
        }]

        return portifolioItems
    }

    handleClick() {

        const accountPageRef = {
            type: 'standard__recordPage',
            attributes: {
                recordId: '001Dn00000Ahj13IAB',
                objectApiName: 'Account',
                actionName: 'view'
            }
        }

        this[NavigationMixin.Navigate](accountPageRef)
    }


}