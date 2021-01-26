import React from 'react';
import Clock from './clock.jsx';
import Tabs from './tabs.jsx';

let Root = (props) => {
    let tabs = [{title: "hello", content: "world"}, {title: "object", content: "object"}];
    return (
        <div>
            <Clock />
            <Tabs tabs={tabs}/>
        </div>

    );
};

export default Root;