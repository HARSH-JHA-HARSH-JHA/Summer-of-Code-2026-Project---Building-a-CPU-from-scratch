//lemmings_1 module has two states state = 0 and state = 1.
//state = 0 represents Lemming moving left.
//state = 1 represents Lemming moving right.

module lemmings_1(
    input clk,
    input areset,    
    input bump_left,
    input bump_right,
    output walk_left,
    output walk_right); 

    parameter LEFT=0, RIGHT=1;
    reg state, next_state;

    always @(*) begin
        case(state)
            LEFT : begin
                if(bump_left) next_state = RIGHT;
                else next_state = LEFT;
            end
            RIGHT : begin
                if(bump_right) next_state = LEFT;
                else next_state = RIGHT;
            end
        endcase
    end

    always @(posedge clk, posedge areset) begin
        if(areset) state <= LEFT;
        else state <= next_state;
    end
	
    assign walk_left = (state == LEFT);
    assign walk_right = (state == RIGHT);

endmodule


//lemmings_2 module has four states 0001, 0010, 0100, 1000.
//state = 0001 represents Lemming moving left.
//state = 0010 represents Lemming moving right.
//state = 0100 represents Lemming falling but just before falling, it was moving left.
//state = 1000 represents Lemming falling but just before falling, it was moving right.

module lemmings_2(
    input clk,
    input areset,   
    input bump_left,
    input bump_right,
    input ground,
    output walk_left,
    output walk_right,
    output aaah );
    
    reg [3:0] state, next_state;
    parameter LEFT = 0, RIGHT = 1, AAAHL = 2, AAAHR = 3;
    
    always @(*) begin
        next_state[LEFT] = state[LEFT]&ground&~bump_left|state[RIGHT]&ground&bump_right|state[AAAHL]&ground;
    	next_state[RIGHT] = state[LEFT]&ground&bump_left|state[RIGHT]&ground&~bump_right|state[AAAHR]&ground;
    	next_state[AAAHL] = state[LEFT]&~ground|state[AAAHL]&~ground;
    	next_state[AAAHR] = state[RIGHT]&~ground|state[AAAHR]&~ground;
    end
    
    always @(posedge clk, posedge areset)
        if(areset) state <= 4'b1;
    	else state <= next_state;
    
    assign walk_left = state[LEFT];
    assign walk_right = state[RIGHT];
    assign aaah = state[AAAHR]|state[AAAHL];
    
endmodule


//lemmings_3 module has six states 000001, 000010, 000100, 001000, 010000, 100000.
//state = 000001 represents Lemming moving left.
//state = 000010 represents Lemming moving right.
//state = 000100 represents Lemming falling but just before falling, it was moving left.
//state = 001000 represents Lemming falling but just before falling, it was moving right.
//state = 010000 represents Lemming digging but just before digging, it was moving left.
//state = 100000 represents Lemming digging but just before digging, it was moving right.

module lemmings_3(
    input clk,
    input areset,  
    input bump_left,
    input bump_right,
    input ground,
    input dig,
    output walk_left,
    output walk_right,
    output aaah,
    output digging ); 
    
    reg [5:0] state, next_state;
    parameter LEFT = 0, RIGHT = 1, AAAHL = 2, AAAHR = 3, DIGL = 4, DIGR = 5;
    
    always @(*) begin
        next_state[LEFT] = state[LEFT]&~dig&~bump_left&ground|state[RIGHT]&~dig&bump_right&ground|state[AAAHL]&ground;
        next_state[RIGHT] = state[LEFT]&~dig&bump_left&ground|state[RIGHT]&~dig&~bump_right&ground|state[AAAHR]&ground;
        next_state[AAAHL] = state[LEFT]&~ground|state[AAAHL]&~ground|state[DIGL]&~ground;
        next_state[AAAHR] = state[RIGHT]&~ground|state[AAAHR]&~ground|state[DIGR]&~ground;
        next_state[DIGL] = state[LEFT]&ground&dig|state[DIGL]&ground;
        next_state[DIGR] = state[RIGHT]&ground&dig|state[DIGR]&ground;
    end
    
    always @(posedge clk, posedge areset)
        if(areset) state <= 6'b1;
    	else state <= next_state;
    
    assign walk_left = state[LEFT];
    assign walk_right = state[RIGHT];
    assign aaah = state[AAAHL]|state[AAAHR];
    assign digging = state[DIGL]|state[DIGR];

endmodule


//lemmings_4 module has seven states 000001, 000010, 000100, 001000, 010000, 100000, 000000.
//state = 000001 represents Lemming moving left.
//state = 000010 represents Lemming moving right.
//state = 000100 represents Lemming falling but just before falling, it was moving left.
//state = 001000 represents Lemming falling but just before falling, it was moving right.
//state = 010000 represents Lemming digging but just before digging, it was moving left.
//state = 100000 represents Lemming digging but just before digging, it was moving right.
//state = 000000 represents Lemming splashed.

module lemmings_4(
    input clk,
    input areset,  
    input bump_left,
    input bump_right,
    input ground,
    input dig,
    output walk_left,
    output walk_right,
    output aaah,
    output digging ); 
    
    reg [5:0] state, next_state;
    reg [8:0] i;
    parameter LEFT = 0, RIGHT = 1, AAAHL = 2, AAAHR = 3, DIGL = 4, DIGR = 5;
    
    always @(*) begin
        next_state[LEFT] = state[LEFT]&~dig&~bump_left&ground|state[RIGHT]&~dig&bump_right&ground|state[AAAHL]&ground&(i < 20);
        next_state[RIGHT] = state[LEFT]&~dig&bump_left&ground|state[RIGHT]&~dig&~bump_right&ground|state[AAAHR]&ground&(i < 20);
        next_state[AAAHL] = state[LEFT]&~ground|state[AAAHL]&~ground|state[DIGL]&~ground;
        next_state[AAAHR] = state[RIGHT]&~ground|state[AAAHR]&~ground|state[DIGR]&~ground;
        next_state[DIGL] = state[LEFT]&ground&dig|state[DIGL]&ground;
        next_state[DIGR] = state[RIGHT]&ground&dig|state[DIGR]&ground;
    end
    
    always @(posedge clk, posedge areset) begin
        if(areset) begin 
            state <= 6'b1;
            i <= 0;
        end
        else if(aaah) begin 
            i <= i + 1;
            state <= next_state;
        end
        else begin
            i <= 0;
            state <= next_state;
        end
    end
    
    assign walk_left = state[LEFT];
    assign walk_right = state[RIGHT];
    assign aaah = state[AAAHL]|state[AAAHR];
    assign digging = state[DIGL]|state[DIGR];   

endmodule