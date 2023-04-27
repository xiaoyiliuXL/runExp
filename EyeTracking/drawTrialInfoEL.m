function drawTrialInfoEL(TrialSeq_shuf, trial, BlockNum, nBlock, gaborParams, screenParams, expParams)
% ----------------------------------------------------------------------
% drawTrialInfoEL(scr,const,expDes,t)
% ----------------------------------------------------------------------
% Goal of the function :
% Draw a box on the eyelink display.
% Modified for the fixation task
% ----------------------------------------------------------------------
% Input(s) :
% scr = window pointer
% const = struct containing constant configuration
% expDes = struct containing experiment design
% t = trial meter
% ----------------------------------------------------------------------
% Output(s):
% none
% ----------------------------------------------------------------------
% Function created by Martin SZINTE (martin.szinte@gmail.com)
% edited by Nina HANNING (hanning.nina@gmail.com)
% Last update : 2022-06-09
% Project : timEx
% Version : 1.0
% ----------------------------------------------------------------------

% o--------------------------------------------------------------------o
% | EL Color index                                                     |
% o---------------------------------o----------------------------------o
% | Nb |  Other(cross,box,line)     | Clear screen                     |
% o---------------------------------o----------------------------------o
% |  0 | black                      | black                            |
% o---------------------------------o----------------------------------o
% |  1 | dark blue                  | dark dark blue                   |
% o----o----------------------------o----------------------------------o
% |  2 | dark green                 | dark blue                        |
% o----o----------------------------o----------------------------------o
% |  3 | dark turquoise             | blue                             |
% o----o----------------------------o----------------------------------o
% |  4 | dark red                   | light blue                       |
% o----o----------------------------o----------------------------------o
% |  5 | dark purple                | light light blue                 |
% o----o----------------------------o----------------------------------o
% |  6 | dark yellow (brown)        | turquoise                        |
% o----o----------------------------o----------------------------------o
% |  7 | light gray                 | light turquoise                  |
% o----o----------------------------o----------------------------------o
% |  8 | dark gray                  | flashy blue                      |
% o----o----------------------------o----------------------------------o
% |  9 | light purple               | green                            |
% o----o----------------------------o----------------------------------o
% | 10 | light green                | dark dark green                  |
% o----o----------------------------o----------------------------------o
% | 11 | light turquoise            | dark green                       |
% o----o----------------------------o----------------------------------o
% | 12 | light red (orange)         | green                            |
% o----o----------------------------o----------------------------------o
% | 13 | pink                       | light green                      |
% o----o----------------------------o----------------------------------o
% | 14 | light yellow               | light green                      |
% o----o----------------------------o----------------------------------o
% | 15 | white                      | flashy green                     |
% o----o----------------------------o----------------------------------o

%% Colors
fixCol          = 10;
stimFrmCol      = 15;  %white
cueCol          = 14;  %light yellow
if TrialSeq_shuf(trial, 2) == 1
    testCol         = 13;  % pink
else
    testCol = 14;
end

textCol         = 15;  %white
BGcol           =  0;  %black


%% Variables
tDir 	  = TrialSeq_shuf(trial, 3);  % rand1: tilt direction (-1 left, 1 right)
tType     = TrialSeq_shuf(trial, 2);  % rand2: trial type (1 valid, 2 invalid, 3 pilot, 4 postview)
tPos   	  = TrialSeq_shuf(trial, 1);  % rand3: cue & test position (0 left, 1 right, 2 upper, 3 lower)
tEcc  	  = gaborParams.eccDeg;  % rand4: cue & test eccentricity (1: 5deg, 2: 10deg)


% define cue location
oppVec = [3,4,1,2];
cPos = tPos;
% switch tType
%     case 1; cPos = tPos;            % valid
%     case 2; cPos = oppVec(tPos);    % invalid
%     case 3; cPos = 5;               % neutral
% end


%% Clear Screen :
Eyelink('command','clear_screen %d',BGcol);


%% Draw Stimulus

% Central fixation

    % ELFlag : if 1 : framed box
    %          if 2 : filled box
    %          if 3 : filled framed box
    % colorFrm : color of the frame
    % colorFill : color of the box

eyeLinkDrawBox(screenParams.centx, screenParams.centy, expParams.fixSize,expParams.fixSize,1,fixCol,[]);
eyeLinkDrawBox(screenParams.centx, screenParams.centy, expParams.fc_pixel*2,expParams.fc_pixel*2,1,fixCol,[]);


% Locations
eyeLinkDrawBox(screenParams.westCent(1),screenParams.westCent(2), gaborParams.fixDistTolPix*2,gaborParams.fixDistTolPix*2,1,stimFrmCol,[]);
eyeLinkDrawBox(screenParams.eastCent(1),screenParams.eastCent(2), gaborParams.fixDistTolPix*2,gaborParams.fixDistTolPix*2,1,stimFrmCol,[]);
eyeLinkDrawBox(screenParams.northCent(1), screenParams.northCent(2), gaborParams.fixDistTolPix*2,gaborParams.fixDistTolPix*2,1,stimFrmCol,[]);
eyeLinkDrawBox(screenParams.southCent(1),screenParams.southCent(2), gaborParams.fixDistTolPix*2,gaborParams.fixDistTolPix*2,1,stimFrmCol,[]);

if tPos == 0
    eyeLinkDrawBox(screenParams.westCent(1),screenParams.westCent(2),gaborParams.sacEndDistTolPix,gaborParams.sacEndDistTolPix,1,testCol,[]);
elseif tPos == 1
    eyeLinkDrawBox(screenParams.eastCent(1),screenParams.eastCent(2),gaborParams.sacEndDistTolPix,gaborParams.sacEndDistTolPix,1,testCol,[]);
elseif tPos == 2
    eyeLinkDrawBox(screenParams.northCent(1), screenParams.northCent(2),gaborParams.sacEndDistTolPix,gaborParams.sacEndDistTolPix,1,testCol,[]);
else
    eyeLinkDrawBox(screenParams.southCent(1),screenParams.southCent(2),gaborParams.sacEndDistTolPix,gaborParams.sacEndDistTolPix,1,testCol,[]);
end

% Two lines of text during trial (slow process)
text0 = sprintf('Block=%2d/%2d | TrialID=%2d',BlockNum,nBlock,trial);
eyeLinkDrawText(screenParams.centx, screenParams.centy*2 - 30, textCol, text0);
WaitSecs(0.1);

end