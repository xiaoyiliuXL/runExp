function Params = keyParams(Params)

    KbName('UnifyKeyNames');

    keys = struct;

    % buttons
    keys.ESCKey = KbName('escape');
    keys.F1Key = KbName('f1');
    keys.F10Key = KbName('f10');
    keys.calibrationKey = KbName('c');
    keys.validationKey = KbName('v');
    keys.enterKey = KbName('return');
    keys.endKey = KbName('space');
    keys.startKey = KbName('space');
        
    keys.leftKey = KbName('f'); keys.leftKeyName = 'f'; keys.fkeyAns = 'LEFT';
    keys.rightKey = KbName('j'); keys.leftKeyName = 'j'; keys.jkeyAns = 'RIGHT';
    
    Params.keys = keys;
end