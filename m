From: CHUCK_MUNRO@HP-Canada-om1.om.hp.com
Date: Tue, 7 Sep 1999 19:20:48 -0400
Message-Id: <H00000fa0c3ec832@MHS>
Subject: RE: [linux-lvm] GUI-Frontend (Gnome) available/planned?
MIME-Version: 1.0
Content-Disposition: inline; filename="BDY.TXT"
Content-Transfer-Encoding: 7bit
Sender: owner-linux-lvm
Errors-To: owner-linux-lvm
List-Id: <linux-lvm.redhat.com>
Content-Type: text/plain; charset="us-ascii"; name="BDY.TXT"
To: linux-lvm@msede.com


I agree with this suggestion.

I have been using HP-UX "SAM" (System Admin Manager) for configuring LVM for 
several years.  This tool has both a GUI and a curses-based terminal interface, 
which is very helpful when operating from a text terminal or a telnet session.  
Those readers who have administered HP-UX systems have no doubt seen that this 
method is very helpful in a non-GUI environment (certainly nicer than using 
command-line stuff).

Two of my Linux servers do not have X11 installed (for security and 
simplicity), so a text forms-based LVM tool would be most welcome.

My 2 cents worth, anyway.

ChuckM

-----Original Message-----
From: heimdall@bellsouth.net [mailto:heimdall@bellsouth.net]
Sent: Tuesday, September 07, 1999 11:06 AM
To: linux-lvm@msede.com
Cc: heimdall@bellsouth.net
Subject: Re: AW: [linux-lvm] GUI-Frontend (Gnome) availiable/planed?


There may be some issues with using a web interface like SWAT for LVM.  First, 
you'd need to ensure that the security is rock solid.  Unlike SWAT, an LVM web 
server  would actually have the ability to be quite destructive, as oposed to a 
denial of service.  Also, if you were to create a web based LVM GUI, you'd want 
to take advantage of graphics to represent your PVs, VGs, LVs, which might 
preclude using Lynx.  While the LVM commands might be a bit obscure to the 
average user, would a forms menu be much less obsure without some graphical 
representation of what you're really doing?  This isn't to say a forms based 
menu wouldn't be useful, but rather that it may not be what's needed to 
introduce people to the concept of an LVM.
