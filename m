From: Aran Cox <spin@avalon.net>
Content-Transfer-Encoding: 7bit
Message-Id: <1039235299.2304.21.camel@delight>
Mime-Version: 1.0
Subject: [linux-lvm] pvdisplay/lvdisplay discrepancy
Sender: linux-lvm-admin@sistina.com
Errors-To: linux-lvm-admin@sistina.com
Reply-To: linux-lvm@sistina.com
List-Help: <mailto:linux-lvm-request@sistina.com?subject=help>
List-Post: <mailto:linux-lvm@sistina.com>
List-Subscribe: <http://lists.sistina.com/mailman/listinfo/linux-lvm>,
	<mailto:linux-lvm-request@sistina.com?subject=subscribe>
List-Unsubscribe: <http://lists.sistina.com/mailman/listinfo/linux-lvm>,
	<mailto:linux-lvm-request@sistina.com?subject=unsubscribe>
List-Archive: <http://lists.sistina.com/pipermail/linux-lvm/>
Date: Fri Dec  6 23:48:02 2002
List-Id: <linux-lvm.redhat.com>
Content-Type: text/plain; charset="us-ascii"
To: linux-lvm@sistina.com

I've discovered that pvdisplay and lvdisplay seem to disagree on the
exact location of some extents in a volume group on my system.

I am using stock 2.4.19 kernel with the lvm tools from the RPM package 
of the same name for RH7.3.

I'll show the output of the *display programs below but to summarize:
pvdisplay shows a small number of extents in /dev/main/var as being on
hde4.  lvdisplay of /dev/main/var shows them to be on sdb starting at
1064.  pvdisplay of sdb shows those extents as free.

The /dev/main/var logical volume works fine: it's mounted and I just did
a complete backup of it.  I tried moving these extents but pvmove always
fails.  (See below.)

I get the impression that the extents are really on hde4 and that
lvdisplay is wrong. (I just checked, I can pvmove other extents into
sdb:1064, but this doesn't change lvdisplays output for /dev/main/var.) 
I can only assume that something became corrupt when I was using pvmove
to shuffle some extents around recently.  I'm not sure what to do about
this but I'd like to fix it without a re-install, if anyone has any
suggestions I'd appreciate it.

Thanks,
Aran





pvdisplay -v /dev/hde4
...
   01528 /dev/main/var             00252   12525944
   01529 /dev/main/var             00253   12534136
   01530 /dev/main/var             00254   12542328
   01531 /dev/main/var             00255   12550520
   01532 /dev/main/var             00256   12558712
   01533 /dev/main/var             00257   12566904
...


lvdisplay -v /dev/main/var
...
   00252 /dev/sdb                  01064  2118       0
   00253 /dev/sdb                  01065  2558       326
   00254 /dev/sdb                  01066  2048       0
   00255 /dev/sdb                  01067  2048       0
   00256 /dev/sdb                  01068  5558       23077
   00257 /dev/sdb                  01069  2685       102
...

pvdisplay -v /dev/sdb
   01064 free
   .....
   01083 free


pvmove --verbose /dev/hde4:1528 /dev/hde2

...
pvmove -- starting to move extents away from physical volume "/dev/hde4"
pvmove -- checking for enough free physical extents in "main"
pvmove -- /dev/hde4 [PE 1528 [var [LE 252]] -> /dev/hde2 [PE 5398] [1/1]
/dev/main/group::/dev/main/var: 2104 12525944, 2102 44228984
pvmove -- ERROR "Invalid argument" copying extent from "/dev/hde4"

pvmove -- ERROR "Invalid argument" remapping
pvmove -- ERROR "pv_move(): LE of LV remap" moving physical extents


pvmove --verbose /dev/sdb:1064 /dev/hde2:
...
pvmove -- checking destination physical volume names in command line
pvmove -- ERROR: source physical extent 1064 invalid for physical volume
"/dev/sdb"
