--                 Resume Media Version 3.23
--        VLC Lua Extension by Rocky Dotterer 5/5/2014
--     Last update 5/27/2015 (see change log further down)


-------- user adjustable variables (please use caution!) --------------

simple = false   -- set true for single table and no dialog window
filename = ""    -- change if you want file(s) in your own directory

--    Version 3 uses the same data files as version 2 by default
--                  examples for filename (must end in .txt) 
--    filename = "D:\\Video\\VLC Resume Media V3.txt" 
--                  this example places data closer to the extension 
--    filename = "C:\\Users\\<you>\\AppData\\Roaming\\vlc\\lua\\"..
--               "extensions\\Resume Media\\VLC Resume Media V3.txt"

-----------------------------------------------------------------------

--[[       please don't change anything below this line

 Coded in VLC 2.1.5 and Windows 8.1
 Copy this file text (Cntl-A Cntl-C) and paste (Cntl-V) in a text
    file named "VLC Resume Media V3.lua" in the following directory:
    C:\Users\<you>\AppData\Roaming\vlc\lua\extensions
    (Create ..\lua\extensions directory if necessary.)
 Open VLC and check "Resume Media V3" in View menu before playing.
 Version 3 uses the same data files as version 2 by default.
 Media positions saved in default VLC user data directory
    which should be C:\Users\<you>\AppData\Roaming\vlc
    as "VLC Resume Media V2.txt". Separate file for each table.
    User settings are stored in "VLC Resume Media V2 Vars.txt".
 If you use V2 after using V3, table bookmarks could be reset.

 Description: 

 Resume Media detects the stopped positions of all video and audio 
 files in VLC and saves the positions in a table. When you restart, 
 say, a video in VLC, Resume Media detects it and automatically 
 moves the slider to the saved position. When the video completes, 
 the entry is removed from the table.

 For users who want a simple resume feature and don't need the
 advanced features of the Resume Media table dialog window, change the
 settings variable to hide Resume Media when 'X' button clicked. Then
 when you click the 'X' button at the top, Resume Media will run in
 the background using the current table. Start and stop media from any
 VLC playlist as usual and the media will resume where last stopped.

 However, the Resume Media dialog window allows you to sort or play
 the entries in a table or to switch tables. You can import the VLC
 playlist to a table, auto-adjust a video picture and much more...

     ~ ~ ~ ~ ~ ~ ~ ~ ~ ~ ~ ~ ~ ~ ~ ~ ~ ~ ~ ~ ~ ~ ~ ~ ~

 A table can be used as a playlist for, say, a tv series or a music album. 
 The resume feature then allows you to play and stop and quickly resume 
 whichever entries interest you at the time until you have finally 
 completed the list. Sort the list to see which entries you have started.

 You can import and save top level playlists or directories into 
 a table. Then, when you are ready, move one entry to VLC, expand it, 
 and then import the media list back to a different table for execution.

 Bookmark features:
 The playing media is now bookmarked with a '*' symbol.
 When finished, the bookmark advances to the next unfinished media.
 If all media finished, the bookmark increments to the next media.
 Convenient button to play the bookmark where you left off.
 Play all unfinished or whole table with options to randomize and loop.
 
 Features and Notes:
 Tested in VLC 2.1.5 and Win 8.1.
 Install and check 'Resume Media V2' in View menu when VLC is opened.
 (Yes, extensions must be checked each time VLC is opened. It's OK....)
 If you open Resume Media while media is playing, the next stop event
    will be undetectable. Stop and restart the media to allow detection
    or click [Import/Play] to manually save the position without stopping.
 There is a media-just-started tolerance of 60 seconds, so you have
    60 seconds to sample media without saving the stop position.
 When resuming, the position will rewind 5 seconds from the saved position.
 Variables 'Media-just-started' and 'Rewind' are adjustable.
 In the event that there are identical media names in the VLC playlist,
    Resume Media assumes they are truly identical (same media file),
    and saves the path of the first one entered into the table.
 Operations are performed on the current table. If you switch tables while
    media is playing, the stop position will be saved in the new table.
 There is a setting to block automatic new table entries when media stops.
 Marking a table with '*' will keep media in the table when finished.
 The number of tables is adjustable from 1 to 50 tables.
 Higher tables are not deleted when the number of tables is lowered.
 To delete a table datafile, delete it's contents and remove mark '*'.
 Combining tables saves the highest position of duplicate entries.
 When sorting by time, 'Finished' media will always be at the bottom.
 You can set media saved positions to 'hh:mm:ss' or to 'Finished'.
 'Finished' media will not update position unless reset to 'hh:mm:ss'.
 'Finished' media will remain in any table when replayed to the end.

 Non-media table entries (i.e. directories or playlists) must be played
 one at a time to avoid possible instability in VLC as they expand to
 show their contents. The saved position and bookmark are meaningless
 for these files and do not respond as expected. However, these entries
 are very useful for making convenient tables of playlists.

 The occasional user who might open two instances of Resume Media 
 in two instances of VLC must switch to different tables so that 
 the instances do not overwrite each other's tables.

 For total simplicity, change variable "simple" from false to true. 
 This will force Resume Media to use just one hidden table (table 1) 
 with no table dialog window. Then just start, stop and resume the 
 media from the VLC playlist. If you had already created other tables,
 they will still be there if you set "simple = false" again.

 Only variables 'simple' and 'filename' are changeable in the download
 file. Other settings are now adjusted in the Resume Media dialog window. 
 Window resizing takes effect when Resume Media is restarted. 
 Media positions will not update while the settings table is open.

--- Picture Adjustment ------------------------------------
Users with tv recordings that have dark bands filling in the
4:3 format might be tired of adjusting the picture with
the VLC context menu video-adjust options each time they play.
Also, changing the aspect-ratio of a boxy tv video to 16:11
can make it more appealing. There is now a Resume Media 
setting to allow a temporary change of the aspect-ratio and
crop settings in the vlcrc configuration file while a video 
is playing. These settings are saved in the table with the 
other information about the video for future plays.
* Change the picture adjustment setting in Settings to allow
manual or (semi-)automatic picture adjustment. While a video
is playing or paused, press [Play] to set the key words
RMA (aspect-ration) and/or RMC (crop) for the video and press
[Picture] to enter them. A blank entry will reset the key words.
* Press [Key List] to display and adjust the keys for the
whole table. There is one level of undo and then cancel will
reset the keys to the values before [Key List] was pressed.
* You can place key words (ex. RMA=16:11) in the file meta data
comments section. In the manual mode, Resume Media will place
these keys in the input box as a suggestion to make input
easier. In the automatic mode, the keys will be saved directly
into the table.
* Changing meta data is easier in Windows. Go to Properties>
Details>Comments. If you select a group of similar files, you
can change them all at once. Remove write-protection first.
--- Issues ----
* An extension can make real-time video adjustments and
this would be preferable. But an inconsistency has been
observed and, until this is resolved, the adjustments
will be made using the vlcrc config file settings.
* Resume Media must apply the config settings before the video
is played, so picture adjustment while playing is limited to
single selection plays initiated from any one of the Resume
Media play options. Since videos are usually long, playing
one at a time should not be an issue.
* Resume Media cannot read the video meta data unless the
video is playing, which means the video will have to start
playing once normally before automatically setting key values.
* Hand shaking with VLC is more intense in the automatic mode
since Resume Media is constantly requesting the meta data.
The greater the handshaking, the more chance for conflicts
with VLC since VLC is a very complicated program. You can
go back to manual picture update mode once meta data
keys have been transferred into the Resume Media table.
-----------------------------------------------------------

--- Fun Settings -----------------------------------------------------
* "Run time" lets you sample all media for a set number of seconds.
* "Start time" lets you start further into the media. A saved position
will override this value.
* "Playback speed" lets you, say, listen to an audio book faster or
have fun with a video, etc.

Ex. Set "Run time" to 5 or 10 and "Playback speed" to 150 to help find
that one song or piano piece out of a 100 you are looking for.
(Use saved positions combined with run-time for deep sampling.)

These settings apply to all media while Resume Media is open.
-----------------------------------------------------------------------
 
 
 Changelog
   2015-05-27 V3.23
      Correct picture key handling when table order changes.
   2015-03-13 V3.22
      The input box is now always displayed in the table dialog.
      Use input box to set picture keys, saved positions and settings.
      Picture-adjust key change only allowed when video playing.
      Setting to suppress automatic new table entry when media stops. 
   2015-03-24 V3.21
      "Playback speed" can now be set without restarting VLC
   2015-03-17 V3.20
      New setting for "start time", "run time" and "playback speed"
   2015-03-15 V3.11
      Correct picture adjustment settings altered in V3.10
   2015-03-13 V3.10
      New setting to close or hide Resume Media when 'X' clicked.
      Eliminate one second delay between button clicks.
   2014-12-29
      Settings table now has its own button in the [Play] menu.
      Allow copy as well as move when combining tables.
      Improve a few behaviors
   2014-12-23
      Display and adjust picture keys for the whole table.
   2014-12-21
      A manual update will now also update 'Finished' media
      Setting to show bookmarked table entries in list of tables.
      Advance bookmark when bookmarked media set to 'Finished'.
      Setting to allow manual or automatic picture adjustment.
   2014-12-10 V3.00
      Version 3 with simpler and safer handshaking with VLC.
      Bookmark feature added to keep track where last played.
      Play Bookmark/Unfinished/Table/Selection with Random/Loop options.
   2014-12-06
      Revert to version 2.40 due to unresolved issue in version 3.
      Main menu and other buttons improved.   
   2014-12-05 V3.00
      Bookmark and autoplay features added.
      Table can be randomized manually or in autoplay.
      Main menu and other buttons improved.
   2014-11-26
      If media is playing, clicking [Import/Play] will now do a manual 
      update of the playing position without stopping the media. 
      Improved text reading economy using patterns.
   2014-11-19
      Cosmetic changes only. Modified a few labels. More intuitive.
      'Keep Media' mark is now '*' instead of 'K'.
   2014-11-18  V2.40
      User settings (variables) are now adjusted in the dialog window.
   2014-11-11
      Removed the "instances/exclude/busy" complexity and issues, thus
      simplifying Resume Media and the dialog for the majority of users.      
   2014-11-09  V2.30
      Moved user variables to top of download file for easy adjustment.
      New variables to adjust size of table dialog window.
   2014-10-28
      Set variable "simple = true" to force a single hidden table with no
      table dialog window. Control and resume media from the VLC playlist.
   2014-10-09
      Rewind 5 seconds when resuming (adjustable variable 'rewind').
      Selection no longer needed before entering Set/Delete mode.
   2014-07-03
      Set default media-just-started to 60 rather than 30 seconds.
      Set media completed flag to 'Finished' rather than 00:00:01.
      When sorting by time, 'Finished' media will always be at the bottom.
      You can now reset media to 00:00:00 or to 'Finished.'
      'Finished' media will not update position unless reset to 00:00:00.
      'Finished' media will remain in any table when replayed to the end.
   2014-06-18
      Amend the previous update to include the case where the media is
      paused, because 'paused' is considered 'not playing'.
   2014-06-16
      If the table dialog 'Play' is clicked while media is playing, the
      media position will now update before selected entries are enqueued.
      One click can stop/enqueue or enqueue/play but not stop/enqueue/play.
   2014-06-12
      Allow media to remain in an excluded table when it completes.
      Set X=normal exclude or K=keep media with time reset to 00:00:01.
   2014-06-11
      Disallow automatic resume if Resume Media opened while media
        is playing. For some reason, the input object is nil when
        the media is stopped after this, causing the stop to be
        undetectable. So, if Media Resume is opened after a media
        has started, stop and restart the media to allow detection.
      Correct open_table function inadvertently broken in 6-9 update.
      Correct dialog update if media stopped during tables dialog.
   2014-06-09
      Refined the media detection to eliminate spurious updates.
      A few other minor improvements.
   2014-06-01
      Resume Media will now open even if all tables are busy or
      excluded. This should be very rare, but it allows recovery
      if tables are orphaned.
   2014-05-31
      Fix warning that busy tables cannot be combined
   2014-05-30
      Correct multiple-selection delete and move functions
      which were inadvertently broken in V2.20, 2014-05-25
   2014-05-25  V2.20
      Multiple table funtionality (see below) and sort ability
   2014-05-17  V2.10
      Move selected table entries to top or bottom
      Import VLC playlist to table
      Confirm delete selection
   2014-05-12  V2.00


   Uses input_changed() and meta_changed() functions called by VLC
         to capture media name and stop position 
   The reliability of this program depends on VLC calling one of
         these functions with position data when media started/stopped

--]]


-------------- many (not all) global variables ------------------------

names = {}       -- table of media metadata/file names played and stopped
times = {}       -- stopped position times of media in seconds
paths = {}       -- full file path in %-coded uri/url format
parms = {}       -- addition parameters like aspect-ratio and crop
len = 0          -- table length
filenum = 1      -- current file (table)
optns = {}       -- comma separated options in line 2 of data file
endtol = 10      -- end-of-media interval. Don't resume too close to end
infoline = "<< This file generated by 'VLC Resume Media V2.lua' >>"
begintol = 60    -- media-just-starting between 2 and 120 sec
rewind = 5       -- seconds to back-up when resuming (0 to 120 sec)
maxtables = 10   -- number of tables between 1 and 50
starttable = 1   -- starting table between 1 and maxtables
showmark = 1     -- =2 to show bookmarked media in tables list
adjustpic = 1    -- =2,3 to allow picture adjustment (see description)
closehide = 1    -- when clicking "X", 1=close 2=hide Resume Media
saveaspect = nil -- saved aspect-ratio from config file vlcrc
savecrop = nil   -- saved crop from config file vlcrc
starttime = 0    -- start-time from config file vlcrc
runtime = 0      -- run-time from config file vlcrc
playspeed = 100  -- playback speed (%) from config file vlcrc
blocknew = 1     -- 1=allow 2=block new table entry when media stops
                 -- width and height numbers are VLC units
listwidth = 7    -- dialog table width,  min  4 to max 40 
listheight = 35  -- dialog table height, min 10 to max 70   

                --   options (line 2 of file)
prevostime = 0   -- last time file closed
filelocked = 0   -- =2 means media will stay in table when finished
bookmark = ""    -- bookmark '*' at last/next media

                --   dialog modes and mode flags
normal = true      ;  setnormal = 1
modify = false     ;  setmodify = 2  
sorttn = false     ;  setsorttn = 3
movetb = false     ;  setmovetb = 4 
playmenu = false   ;  setplaymenu = 5 
dotables = false   ;  setdotables = 6
keepmode = false   ;  setkeepmode = 7
combineyn = false  ;  setcombineyn = 8
variables = false  ;  setvariables = 9
manualupd = false  ;  setmanualupd = 10
randomize = false  ;  setrandomize = 11
moremenu = false   ;  setmoremenu = 12
modparms = false   ;  setmodparms = 13

                --   dialog message labels
normallbl = "Click [Play] with no selection for more options."
setdellbl = "Set selection to 'hh:mm:ss' | 'Finished' or remove selection."
sorttnlbl = "Sort ascending or descending (toggle)"
movetblbl = "Move selection to top or bottom"
randomizelbl = "Randomize table with 'Finished' media [Mixed] in or at [Bottom]"
getplayllbl = "Import playlist . Play More menu . Play bookmark '*'"
dotableslbl = "Make a selection for [Open], [Keep Media] or [Combine]."
combineynlbl = "Combine selected tables into table "  -- add table #
tabletitle = "Tbl #    # Entries    First Entry"
btabletitle = "Tbl #    # Entries    Bookmarked Entry"
keepmodelbl = "Keep media in selected tables when finished? (marks Tbl# with '*')"
variableslbl = "Select a variable to adjust. Input is optional."
manualupdlbl = "Update playing position in table? (Stop media for play options)"
manualup2lbl = "Update position and/or picture"
modparmslbl = "Space after '=' resets that key. Blank input resets both keys."
moremenulbl = "Toggle options then click [Play]."
xcancel = "Cancel play"
xunfinished = "Play unfinished media"
xtable = "Play the whole table"
xselection = "Play the selection"
xinorder = "in order"
xrandom = "randomly"
xloop = "and loop"

                --   dialog button labels
modifylbl = "Modify"
arrangelbl = "Arrange"
sortlbl = "^ Sort v"
movelbl = "^ Move v"
randlbl = "^ Random v"
playlbl = "Play"
removelbl = "Remove"
startlbl = "Input"
finishlbl = "Finished"
yeslbl = "Yes"  ;  nolbl = "No"
positionlbl = "Position"
picturelbl = "Picture"
getsellbl = "Get Selection"
setsellbl = "Set Selection"
keylistlbl = "Key List"
cancellbl = "Cancel"
undolbl = "Undo"
toplbl = "Top"  ;  botlbl = "Bottom"
mixedlbl = "Mixed"
donelbl = "Done"
tableslbl = "Tables"
openlbl = "Open"
locklbl = "Keep Media"
alocklbl = "* Keep Media"
combinelbl = "Combine"
move2lbl = "Move" ; copylbl = "Copy"
backlbl = "Back"
namelbl = "Name"
timelbl = "Time"
increaselbl = "   >>   "  ; decreaselbl = "   <<   "
incbyonelbl = "    >    "
addvlclbl = "Add VLC"
playmorelbl = "Play More"
playmarklbl = "* Play One"
settingslbl = "Settings"
nonelbl = "^ None v"
unfinishedlbl = "^ Unfinished v"
tablelbl = "^ Table v"
selectionlbl = "^ Selection v"
inorderlbl = "^ In Order v"
randomlbl = "^ Random v"
nolooplbl = "^ No loop v"
looplbl = "^ Loop v"

---------------- It all starts here ------------------------

function activate() 

    if filename == "" then   -- did user change the file name?
      filename = vlc.config.userdatadir().."\\VLC Resume Media V2.txt"
    end
    if string.sub(filename,-4,-1) ~= ".txt" then  -- must end in .txt
      filename = filename..".txt"
    end
    filebasename = filename  -- save for table routines

    if simple then
      maxtables = 1       -- ok, only one table
      starttable = 1
    else
      get_vars()            -- get and check user variables
      vlc.config.set("start-time", starttime)
      vlc.config.set("run-time", runtime)
    end 
    filenum = starttable
    filename = getfilename(filenum)      -- load table
    read_names(false)
    make_display()                -- make table dialog window
    if simple then dlg:hide() end  -- hide the dialog in simple mode
end 

function make_display()
                          --  display dialog

    dlg = vlc.dialog("Resume Media Table "..filenum)

--        (..., i, j, k, l) = (..., left, down, width, height)

    lw = listwidth
    lh = listheight

    hiddenspacer = dlg:add_image("",lw+1,lh,1,1) -- this allows list sizing
    list = dlg:add_list(1,3,lw,lh)
    label_msg = dlg:add_label("",1,lh+3,4,1)  -- ("",1,lh+3,lw,1) 
    input    = dlg:add_text_input("",1,lh+10,4,1)
    button_1 = dlg:add_button("", click_button1,1,lh+11,1,1)
    button_2 = dlg:add_button("", click_button2,2,lh+11,1,1)
    button_3 = dlg:add_button("", click_button3,3,lh+11,1,1)
    button_4 = dlg:add_button("", click_button4,4,lh+11,1,1)
    setdlgmode(setnormal)
        -- there seems to be an issue where a click function is called twice
        -- with a single click. uses lastclicktime to slow the calling process
    lastclicktime = os.clock() 

end

------------------------- Update Functions ------------------------

-- input_changed possibly called by VLC at begin or end of playlist.

function input_changed() 
    inpt = vlc.object.input()
    if inpt == nil then return end   -- just in case
    state = "start"     --
    check_names()    
end

-- meta_changed called a bunch of times with state = 2 and several
-- times with state = 1 (near start) and only once with state = 4 (stop)

function meta_changed()  
    inpt = vlc.object.input()
    if inpt == nil then return end   -- just in case
    stst = vlc.var.get(inpt, "state") -- 1=start 4=stop
    autoupdate()    -- try to set aspect and crop from meta
--    set_vout()    -- try this in VLC 3 (see playstuff)
    rate = vlc.var.get(inpt, "rate")
    irate = playspeed/100
    if math.abs(rate - irate) > .01 then
      vlc.var.set(inpt, "rate", irate)
    end
   if stst == 1 then
      state = "start"
      check_names()
    elseif stst == 4 then
      state = "stop"
      restoreconfig()
      if manualupd then setdlgmode(setnormal) end
      check_names()
    end
end

manual = false
function manual_check(doit)       -- when [Import/Play] clicked
    inpt = vlc.object.input()  
    stat = vlc.playlist.status()
    if inpt ~= nil and (stat == "playing" or stat == "paused") then
      if doit then      -- do it or just check if playing
        state = "stop"  
        manual = true
        check_names()   -- possible update before clearing playlist
        manual = false
      end 
      return 1
    end
    return nil
end

function check_names()  -- check for playlist input changes
    if filenum == 0 then return end  -- we're in variables table
    nam = vlc.input.item():name()
    uri = vlc.input.item():uri()
    dur = vlc.input.item():duration()  -- end of media
    tim = vlc.var.get(inpt, "time") -- seconds from beginning
    fin = dur - endtol  -- end-of-media tolerance position
    if fin < begintol then -- short media
      if state == "start" then
        pos = "begin"
      else
        pos = "end"   
      end
    elseif tim < begintol then
      pos = "begin"
    elseif tim < fin then
      pos = "mid"
    else
      pos = "end"
    end
    update_table()    -- now update the current table
end

function update_table()
    idx = find_in_table(nam)  -- nil if not in table
    updatedlg = false   

  --     logic table
  --  if media  is in table and just started playing then
  --     move to saved position (that's the whole idea!!!)
  --  if media  is in table and had been playing awhile then
  --     update the saved position
  --  if media  is in table and at the end then
  --     remove from table (or reset to 00:00:01 meaning 'Finished')
  --  if media not in table and just started playing then
  --     do nothing (no need to save a new starting media)
  --  if media not in table and had been playing awhile then
  --     add the media and position to the tables

    if idx then                   -- in table?
      if state == "start" then    -- only change if starting
        if times[idx] >= 2 then   -- time=1 is media finished flag
          backoff = times[idx] - rewind
          if backoff < 0 then backoff = 0 end
          vlc.var.set(inpt, "time", backoff) -- resume!!!!!!!!
        end
        if bookmark ~= nam then
          bookmark = nam        -- update bookmark '*' in table
          updatedlg = true 
        end
      elseif (pos=="mid" and times[idx]==0) or   -- first stop update
             (pos~="end" and times[idx]>=2) or   -- other stop updates
             (manual and tim>=2) then            -- manual update
        times[idx] = tim            -- update stopped position
        updatedlg = true            -- change so update dialog 
      elseif pos == "end" then      -- keep or delete
        if times[idx] ~= 1 then     -- keep or delete
          if filelocked == 2 then   -- keep media entry (K)
            times[idx] = 1          -- 1 sec = media completed flag
          else
            table.remove(names,idx)
            table.remove(times,idx)
            table.remove(paths,idx)
            table.remove(parms,idx)
            len = len - 1
          end
        end
        findbookmark(true)          -- next media for playing   
        updatedlg = true            -- change so update dialog 
      end
    elseif (state=="stop" and pos=="mid" and blocknew==1) or 
           (manual and tim>=2) then  
      table.insert(names,1,nam)    -- add stopped name
      table.insert(times,1,tim)    -- add stopped position
      table.insert(paths,1,uri)    -- add uri/path
      table.insert(parms,1,"")     -- add empty parms
      len = len + 1       
      updatedlg = true             -- change so update dialog 
      bookmark = names[1]          -- update playing 
    end

    if updatedlg then              -- update the dialog
      filename = getfilename(filenum)
      write_names()
      list_update() 
    end
end

function find_in_table(nam)
    idx = nil
    if len > 0 then
      for i = 1, len do
        if names[i] == nam then
          idx = i
          break
        end
      end
    end
    return idx  -- nil if not in table
end

--------------------- bookmark functions ------------------

function findbookmark(inc)  -- make sure valid or move to next
    local ip = ibookmark(bookmark)
    local looped = false
    local done = allfinished()
    if len==0 then             -- empty table
      bookmark = ""
      return 
    elseif bookmark=="" or ip==0 then  
      ip = 1             -- nothing playing so point to first
    elseif state == "start"  or not inc then
      return             -- ok to bookmark starting media
    else                 -- checking the next
      ip = ip + 1
      if ip > len then
        ip = 1
        looped = true  -- we looped to top of table
      end
    end
        -- ok, now we have at least one media and a valid ip
        -- now check finished media
    if not done then         -- find next unfinished
      if times[ip]==1 then  -- finished?
        local i
        for i = 1, len do     -- oops need to find unfinished
          ip = ip + 1
          if ip > len then ip = 1 end
          if times[ip] ~= 1 then break end -- gotta be one
        end
      end
    end
    bookmark = names[ip]          -- ok we got next playing
end

function allfinished()         -- true if all media finished
    local i ; local done = true
    for i = 1, len do
      if times[i] ~= 1 then
        done = false
        break
      end
    end
    return done
end

function ibookmark(s)
    local i = find_in_table(s)
    if i then return i else return 0 end
end

function nbookmark(i)
    local n = names[i]
    if n then return n else return "" end
end

------------------------ dialog functions -------------------

function setdlgmode(flag)        -- set dialog
    if not dlg then return end
    normal = false
    modify = false
    movetb = false
    playmenu = false
    dotables = false
    combineyn = false
    sorttn = false
    keepmode = false
    variables = false
    manualupd = false
    randomize = false
    moremenu = false
    modparms = false
    if flag~=setmodparms then input:set_text("") end -- clear
    if setnormal == flag then
      normal = true
      dlg:set_title("Resume Media Table "..filenum)
      list_update()
      label_msg:set_text(normallbl)
      button_1:set_text(modifylbl)
      button_2:set_text(arrangelbl)
      button_3:set_text(playlbl)
      button_4:set_text(tableslbl)
    elseif setmodify == flag then
      modify = true
      label_msg:set_text(setdellbl)
      input:set_text("00:00:00")
      button_1:set_text(startlbl)
      button_2:set_text(finishlbl)
      button_3:set_text(removelbl)
      button_4:set_text(donelbl)
    elseif setsorttn == flag then
      sorttn = true
      label_msg:set_text(sorttnlbl )
      button_1:set_text(timelbl)
      button_2:set_text(namelbl)
      button_3:set_text(donelbl)
      button_4:set_text(sortlbl)
    elseif setmovetb == flag then
      movetb = true
      label_msg:set_text(movetblbl)
      button_1:set_text(toplbl)
      button_2:set_text(botlbl)
      button_3:set_text(donelbl)
      button_4:set_text(movelbl)
    elseif setrandomize == flag then
      randomize = true
      label_msg:set_text(randomizelbl)
      button_1:set_text(mixedlbl)
      button_2:set_text(botlbl)
      button_3:set_text(donelbl)
      button_4:set_text(randlbl)
    elseif setplaymenu == flag then
      playmenu = true
      label_msg:set_text(getplayllbl )
      button_1:set_text(addvlclbl)
      button_2:set_text(playmorelbl)
      button_3:set_text(playmarklbl)
      button_4:set_text(settingslbl)
    elseif setmoremenu == flag then
      moremenu = true
      label_msg:set_text(moremenulbl )
      button_1:set_text(unfinishedlbl)
      button_2:set_text(inorderlbl)
      button_3:set_text(nolooplbl)
      button_4:set_text(playlbl)
    elseif setdotables == flag then
      dotables = true
      dlg:set_title("Resume Media Tables (Tbl #"..filenum.." open)")
      tables_update()
      label_msg:set_text(dotableslbl)
      button_1:set_text(openlbl)
      if keeptables == 0 then
        button_2:set_text(locklbl)   -- no asterisk if no 'keep' tables
      else
        button_2:set_text(alocklbl)  -- asterisk in button label
      end
      button_3:set_text(combinelbl)
      button_4:set_text(backlbl)
    elseif setcombineyn == flag then
      combineyn = true
      label_msg:set_text(combineynlbl..filenum.." ?")
      button_1:set_text(move2lbl)
      button_2:set_text(copylbl)
      button_3:set_text(cancellbl)
      button_4:set_text("        ")
    elseif setkeepmode == flag then
      keepmode = true
      label_msg:set_text(keepmodelbl)
      button_1:set_text(yeslbl)
      button_2:set_text(nolbl)
      button_3:set_text(cancellbl)
      button_4:set_text("        ")
    elseif setvariables == flag then
      variables = true
      dlg:set_title("Resume Media Settings")
      list_update()
      label_msg:set_text(variableslbl)
      button_1:set_text(decreaselbl)
      button_2:set_text(increaselbl)
      button_3:set_text(incbyonelbl)
      button_4:set_text(donelbl)
    elseif setmodparms == flag then
      modparms = true
      parmssave = copy_var(parms)
      parms_update()
      label_msg:set_text(modparmslbl)
      button_1:set_text(getsellbl)
      button_2:set_text(setsellbl)
      button_3:set_text(cancellbl)
      button_4:set_text(donelbl)
    elseif setmanualupd == flag then
      manualupd = true
      button_1:set_text(positionlbl)
      button_4:set_text(donelbl)
      vora = vlc.input.item():stats().decoded_video -- 0=audio >0=video
      if vora == nil then vora = 0 end
      if adjustpic>1 and vora>0 then
        button_2:set_text(picturelbl)
        button_3:set_text(keylistlbl)
        makeupdatelbl()
      else
        label_msg:set_text(manualupdlbl)
        button_2:set_text("        ")
        button_3:set_text("        ")
      end  
    end
end

function makemorelabel()
    local first = (label_msg:get_text(lbl) == moremenulbl)
    local btn1 = button_1:get_text()
    local btn2 = button_2:get_text()
    local btn3 = button_3:get_text()
    local lbl = xunfinished
    if btn1 == tablelbl then lbl = xtable end
    if btn1 == selectionlbl then lbl = xselection end
    if btn2 == inorderlbl then
      lbl = lbl.." "..xinorder
    else
      lbl = lbl.." "..xrandom
    end
    if btn3 == looplbl then
      lbl = lbl.." "..xloop
    else
      lbl = lbl.." ".."once"
    end
    if btn1 == selectionlbl then
      lbl = lbl.." ".."(no selection cancels play)"
    end
    label_msg:set_text(lbl)
end

function makeupdatelbl()       -- show media keys from table/meta
    local label = manualup2lbl
    local playi = nil
    local nam = vlc.input.item():name()
    if nam then playi = find_in_table(nam) end
    local rma = nil  
    local rmc = nil  
    local crma
    local crmc
    if playi then
      rma = getparm(parms[playi],"RMA")
      rmc = getparm(parms[playi],"RMC")
    end
    if not rma then rma = "" end
    if not rmc then rmc = "" end
    label = label.." (RMA="..rma.."  RMC="..rmc..")"
    label_msg:set_text(label)
    crma, crmc = getmeta()
    if crma then rma = crma end
    if crmc then rmc = crmc end
    input:set_text("RMA="..rma.."  RMC="..rmc)
end

function click_button1()   -- Set/Delete, Yes, '00:00:00', Open
    if os.clock() - lastclicktime < .2 then return end -- no double click
    lastclicktime = os.clock()

    if normal then
      setdlgmode(setmodify)
    elseif modify then
      set_time(0)                 -- reset time to zero
    elseif sorttn then
      sort_by_time()
    elseif movetb then
      move_top()
    elseif randomize then
      randomize_table("mix")
    elseif playmenu then
      getplaylist()
      setdlgmode(setnormal)
    elseif dotables then
      if is_selection() then 
        if open_table(nil) then setdlgmode(setnormal) end
      else
        setdlgmode(setnormal)
      end
    elseif combineyn then
      combine_tables(true)
    elseif keepmode then
      lock_table(2)
    elseif variables then
      adjust_vars("dec")
    elseif manualupd then
      manual_check(true)  -- update position if media playing
    elseif moremenu then
      local button1 = button_1:get_text()
      if button1 == unfinishedlbl then
        button_1:set_text(tablelbl)
      elseif button1 == tablelbl then
        button_1:set_text(selectionlbl)
      elseif button1 == selectionlbl then
        button_1:set_text(unfinishedlbl)
      end
      makemorelabel()
      if is_selection then list_update() end -- reset selection
    elseif modparms then
      get_parms()
    end
end

function click_button2()   -- Sort/Move, No, 'Finished', Keep Media
    if os.clock() - lastclicktime < .2 then return end -- no double click
    lastclicktime = os.clock()

    if normal then
      if is_selection() then
        setdlgmode(setmovetb)
      else
        setdlgmode(setsorttn)
      end
    elseif modify then
      set_time(1)                 -- set time to 1 (finished)
    elseif sorttn then
      sort_by_name()
    elseif movetb then
      move_bottom()
    elseif randomize then
      randomize_table("bot")
    elseif playmenu then
      setdlgmode(setmoremenu)
    elseif dotables then
      if is_selection() and not (selcount == 1 and fstselidx == 0) then
        setdlgmode(setkeepmode)
      end
    elseif combineyn then
      combine_tables(false)
    elseif keepmode then
      lock_table(0)
    elseif variables then
      adjust_vars("inc")
    elseif manualupd then
      if adjustpic>1 then 
        getparminput(0)
        makeupdatelbl() 
      end
    elseif moremenu then         -- toggle looping
      local button2 = button_2:get_text()
      if button2 == inorderlbl then
        button_2:set_text(randomlbl)
      elseif button2 == randomlbl then
        button_2:set_text(inorderlbl)
      end
      makemorelabel()
    elseif modparms then
      set_parms()
    end
end    

function click_button3()   -- Import/Play, Delete, Done, Combine, Cancel
    if os.clock() - lastclicktime < .2 then return end -- no double click
    lastclicktime = os.clock()

    if normal then
      if manual_check(false) then  -- check if media playing or paused
        setdlgmode(setmanualupd) 
      elseif is_selection() then 
        playstuff()
      else
        setdlgmode(setplaymenu)
      end
    elseif playmenu then
      if manual_check(false) then  -- check if media playing or paused
        setdlgmode(setmanualupd) 
      else
        playstuff() 
        setdlgmode(setnormal)
      end
    elseif moremenu then         -- toggle looping
      local button3 = button_3:get_text()
      if button3 == nolooplbl then
        button_3:set_text(looplbl)
      elseif button3 == looplbl then
        button_3:set_text(nolooplbl)
      end
      makemorelabel()
    elseif modify then
      remove()
    elseif combineyn then
      setdlgmode(setdotables)     -- reset
    elseif dotables then
      if is_selection() and not 
        (selcount == 1 and (fstselidx == 0 or fstselidx == filenum)) then
        setdlgmode(setcombineyn)
      end
    elseif keepmode then
      setdlgmode(setdotables)  -- cancel
    elseif variables then
      adjust_vars("one")  -- increment by one
    elseif manualupd then
      if adjustpic>1 then setdlgmode(setmodparms) end
    elseif modparms then
      if button_3:get_text() == undolbl then
        parms = copy_var(parmsundo)
        button_3:set_text(cancellbl)
        parms_update()
      else   -- cancellbl
        parms = copy_var(parmssave)
        setdlgmode(setnormal)
      end
    else  -- all other modes
      setdlgmode(setnormal)
    end
end

function click_button4()  -- Tables, Done, Back
    if os.clock() - lastclicktime < .2 then return end -- no double click
    lastclicktime = os.clock()

    if normal then
      setdlgmode(setdotables)
    elseif playmenu then
      open_table(0)               -- open the settings table
      setdlgmode(setvariables)   -- we're adjusting variables
    elseif modify or dotables or modparms then
      setdlgmode(setnormal)
    elseif sorttn then
      setdlgmode(setmovetb)
    elseif movetb then
      setdlgmode(setrandomize)
    elseif randomize then
      setdlgmode(setsorttn)
    elseif variables then
      filename = getfilename(filenum)  -- should be = 0
      write_names()            -- save variables to table Vars
      filenum = filenumsave    -- load previous table
      if filenum > maxtables then filenum = 1 end  -- oops
      filename = getfilename(filenum)
      read_names(false)
      setdlgmode(setnormal)    -- back to normal
    elseif moremenu then
      if manual_check(false) then  -- check if media playing or paused
        setdlgmode(setmanualupd) 
      else
        playstuff()
        setdlgmode(setnormal)
      end
    elseif manualupd then
      setdlgmode(setnormal)
    elseif keepmode then      -- do nothing button, use for testing
      -- put test code here
      vlc.var.set(vlc.object.vout(),"aspect-ratio","16:11")  --"crop","16:9"
      msg("X")
    end
end

function list_update()           -- redisplay
    if not dlg then return end
      -- don't update in tables mode
    if dotables or keepmode or combineyn or modparms then return end
    list:clear()
    if len == 0 then return end
    if filenum == 0 then
--      local yn = {"N","Y"}
      for i = 1, len do          -- make table of settings
        t = times[i]
        v = t
--        if i==8 then v = yn[t+1] end 
        if t < 100 then v = "  "..v end
        if t < 10 then v = "  "..v end
        list:add_value(v.."\t"..names[i], i)
      end
    else
      findbookmark(false)    -- point to playing/next media   
      for i = 1, len do          -- make table of media
        t = hhmmss(times[i])
        if t == "00:00:01" then t = "Finished" end
        if ibookmark(bookmark)==i then t = t.." *  " else t = t.."    " end 
        list:add_value(t..names[i], i)
      end
    end
end

function is_selection()               -- did the user select anything?
    if not dlg then return end
    selection = list:get_selection()  -- global var used by caller
    selcount = 0
    fstselidx = 0   
    for idx, selectedItem in pairs(selection) do
      if fstselidx==0 or idx<fstselidx then fstselidx = idx end -- lowest
      selcount = selcount + 1         -- global var used by caller
    end
    return  selcount > 0
end

function close()           -- the user clicked "X" on the dialog
    if closehide == 1 then
      vlc.deactivate()     -- exit Resume Media
    elseif closehide == 2 then
      if variables then click_button4() end  -- close variable table
      dlg:hide()           -- hide the dialog for simple resume feature
    end
end

--------------------- picture functions ---------------------

function getparminput(idx)     -- save input keys to media at idx
    local str = input:get_text()
    local rma = getparm(str,"RMA")
    if rma and string.match(rma,"[^%d.:]") then rma = nil end
    local rmc = getparm(str,"RMC")
    if rmc and string.match(rmc,"[^%d.:]") then rmc = nil end
    local playi
    if idx == 0 then
      local nam = vlc.input.item():name()
      if not nam then return end   -- oops
      playi = find_in_table(nam)
      if not playi then manual_check(true) end
      playi = find_in_table(nam)    -- try again now
      if not playi then return end  -- oops
    else
      playi = idx
    end
    if rma then 
      parms[playi] = setparm(parms[playi],"RMA",rma) 
    else 
      parms[playi] = setparm(parms[playi],"RMA") 
    end
    if rmc then 
      parms[playi] = setparm(parms[playi],"RMC",rmc)
    else 
      parms[playi] = setparm(parms[playi],"RMC")
    end
end

function getmeta()     -- get keys from media meta comments
    local rma = nil
    local rmc = nil
    local comments = vlc.input.item():metas()["description"]
    if comments then
      rma = getparm(comments,"RMA")
      if rma and string.match(rma,"[^%d.:]") then rma = nil end
      rmc = getparm(comments,"RMC")
      if rmc and string.match(rmc,"[^%d.:]") then rmc = nil end
    end
    return rma, rmc
end

tryupdate = false
function autoupdate()  -- try to get keys from meta and enter in table
    if not tryupdate then return end
    local rma ; local rmc
    rma, rmc = getmeta()
    if not rma or rmc then return end
    tryupdate = false
    local nam = vlc.input.item():name()
    if not nam then return end   -- oops
    local playi = find_in_table(nam)
    if not playi then return end
    if rma then parms[playi] = setparm(parms[playi],"RMA",rma) end
    if rmc then parms[playi] = setparm(parms[playi],"RMC",rmc) end
end

function getparm(str,parm)    --  find key in string
  return string.match(str, parm.."=(%S*)")
end  

function setparm(str,parm,value)  -- update key in string or remove key
    local sstr = " "..str
    if value==nil or value=="" then    -- delete parm?
      p1, p2 = string.match(sstr, "() "..parm.."=%S*()")
      if p1 and p2 then
        return string.sub(sstr,2,p1-1)..string.sub(sstr,p2,-1)
      else
        return str     -- parm wasn't in string
      end
    else              -- change value or add parm and value
      p1, p2 = string.match(sstr, " "..parm.."()=%S*()")
      if p1 and p2 then   -- change value
        return string.sub(sstr,2,p1)..value..string.sub(sstr,p2,-1)
      else                -- add
        return str.." "..parm.."="..value
      end
    end
end

function set_parms()     -- update keys in table from input box
    local pinput
    if is_selection() then
      parmsundo = copy_var(parms)
      for idx, selectedItem in pairs(selection) do
        getparminput(idx)
      end
      parms_update()
      button_3:set_text(undolbl)
    end
    pinput = trim(input:get_text())
    if pinput=="" then input:set_text("RMA=  RMC=") end
end

function get_parms()   -- put selected table keys in input box
    local str
    if is_selection() then
      str = parms[fstselidx]
    else
      str = input:get_text()
    end
    local rma = getparm(str,"RMA")
    if not rma then rma = "" end
    local rmc = getparm(str,"RMC")
    if not rmc then rmc = "" end
    input:set_text("RMA="..rma.."  RMC="..rmc)
    parms_update()  -- reset selection
end

function restoreconfig()   -- stop messing with config file
    if saveaspect ~= nil then 
      vlc.config.set("aspect-ratio", saveaspect)
      saveaspect = nil
    end
    if savecrop ~= nil then 
      vlc.config.set("crop", savecrop)
      savecrop = nil
    end
end

function parms_update()         -- redisplay table and show keys
    if not dlg then return end
    list:clear()
    if len == 0 then return end
    for i = 1, len do          -- make table of media
      rma = getparm(parms[i],"RMA")
      if not rma then rma = "-" end
      rmc = getparm(parms[i],"RMC")
      if not rmc then rmc = "-" end
      list:add_value(rma.."\t"..rmc.."\t"..names[i], i)
    end
end

function set_vout()
    if adjustpic < 2 then return end
    vout = vlc.object.vout()
    if not vout then return end
    vlc.var.set(vout, "aspect-ratio", "")
    vlc.var.set(vout, "crop", "")
    local idx = find_in_table(vlc.input.item():name())
    if idx == nil then return end 
    local rma = getparm(parms[idx],"RMA")
    if rma then vlc.var.set(vout, "aspect-ratio", rma) end
    local rmc = getparm(parms[playidx],"RMC")
    if rmc then vlc.var.set(vout, "crop", rmc) end
end

--------------------- table operations ---------------------

function copy_var(orig)
    local orig_type = type(orig)
    local copy
    if orig_type == 'table' then
        copy = {}
        for orig_key, orig_value in pairs(orig) do
            copy[orig_key] = orig_value
        end
    else -- number, string, boolean, etc
        copy = orig
    end
    return copy
end

function remove()
    if is_selection() then
      for idx, selectedItem in pairs(selection) do
            -- search table because table altered after each delete
        nameidx = string.match(selectedItem," *()",11) -- find the name
        justname = string.sub(selectedItem,nameidx,-1) -- strip time
        i = find_in_table(justname) 
        if i then                    -- in the table?
          table.remove(names,i)
          table.remove(times,i)
          table.remove(paths,i)
          table.remove(parms,i)
          len = len - 1
        end
      end
    end
    list_update()
end

function set_time(hmsorend)
    local hms = trim(input:get_text())
    local sec = secs(hms)
    if sec == 1 then        -- 1 is the 'Finished' flag
      hms = "00:00:00"
      input:set_text(hms)
      sec = 0
    end
    local valid = (sec>0 or hms=="00:00:00")
    if is_selection() then
      for idx, selectedItem in pairs(selection) do
        if hmsorend==0 and valid then
          times[idx] = sec       -- set to input if valid
        elseif hmsorend==1 then
          times[idx] = 1         -- 1 is "Finished" flag
          if bookmark==names[idx] then findbookmark(true) end
        end
      end
    end
    if not valid then input:set_text("00:00:00") end
    list_update()
end

function getplaylist()
    for i, item in pairs(vlc.playlist.get("playlist",false).children) do
      if not find_in_table(item.name) then
        len = len + 1        -- add playlist item to table
        names[len] = item.name
        paths[len] = item.path
        times[len] = 0
        parms[len] = ""
      end 
    end
    list_update()
end

function playstuff()
    if len == 0 then return end
    local media = button_1:get_text()
    local playunfinished = (media == unfinishedlbl)
    if playunfinished and allfinished() then return end
    local playtable = (media == tablelbl)
    local playselection = (media == selectionlbl)
    local playmain = (button_3:get_text() == playlbl)
    if playmain then playselection = true end
    if playselection and not is_selection() then return end
    local playbookmark = (button_3:get_text() == playmarklbl)
    local random = (button_2:get_text() == randomlbl)
    local loop = (button_3:get_text() == looplbl)
    vlc.playlist.clear()   -- create new playlist
    playcount = 0
    for i = 1, len do  -- this way because selection table is out of order
      playi = false
      if playbookmark then
        if bookmark == names[i] then playi = true end
      elseif playunfinished then
        if times[i] ~= 1 then playi = true end
      elseif playtable then
        playi = true
      elseif playselection then
        for idx, selectedItem in pairs(selection) do
          nameidx = string.match(selectedItem," *()",11) -- find the name
          justname = string.sub(selectedItem,nameidx,-1) -- strip time
          if justname == names[i] then 
            playi = true
            break
          end
        end
      end
      if playi then
        video = { name = names[i], path = paths[i] }
        vlc.playlist.enqueue({video})
        playcount = playcount + 1
        playidx = i
      end
    end
    -- use config settings in VLC 2 to adjust picture here --
    -- try vout in VLC 3 (see set_vout in meta_changed)
    restoreconfig()
    if playcount==1 and adjustpic>1 then
      rma = getparm(parms[playidx],"RMA")
      if rma then 
        saveaspect = vlc.config.get("aspect-ratio")
        if saveaspect==nil then saveaspect = "" end
        vlc.config.set("aspect-ratio", rma)
      end
      rmc = getparm(parms[playidx],"RMC")
      if rmc then 
        savecrop = vlc.config.get("crop")
        if savecrop==nil then savecrop = "" end
        vlc.config.set("crop", rmc)
      end
      if adjustpic==3 then tryupdate = true end
    end
    -------  end of picture adjust code ---------------------
    vlc.playlist.repeat_("off")
    vlc.playlist.random("off")
    vlc.playlist.loop("off")
    if random then vlc.playlist.random() end
    if loop then vlc.playlist.loop() end
    vlc.playlist.play()
    list_update()         -- clear the selection
end

function move_top()
    local nam, tim, uri, par
    if not is_selection() then return end
    for i = len, 1, -1 do  -- this way because selection table is out of order 
      k = nil
      for idx, selectedItem in pairs(selection) do
        if idx == i then -- search table because table altered after each move
          nameidx = string.match(selectedItem," *()",11) -- find the name
          justname = string.sub(selectedItem,nameidx,-1) -- strip time
          k = find_in_table(justname) -- remove hhmmss
          break
        end
      end
      if k then
        nam = names[k]
        tim = times[k]
        uri = paths[k]
        par = parms[k]
        table.remove(names,k)
        table.remove(times,k)
        table.remove(paths,k)
        table.remove(parms,k)
        table.insert(names,1,nam)  
        table.insert(times,1,tim)  
        table.insert(paths,1,uri)  
        table.insert(parms,1,par)  
      end
    end
    list_update()
end

function move_bottom()
    local nam, tim, uri, par
    if not is_selection() then return end
    for i = 1, len do  -- this way because selection table is out of order
      k = nil
      for idx, selectedItem in pairs(selection) do
        if idx == i then -- search table because table altered after each move
          nameidx = string.match(selectedItem," *()",11) -- find the name
          justname = string.sub(selectedItem,nameidx,-1) -- strip time
          k = find_in_table(justname) -- remove hhmmss
          break
        end
      end
      if k then
        nam = names[k]
        tim = times[k]
        uri = paths[k]
        par = parms[k]
        table.remove(names,k)
        table.remove(times,k)
        table.remove(paths,k)
        table.remove(parms,k)
        table.insert(names,len,nam)  
        table.insert(times,len,tim)  
        table.insert(paths,len,uri)  
        table.insert(parms,len,par)  
      end
    end
    list_update()
end

function randomize_table(fin)
    idxs = {}
    local i
    math.randomseed(os.time())
    math.random(1,10)   -- first one doesn't seem random
    for i = 1, len do
      local idx = string.sub("000"..i,-4,-1)
      local rdm = string.sub("0000"..math.random(1,99999),-5,-1)
      idxs[i] = rdm..idx
    end
    table.sort(idxs)  
    for i = 1, len do
      idxs[i] = tonumber(string.sub(idxs[i],-4,-1))
    end
    names = sort_idxs(names,idxs,len)    
    times = sort_idxs(times,idxs,len)
    paths = sort_idxs(paths,idxs,len)
    parms = sort_idxs(parms,idxs,len)
    list_update()
    if fin == "bot" then
      move_completed()
    end  
    list_update()
end

flipflop = false
function flip_table(tbl,n)  -- allows table flipping in sort below
    if not flipflop then return tbl end
    local tmp = {}
    for i = 1, n do
      tmp[i] = tbl[n-i+1]
    end
    return tmp
end

function sort_by_name()
    idxs = flip_table(stable_sort(names,len),len) -- flip?
    flipflop = not flipflop
    names = sort_idxs(names,idxs,len)    
    times = sort_idxs(times,idxs,len)
    paths = sort_idxs(paths,idxs,len)
    parms = sort_idxs(parms,idxs,len)
    list_update()
end

function sort_by_time()
    sort_by_name()            -- to make sure subsort is ascending by name
    flipflop = not flipflop         -- reverse flip in sort_by_name
    local hms = {}
    for i=1,len do hms[i] = hhmmss(times[i]) end -- sorts better by string
    idxs = flip_table(stable_sort(hms,len),len)
    flipflop = not flipflop
    names = sort_idxs(names,idxs,len)    
    times = sort_idxs(times,idxs,len)
    paths = sort_idxs(paths,idxs,len)
    parms = sort_idxs(parms,idxs,len)
    move_completed()          -- now move finished media to the bottom
    list_update()
end

function stable_sort(tbl,n)  -- this preserves the sub-order of equal elements
    local idxs = {}
    for i = 1, n do
      idxs[i] = tbl[i]..string.sub("000"..i,-4,-1)
    end
    table.sort(idxs)  -- now we get a stable sort, then strip the indicies
    for i = 1, n do
      idxs[i] = tonumber(string.sub(idxs[i],-4,-1))
    end
    return idxs
end

function sort_idxs(tbl,idxs,n)    -- sort table based on sorted idxs
    local tmp = {}
    for i = 1, n do
      j = tonumber(idxs[i])
      if not j then j = i end     -- just in case
      if j < 1 or j > n then j = i end -- just in case
      tmp[i] = tbl[j]
    end
    return tmp
end

function move_completed()   -- move 'Finished' media to bottom
    local ntemp = {} ; local ttemp = {}
    local ptemp = {} ; local ktemp = {}
    k = 0
    for i = 1, len do       -- unfinished at top 
      if times[i] ~= 1 then
        k = k + 1
        ntemp[k] = names[i]
        ttemp[k] = times[i]
        ptemp[k] = paths[i]
        ktemp[k] = parms[i]
      end
    end
    for i = 1, len do       -- finished at bottom 
      if times[i] == 1 then
        k = k + 1
        ntemp[k] = names[i]
        ttemp[k] = times[i]
        ptemp[k] = paths[i]
        ktemp[k] = parms[i]
      end
    end
    names = ntemp
    times = ttemp
    paths = ptemp
    parms = ktemp
end   

function get_tables()      -- read the tables
    keeptables = 0         -- count the tables with '*' mark
    if filenum > 0 then    -- not first time
      filename = getfilename(filenum)
      write_names() 
    end 
    lent = maxtables
    tbllen = {}
    tblentry = {}
    tbllock = {}
    for i = 1, lent do
      filename = getfilename(i)
      read_names(false)
      if len == 0 then
        tblentry[i] = "empty"
      elseif showmark == 2 then
        tblentry[i] = bookmark
      else
        tblentry[i] = names[1]
      end
      tbllock[i] = filelocked
      if filelocked == 2 then keeptables = keeptables + 1 end
      tbllen[i] = len
    end
    if filenum > 0 then
      filename = getfilename(filenum)
      read_names()                -- restore current table
    end
end

function tables_update()          -- show tables in dialog
    if not dlg then return end
    get_tables()
    list:clear()
    if lent > 0 then 
      if showmark == 2 then
        list:add_value(btabletitle, 0)
      else  
        list:add_value(tabletitle, 0)
      end
      for i = 1, lent do
        t = i
        if i < 10 then t = "  "..i end
        if tbllock[i] == 2 then
          l = " *" 
        else       -- tbllock = 0
          l = "   "
        end
        n = tbllen[i]
        s = ""
        if n < 100 then s = "  "..s end
        if n < 10 then s = "  "..s end
        list:add_value(t..l.."\t"..s..n.."\t"..tblentry[i], i)
      end
    end
end

function open_table(num)      -- make selection the current table
    if not dlg then return nil end
    if num then
      fstselidx = num    -- we know which table to open
    else
      if not is_selection() then return nil end    -- no selection
      if selcount > 1 then return nil end          -- no multi-selection 
      if fstselidx == 0 then return nil end        -- title line
      if fstselidx == filenum then return 1 end    -- current table
    end
    get_tables()             --  refresh in case change
    tables_update()
    filename = getfilename(filenum) 
    write_names()            -- save current table
    filenumsave = filenum    -- table to restore if adjusting variables
    filenum = fstselidx
    filename = getfilename(filenum)
    read_names(false)        -- open new table
    return 1
end

function lock_table(mode)       -- set or unset 'keep' flag in tables
    if not is_selection() then return end
    if selcount == 1 and fstselidx == 0 then return end
    filename = getfilename(filenum) 
    write_names()               -- save current table
    for idx, selectedItem in pairs(selection) do
      if idx == 0 then break end
      filename = getfilename(idx)
      read_names(false)
      filelocked = mode         -- 0=normal  2=K(keep media)
      write_names()
    end
    filename = getfilename(filenum) -- restore current table
    read_names()
    setdlgmode(setdotables)
end

function combine_tables(delete)    -- move selected tables to current table
    if not dlg then return nil end
    if not is_selection() then return nil end
    if selcount == 1 and fstselidx == 0 then return nil end  -- title
    filename = getfilename(filenum) 
    write_names()              -- save current table
    tnames = {}
    ttimes = {}
    tpaths = {}
    tparms = {}
    tlen = 0
    for idx, selectedItem in pairs(selection) do
      if idx == 0 or idx == filenum then break end
      filename = getfilename(idx)
      read_names(false)        -- read each selected table
      if len > 0 then        -- add table to current table
        for i = 1, len do
          tlen = tlen + 1
          tnames[tlen] = names[i]
          ttimes[tlen] = times[i]
          tpaths[tlen] = paths[i]
          tparms[tlen] = parms[i]
        end
        if delete then
          len = 0              -- clear the selected table
          write_names()
        end  
      end
    end     
    filename = getfilename(filenum)      -- now reload current table
    read_names()
    if tlen > 0 then
      for i = 1 , tlen do
        ln = find_in_table(tnames[i])    -- check for dups
        if ln then
          if ttimes[i] > times[ln] then  -- if dup, save latest
            times[ln] = ttimes[i]
          end
        else
          len = len + 1                  -- add the selected tables
          names[len] = tnames[i]
          times[len] = ttimes[i]
          paths[len] = tpaths[i]
          parms[len] = tparms[i]
        end
      end
      write_names()              -- save
    end
    setdlgmode(setdotables)      -- don't stay in combine mode
    return 1
end

------------------- settings table functions -------------------

function get_vars()     -- get user adjustable variables
    filenum = 0
    filename = getfilename(0)
    read_names(false)
    nvars = 13           -- number of variables in table
    put_vars(len+1)     -- copy unset variables to table
    len = nvars         -- now we have the correct table
    set_vars()          -- set variables to table values
    check_vars()        -- check variables
    put_vars(1)         -- back to table
    write_names()       -- save user settings
end

function set_vars()    -- set variables to user table
    begintol = times[1]
    rewind = times[2]
    maxtables = times[3]
    starttable = times[4]
    listwidth = times[5]
    listheight = times[6]
    showmark = times[7]
    adjustpic = times[8]
    closehide = times[9]
    starttime = times[10]
    runtime = times[11]
    playspeed = times[12]
    blocknew = times[13]
end

names7 = {}
names7[1] = "Show first table entry in list of tables"
names7[2] = "Show bookmarked entry in list of tables"
names8 = {}
names8[1] = "No picture adjustments"
names8[2] = "Allow manual picture adjustments"
names8[3] = "Manual & automatic picture adjustments"
names9 = {}
names9[1] = "Clicking 'X' closes Resume Media"
names9[2] = "Clicking 'X' hides Resume Media dialog"
names13 = {}
names13[1] = "Allow new table entry when media stops"
names13[2] = "Block new table entry when media stops"
function put_vars(start)    -- copy variables to table
    if start <=  1 then times[ 1] = begintol end
    if start <=  2 then times[ 2] = rewind end
    if start <=  3 then times[ 3] = maxtables end
    if start <=  4 then times[ 4] = starttable end
    if start <=  5 then times[ 5] = listwidth end
    if start <=  6 then times[ 6] = listheight end
    if start <=  7 then times[ 7] = showmark end
    if start <=  8 then times[ 8] = adjustpic end
    if start <=  9 then times[ 9] = closehide end
    if start <= 10 then times[10] = starttime end
    if start <= 11 then times[11] = runtime end
    if start <= 12 then times[12] = playspeed end
    if start <= 13 then times[13] = blocknew end
    names[ 1] = "Media-just-started  (2 to 120 seconds)"
    names[ 2] = "Rewind when resuming  (0 to 120 seconds)"
    names[ 3] = "Number of tables  (1 to 50)"
    names[ 4] = "Starting table  (1 to number of tables)"
    names[ 5] = "Dialog window width  (4 to 40 VLC units)"
    names[ 6] = "Dialog window height  (10 to 70 VLC units)"
    names[ 7] = names7[showmark]
    names[ 8] = names8[adjustpic]
    names[ 9] = names9[closehide]
    names[10] = "Start time for all media (0 to 600 seconds)"
    names[11] = "Run time for all media (0 to 600 seconds)"
    names[12] = "Playback speed (25 to 300 percent)"
    names[13] = names13[blocknew]
    for i = 1, nvars do paths[i] = "--------" end   -- dummy paths
    for i = 1, nvars do parms[i] = "" end           -- dummy parms
end

function check_vars()          -- check user variables
    if begintol < 2 then begintol = 2 end
    if begintol > 120 then begintol = 120 end
    if rewind < 0 then rewind = 0 end  
    if rewind > 120 then rewind = 120 end  
    if maxtables < 1 then maxtables = 1 end          
    if maxtables > 50 then maxtables = 50 end       
    if starttable < 1 then starttable = 1 end
    if starttable > maxtables then starttable = maxtables end
    if listwidth < 4 then listwidth = 4 end
    if listwidth > 40 then listwidth = 40 end
    if listheight < 10 then listheight = 10 end
    if listheight > 70 then listheight = 70 end
    if showmark > 2 then showmark = 1 end
    if showmark < 1 then showmark = 2 end
    if adjustpic > 3 then adjustpic = 1 end
    if adjustpic < 1 then adjustpic = 3 end
    if adjustpic==1 then restoreconfig() end
    if closehide > 2 then closehide = 1 end
    if closehide < 1 then closehide = 2 end
    if starttime > 600 then starttime = 600 end
    if starttime < 0 then starttime = 0 end
    if currentvar==10 then vlc.config.set("start-time", starttime) end
    if runtime > 600 then runtime = 600 end
    if runtime < 0 then runtime = 0 end
    if currentvar==11 then vlc.config.set("run-time", runtime) end
    if playspeed > 300 then playspeed = 300 end
    if playspeed < 25 then playspeed = 25 end
    if blocknew > 2 then blocknew = 1 end
    if blocknew < 1 then blocknew = 2 end
end

var = {{},{},{},{},{},{},{},{},{},{},{},{},{}}
var[ 1] = {2,10,20,30,40,50,60,90,120}                -- begintol
var[ 2] = {0,5,10,15,20,30,60,90,120}                 -- rewind
var[ 3] = {1,5,10,15,20,25,30,35,40,45,50}            -- maxtables
var[ 4] = {1,5,10,15,20,25,30,35,40,45,50}            -- starttable
var[ 5] = {4,10,15,20,25,30,35,40}                    -- listwidth
var[ 6] = {10,15,20,25,30,35,40,45,50,55,60,65,70}    -- listheight
var[ 7] = {0,1,2,3}                                   -- showmark
var[ 8] = {0,1,2,3,4}                                 -- adjustpic
var[ 9] = {0,1,2,3}                                   -- closehide
var[10] = {0,60,120,180,240,300,360,420,480,540,600}  -- starttime
var[11] = {0,60,120,180,240,300,360,420,480,540,600}  -- runtime
var[12] = {25,50,75,100,125,150,175,200,225,250,275,300}  -- playspeed
var[13] = {0,1,2,3}                                   -- blocknew
varn = {9,9,11,11,8,13,4,5,4,11,11,12,4}   -- array lengths
vari = {1,1,1,1,1,1,1,1,1,5,5,5,1}         -- increment value
varmsg = {}
varmsg[ 1] = "Media-just-started allows media preview without saving position."
varmsg[ 2] = "Rewind helps you remember where you left off."
varmsg[ 3] = "Higher tables are not deleted when the number of tables is lowered."
varmsg[ 4] = "Starting table is the table opened when Resume Media is started."
varmsg[ 5] = "Window resizing takes effect when Resume Media is restarted."
varmsg[ 6] = varmsg[5]
varmsg[ 7] = "Show first table entry or bookmarked entry in list of tables."
varmsg[ 8] = "See description in download file about adjusting picture."
varmsg[ 9] = "Hide Resume Media if you want a simple resume feature."
varmsg[10] = "A saved resume time overrides start time. Default is 0."
varmsg[11] = "This allows sampling of media. Default is 0 (unlimited)."
varmsg[12] = "Play media faster or slower. Default is 100 percent."
varmsg[13] = "Blocking prevents unexpected new entries in all tables."

currentvar = 0

function adjust_vars(dir)
    if not dlg then return end

    if is_selection() then
      if selcount > 1 then      -- no multi selection
        label_msg:set_text(variableslbl)
        currentvar = 0
        return 
      else
        currentvar = fstselidx  -- selected variable
      end 
    end     
    if currentvar == 0 then return end

    local i = currentvar
    local s = trim(input:get_text())
    if s ~= "" then                 -- if input entered
      local int = integer(s)        -- in=0 when invalid
      if int~=0 or s=="0" then      -- if valid
        times[i] = int
      end
      input:set_text("")            -- clear input in any case
    elseif dir == "inc" then
      for j = 1, varn[i]-1 do
        if times[i] >= var[i][j] and times[i] < var[i][j+1] then
          times[i] = var[i][j+1]
          break
        end
      end
    elseif dir == "dec" then
        for j = 2, varn[i] do
        if times[i] > var[i][j-1] and times[i] <= var[i][j] then
          times[i] = var[i][j-1]
          break
        end
      end
    else
      times[i] = times[i] + vari[i]
    end
    set_vars()
    check_vars()    -- make any adjustments
    put_vars(1)      -- put back in table
    list_update()
    label_msg:set_text(varmsg[i])  -- help msg while adjusting

end

------------  temporary message functions to test code  -----------

msglast = "what are the odds that the first msg is this?"
firstmsg = true
function msg(s)       -- add message to dialog label for testing
    if not dlg then return end
    if firstmsg then          -- add label if first message
      label_dbg = dlg:add_label("",1,lh+6,lw,1) 
      firstmsg = false
    end
    local text = ""
    local typ = "nil"
    if s ~= nil then typ = type(s) end     -- get the parameter type
    if typ == "boolean" then
      if s then text="t" else text="f" end 
    elseif typ == "string" then
      text = trim(s)
    elseif typ == "number" then
      text = s
    else
      text = typ
    end
    msglast = s
    label_dbg:set_text(label_dbg:get_text().." "..text)  -- add
end

function msgi()                 -- reset the test label
    msg()                  -- make sure label is present
    label_dbg:set_text("") 
end

function msgl(tf)                 -- true or false msg in label
    if tf then msg("t") else msg("f") end 
end

function msgq(s)               -- msg in quotes in label
    msg("'"..tostring(s).."'")
end

function msgc(s)               -- msg only if changed
    if s ~= msglast then
      msg(s)
    end
end

------------- formatting functions (the old fashion way) --------

function secs(hhmmss)            -- "hh:mm:ss" to secs
    if string.len(hhmmss) ~= 8 then return 0 end -- oops
    if string.match(string.sub(hhmmss,3,3),"[^:;,.-/ ]") or
       string.match(string.sub(hhmmss,6,6),"[^:;,.-/ ]") then
      return 0    -- allow :;,.-/ and space as separaters
    end
    h = integer(string.sub(hhmmss,1,2))
    m = integer(string.sub(hhmmss,4,5))
    s = integer(string.sub(hhmmss,7,8))
    if h<0 or m<0 or s<0 then return 0 end          -- oops
    fsecs = s + m*60 + h*3600
return fsecs
end

function hhmmss(secs) -- secs to "hh:mm:ss"
    local seconds = integer(secs)
    if seconds < 0  then return "00:00:00" end      -- oops
    if seconds > 359999 then return "99:59:59" end  -- oops
    h = seconds/3600
    hh = math.floor(h)
    m = (h - hh) * 60
    mm = math.floor(m)
    s = (m - mm) * 60 + .5
    ss = math.floor(s)
    if hh > 99 then hh = 99 end    -- just in case
    if hh < 10 then hh = "0"..hh end
    if mm < 10 then mm = "0"..mm end
    if ss < 10 then ss = "0"..ss end
    fhhmmss = hh..":"..mm..":"..ss
return fhhmmss
end

function integer(s)   -- hoping s is integer in string format
    local num = tonumber(s)
    if num == nil then num = 0 end
    num = math.floor(num + .5)  -- ok, round to nearest integer
    if string.match(tostring(num),"[^-0123456789]") then
      return 0      -- if not an integer then set to 0
    else
      return num
    end
end

function trim(s)
  if s == nil then return "" end
  local a = s:match('^%s*()')
  local b = s:match('()%s*$', a)
  return s:sub(a,b-1)
end

------------- file input / output functions -------------------

function getfilename(tn)   -- get file name from table number
    fn = ""
    if tn == 0 then fn = " Vars" end
    if tn > 1 then fn = " "..tn-1 end
    fn = string.sub(filebasename,1,-5)..fn..".txt"
    return fn
end

function read_names(optionsonly)
    file = io.open(filename,"r") 
    if (not file) then            -- exists?
      len = 0
      prevostime = 0
      filelocked = 0
      return nil 
    end 
    len = -2
    for line in file:lines() do  -- load tables from file
      if len < 0 then   -- first two line are not part of table
        if len == -1 then 
          get_options(line)  -- comma separated options
          if optionsonly then
            file:close()
            return 0
          end
        end
        len = len + 1
      else            -- look for filename , hh:mm:ss picturekeys , uri
        c1 = nil
        c2 = nil
        for comma in string.gmatch(line,"(),") do
          c1 = c2       -- shift down to get last two commas
          c2 = comma
        end
        if not c1 then break end  -- at least two commas. commas ok in name
        len = len + 1     --  now we have  filename , time keys , path
        names[len] = trim(string.sub(line,1,c1-1))
        paths[len] = trim(string.sub(line,c2+1,-1))
        local params = trim(string.sub(line,c1+1,c2-1))
        local parlen = string.len(params)
        times[len] = secs(string.sub(params,1,8))
        params = string.sub(params,9,-1)
        parms[len] = ""
        for nextp in string.gmatch(params,"( %S+=%S*)") do
          parms[len] = parms[len]..nextp
        end 
      end
    end
    bookmark = nbookmark(idxbookmark)  -- get playing from option
    findbookmark(false)          -- set the bookmark
    file:close()
    return 1
end

function get_options(line)  -- extension options on line 2
    leno = 0
    c2 = 0
    for comma in string.gmatch(line,"(),") do
      leno = leno + 1
      c1 = c2                -- shift down
      c2 = comma
      optns[leno] = trim(string.sub(line,c1+1,c2-1)) -- extract option
    end 
    leno = leno + 1
    optns[leno] = trim(string.sub(line,c2+1,-1))     -- last option

    if leno > 0 then         --  startup dialog option 
      prevostime = integer(optns[1]) 
    else
      prevostime = 0
    end 
    if leno > 1 then         --  startup dialog option 
      filelocked = integer(optns[2]) 
      if filelocked == 1 then filelocked = 0 end  -- =1 not used anymore
    else
      filelocked = 0
    end 
    if leno > 2 then         --  startup dialog option 
      idxbookmark = integer(optns[3]) 
    else
      idxbookmark = 1
    end 
end

function write_names()
    if len == 0 and filelocked == 0 then  -- no sense saving empty file
      file = io.open(filename,"r") 
      if file then    -- nothing to save, so delete
        file:close()
        os.remove(filename)
      end
    else
      file = io.open(filename,"w")
      if file then
        file:write(infoline.."\n")   -- file descriptor
        file:write(os.time().." , "..filelocked.." , "..
                   ibookmark(bookmark).."\n")
        for i = 1, len do
          file:write(names[i].." , "..
                     hhmmss(times[i]).." "..trim(parms[i]).." , "..
                     paths[i].."\n")
        end
        file:close()
      end
    end
end

------------------ VLC Extension functions ----------------------

function descriptor()
    return {title = "Resume Media V3",
            version = "3.23",
            author = "Rocky Dotterer",
            url = "http://addons.videolan.org/content/show.php/"..
               "Resume+Media+V3?content=165231",
--          shortdesc = "Handy, all-purpose playlists",
	    description = "Handy, all-purpose tables "..
               "of media/playlists with resume positions, "..
               "video adjust, media segmenting and more.",
            capabilities = {"input-listener"}
   }
end

function deactivate()
    if filenum > 0 then
      inpt = vlc.object.input()
      if inpt ~= nil and vlc.playlist.status() == "playing" then
        state = "stop"
        check_names()  -- possible update before leaving
      end
      filename = getfilename(filenum) 
      write_names()  -- output the updated file
    end
    restoreconfig()                 -- picture settings
    vlc.config.set("start-time", 0)
    vlc.config.set("run-time", 0)
end
