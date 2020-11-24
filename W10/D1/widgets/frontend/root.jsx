import React from 'react';
import Clock from './clock';
import Tabs from './tabs'

const tabs = [
    {title: 'one', content: 'I am the first'},
    {title: 'two', content: 'Second pane here'},
    {title: 'three', content: 'Third pane here'}
]

const Root = (props) => (
    <div>
        <Clock />
        <Tabs arrayOfTabs={tabs}/>
    </div>

);


export default Root;