import React from 'react';

class Tabs extends React.Component {
    constructor(props) {
        super(props);

        this.state = {
            selectedTab: 0
        }

        this.selectTab = this.selectTab.bind(this);
    }

    selectTab(e) {
        const body = this.state.selectedTab

        const titles = this.props.arrayOfTabs.map( ele => ele.title )
        const selectedTab = titles.indexOf(e.currentTarget.value)
        const $selectedTab = $(e.currentTarget)
        $selectedTab.addClass
        this.setState({ selectedTab });
    }

    render() {
        const { selectedTab } = this.state;

        let titles = this.props.arrayOfTabs.map( el => el.title )    
        titles = titles.map( (title, idx) => (
            <button onClick={this.selectTab} value={title}>{title}</button>
        ));

        const body = this.props.arrayOfTabs[selectedTab].content;

        return (
            <div>
                <div class="tabs">
                    <h1>SOME TABS</h1>
                    <div className="tab-titles">
                        {titles}
                    </div>
                    <div className="tab-body">
                        {body}
                    </div>
                </div>
            </div>
        );
    }
}
export default Tabs