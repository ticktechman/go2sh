JsOsaDAS1.001.00bplist00�Vscript_�// get current path of finder
var folderURL = Application("Finder").windows[0].target().url();
var folderPath = decodeURI(folderURL).replace(/^file:\/\//, '');

// check iterm2 process
var iTermProcesses = Application("System Events").processes.whose({ name: "iTerm2" });
var app = Application("iTerm");
var session = null;
var newtab = true;
if (iTermProcesses.length === 0) {
    app.activate();
	while(!app.currentWindow()) delay(0.1);
	newtab = false;
}

if(app.windows.length === 0) {
    app.createWindowWithDefaultProfile();
    newtab = false;
}
if(newtab) {
    app.currentWindow.createTabWithDefaultProfile();
}

session = app.currentWindow.currentSession();
session.write({ text: 'cd "' + folderPath + '"'});
app.activate();
                              �jscr  ��ޭ