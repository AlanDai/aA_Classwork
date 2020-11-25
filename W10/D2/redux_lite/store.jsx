export default class Store{
    constructor(rootReducer) {
        this.rootReducer = rootReducer;
        this.state = {
      
        };
    }

    getState() {
      const target = {}
      Object.assign(target, this.state);
      return target;
    }
}