const Util = {
    inherits(childClass, parentClass) {
        function Surrogate(){};
        Surrogate.prototype = parentClass.prototype;
        childClass.prototype = new Surrogate();
        childClass.prototype.constructor = childClass;
    },

    randomVec(length=50) {
        const deg = 2 * Math.PI * Math.random();
        return Util.scale([Math.sin(deg), Math.cos(deg)], length);
    },

    scale(vec, m) {
        return [vec[0] * m, vec[1] * m];
    },

    wrap(pos, max){
        if(pos >= max){
            return pos % max;
        }else if(pos < 0){
            return max + pos;
        }else{
            return pos;
        }
    },

    distance(pos1, pos2){
        return Math.sqrt( (pos1[0] - pos2[0])**2 + (pos1[1] - pos2[1])**2 );
    }
};



module.exports = Util;