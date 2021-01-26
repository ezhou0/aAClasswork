import React from 'react';

class Tabs extends React.Component {
    constructor(props) {
        super(props);
        this.state = { 
            selectedTabIndex: 0
        };
    }
    
    clickTab(e){
        let selectedTabIndex = e.currentTarget.getAttribute("data-idx");
        this.setState({selectedTabIndex}, ()=>{console.log(this.state)});
    }

    render() {
        const beforeSelectedTab = this.props.tabs.slice(0, this.state.selectedTabIndex);
        const selectedTab = this.props.tabs.slice(this.state.selectedTabIndex, this.state.selectedTabIndex + 1);
        const afterSelectedTab = this.props.tabs.slice(this.state.selectedTabIndex+1);
        return (
            <div>
                <h1>Tabs</h1>
                <ul>
                    {beforeSelectedTab.map( (tab,idx)=>{
                        return(
                        <li key={idx} data-idx={idx} onClick={(e)=>{this.clickTab(e)}}>

                            <h3>{tab.title}</h3>
                            <article>{tab.content}</article>
                        </li>
                        );
                    })}
                    {selectedTab.map((tab, idx) => {
                        return (
                            <li key={idx} data-idx={beforeSelectedTab.length + idx} onClick={(e) => { this.clickTab(e) }}>

                                <h3 className="bold">{tab.title}</h3>
                                <article>{tab.content}</article>
                            </li>
                        );
                    })}
                    {afterSelectedTab.map((tab, idx) => {
                        return (
                            <li key={idx} data-idx={beforeSelectedTab.length + selectedTab.length + idx} onClick={(e) => { this.clickTab(e) }}>

                                <h3>{tab.title}</h3>
                                <article>{tab.content}</article>
                            </li>
                        );
                    })}
                </ul>
            </div>
        )
    }
}

export default Tabs;