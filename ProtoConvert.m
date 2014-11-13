function poles = ProtoConvert(CF, wp, proto_poles)

b = wp/CF;

poles = ((b.*proto_poles)./2) + sqrt((((b.*proto_poles).^2)./4)-1);
poles = [poles ((b.*proto_poles)./2) - sqrt((((b.*proto_poles).^2)./4)-1)];