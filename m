Message-ID: <253458D17524064C996F67C97116BF8806592C@Oscar-5.north.mcld.net>
From: "Weber, Geoffrey M." <Geoffrey.Weber@mcleodusa.com>
Subject: RE: [linux-lvm] Problems with initrd for LVM2 on 2.6.0-test8 and 
	-test9 kernels.. .
MIME-Version: 1.0
Content-Type: multipart/alternative;
	boundary="----_=_NextPart_001_01C39EFD.0A0F5F80"
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
Date: Thu Oct 30 16:54:02 2003
List-Id: <linux-lvm.redhat.com>
To: 'Luca Berra ' <bluca@comedia.it>
Cc: "''linux-lvm@sistina.com' '" <linux-lvm@sistina.com>

This message is in MIME format. Since your mail reader does not understand
this format, some or all of this message may not be legible.

------_=_NextPart_001_01C39EFD.0A0F5F80
Content-Type: text/plain;
	charset="iso-8859-1"

My apologies for not providing the information earlier... and for my mistake
in supplying the link to my initrd image.  I have been bookmarking sites
like mad and apparently chose the wrong one...

Here is my linuxrc inside the initrd image (this is the one based off of the
evms initrd I found on the web, since it seemed the most complete).

Please note that I still can't get the "/bin/ash" command to work properly,
though I'm working on it.  I did put in the /dev/tty* and /dev/pt* nodes
into the initrd image, but still no luck.  



-------- CUT --------

gweber@windforce:/tmp/test$ more linuxrc
#!/bin/sh
/bin/mount /proc
echo /sbin/modprobe > /proc/sys/kernel/modprobe
if test ! -e /dev/.devfsd ; then
        set -e
        MAJOR=$(/bin/sed -n 's/^ *\([0-9]\+\) \+misc$/\1/p' /proc/devices)
        MINOR=$(/bin/sed -n 's/^ *\([0-9]\+\) \+device-mapper$/\1/p'
/proc/misc
)
        if test -n "$MAJOR" -a -n "$MINOR" ; then
                /bin/mknod --mode=600 /dev/mapper/control c $MAJOR $MINOR
        fi
fi
/sbin/lvm vgchange --ignorelockingfailure -P -a y
/bin/ash
/bin/umount /proc

-------- CUT --------

Also note that I have tried "root=0a3f", "root=fe00", and
"root=/dev/vg00/root"... the major/minor numbers are listed here (from
/dev/hda4 "temporary install" root):

-------- CUT --------

gweber@windforce:~$ ls -l /dev/mapper
crw-------    1 root     root      10,  63 Oct 27 13:34 control
brw-------    1 root     root     254,   1 Oct 22 08:56 vg00-home
brw-------    1 root     root     254,   0 Oct 22 08:56 vg00-root
brw-------    1 root     root     254,   3 Oct 29 08:21 vg00-tmp
brw-------    1 root     root     254,   4 Oct 29 08:21 vg00-usr
brw-------    1 root     root     254,   2 Oct 29 08:21 vg00-var

-------- CUT --------

In order to (try to) make this work, I did copy all the "missing" binaries,
libs, and dev nodes into the evms initrd image.  I would supply that
listing, but it would be quite long...

Here is my menu.lst from grub.  I've been testing with grub just so that I
could enter changes at boot time instead of running "lilo" all over the
place.

-------- CUT --------

gweber@windforce:/tmp/test$ more menu.lst
# Author: Luis R. Rodriguez <mcgrof@ruslug.rutgers.edu>
# GRUB configuration example file

# Should give you an idea of how to use GRUB to dual boot

# This makes Linux the default ;) Use 1 if you want Windows as default
default=1

# This means that from now on, GRUB will parse / as (hd0,0)/
root    (hd0,3)

# Fun splashimage ;-)
# Check http://ruslug.rutgers.edu/~mcgrof/grub-images for a HOWTO
# on making GRUB splashimages.
#
# I recommend putting all GRUB splashimages in /boot/grub/images
# to not bloat the /boot/grub directory ;)
splashimage (hd0,0)/grub/images/debian_cooleye-dither.xpm.gz

# vga=xxx sets the framebuffer console to a specific resolution.
# Here is a table you can use so it can help you decide
# what resolution you want to use:
#       colour          depth   | 640x480  800x600  1024x768 1280x1024
#       256             (8bit)  |  769      771       773      775
#       32000           (15bit) |  784      787       790      793
#       65000           (16bit) |  785      788       791      794
#       16.7 Mill.      (24bit) |  786      789       792      795


# As you will see I have my kernels in /boot/kernels/
# I have found that GRUB allows for a easy-to-use structured and neat
# /boot/ directory. My /boot/ has:
# configs/ kernels/ initrds/ System.maps/ vmlinuxes/
# Looks much nicer than the bloated default /boot/ most distributions use :P

# Ugh... :( you poor thing
#title  Windows XP
#rootnoverify   (hd0,0)
# Windows 9x, ME line: chainloader+1
# WIndows XP line:
#chainloader = (hd0,0)+1

# Yay, viva gorditas
#title  Debian/X11/GNOME/GNU/etc Linux (2.4.18-bf2.4)
#kernel /boot/kernels/vmlinuz-2.4.18-bf2.4 root=/dev/hda5 console=ttys0
vga=791
title   Linux (2.6.0-lvm)
kernel  (hd0,0)/vmlinuz-2.6.0-test9-aa0.2 root=fe00 console=ttys0
initrd  (hd0,0)/initrd-gw.gz

title   Linux (2.6.0)
kernel  (hd0,0)/boot/vmlinuz-2.6.0-test9-aa0.2 root=/dev/hda4 console=ttys0
vga
=791
#initrd  (hd0,3)/boot/initrd-lvm-2.6.0-test8-aa0.1.gz

title   Linux (2.4.22-xfs)
kernel  (hd0,3)/boot/vmlinuz-2.4.22-xfs root=/dev/hda4 console=ttys0 vga=791
initrd  (hd0,3)/boot/initrd.gz


-------- CUT --------

Thanks in advance!!

    Geoff


 

-----Original Message-----
From: Luca Berra
To: Weber, Geoffrey M.
Cc: 'linux-lvm@sistina.com'
Sent: 10/30/2003 7:49 AM
Subject: Re: [linux-lvm] Problems with initrd for LVM2 on 2.6.0-test8 and
-test9 kernels.. .

On Wed, Oct 29, 2003 at 09:26:14AM -0600, Weber, Geoffrey M. wrote:
>   library).    As   soon  as  I  try  to  use  LILO  or  GRUB  with
the
>   "root=/dev/vg00/root" or "root=3f00" (device major and minor
numbers),
>   my  machine  hangs  after  "Uncompressing  Linux...  Ok,  booting
the
>   kernel.".
could you give us some more details about your setup, including actual
lines from your configuration.

>   I  have  also tried (unsuccessfully) to use an initrd image I found
on
>   the 'net at [1]http://www.comedia.it/~bluca/cooker/lvm2/

There is no initrd image at that location.
What you find there is modified Mandrake rpm to support lvm2 in Mandrake
Linux 9.2/cooker, and has not been tested with anything different than
that.

>   to  see  what  I  could find out. When trying to use the Busybox
"ash"
>   command  inside  the  modified evms initrd image, however, the
machine
>   doesn't halt and give me a shell at all but keeps booting.
i saw this problem as well, i don't know if it is caused by some device
file missing in the initrd image or what.

L.

-- 
Luca Berra -- bluca@comedia.it
        Communication Media & Services S.r.l.
 /"\
 \ /     ASCII RIBBON CAMPAIGN
  X        AGAINST HTML MAIL
 / \



NOTICE: This electronic mail transmission may contain confidential
information and is intended only for the person(s) named.  Any use, copying
or disclosure by any other person is strictly prohibited. If you have
received this transmission in error, please notify the sender via e-mail.




------_=_NextPart_001_01C39EFD.0A0F5F80
Content-Type: text/html;
	charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 3.2//EN">
<HTML>
<HEAD>
<META HTTP-EQUIV=3D"Content-Type" CONTENT=3D"text/html; =
charset=3DUS-ASCII">
<META NAME=3D"Generator" CONTENT=3D"MS Exchange Server version =
5.5.2654.45">
<TITLE>RE: [linux-lvm] Problems with initrd for LVM2 on 2.6.0-test8 and =
-test9 kernels.. .</TITLE>
</HEAD>
<BODY>

<P><FONT SIZE=3D2>My apologies for not providing the information =
earlier... and for my mistake in supplying the link to my initrd =
image.&nbsp; I have been bookmarking sites like mad and apparently =
chose the wrong one...</FONT></P>

<P><FONT SIZE=3D2>Here is my linuxrc inside the initrd image (this is =
the one based off of the evms initrd I found on the web, since it =
seemed the most complete).</FONT></P>

<P><FONT SIZE=3D2>Please note that I still can't get the =
&quot;/bin/ash&quot; command to work properly, though I'm working on =
it.&nbsp; I did put in the /dev/tty* and /dev/pt* nodes into the initrd =
image, but still no luck.&nbsp; </FONT></P>
<BR>
<BR>

<P><FONT SIZE=3D2>-------- CUT --------</FONT>
</P>

<P><FONT SIZE=3D2>gweber@windforce:/tmp/test$ more linuxrc</FONT>
<BR><FONT SIZE=3D2>#!/bin/sh</FONT>
<BR><FONT SIZE=3D2>/bin/mount /proc</FONT>
<BR><FONT SIZE=3D2>echo /sbin/modprobe &gt; =
/proc/sys/kernel/modprobe</FONT>
<BR><FONT SIZE=3D2>if test ! -e /dev/.devfsd ; then</FONT>
<BR><FONT SIZE=3D2>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; set =
-e</FONT>
<BR><FONT SIZE=3D2>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; =
MAJOR=3D$(/bin/sed -n 's/^ *\([0-9]\+\) \+misc$/\1/p' =
/proc/devices)</FONT>
<BR><FONT SIZE=3D2>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; =
MINOR=3D$(/bin/sed -n 's/^ *\([0-9]\+\) \+device-mapper$/\1/p' =
/proc/misc</FONT>
<BR><FONT SIZE=3D2>)</FONT>
<BR><FONT SIZE=3D2>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; if test =
-n &quot;$MAJOR&quot; -a -n &quot;$MINOR&quot; ; then</FONT>
<BR><FONT =
SIZE=3D2>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nb=
sp;&nbsp;&nbsp;&nbsp;&nbsp; /bin/mknod --mode=3D600 /dev/mapper/control =
c $MAJOR $MINOR</FONT>
<BR><FONT SIZE=3D2>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; fi</FONT>
<BR><FONT SIZE=3D2>fi</FONT>
<BR><FONT SIZE=3D2>/sbin/lvm vgchange --ignorelockingfailure -P -a =
y</FONT>
<BR><FONT SIZE=3D2>/bin/ash</FONT>
<BR><FONT SIZE=3D2>/bin/umount /proc</FONT>
</P>

<P><FONT SIZE=3D2>-------- CUT --------</FONT>
</P>

<P><FONT SIZE=3D2>Also note that I have tried &quot;root=3D0a3f&quot;, =
&quot;root=3Dfe00&quot;, and &quot;root=3D/dev/vg00/root&quot;... the =
major/minor numbers are listed here (from /dev/hda4 &quot;temporary =
install&quot; root):</FONT></P>

<P><FONT SIZE=3D2>-------- CUT --------</FONT>
</P>

<P><FONT SIZE=3D2>gweber@windforce:~$ ls -l /dev/mapper</FONT>
<BR><FONT SIZE=3D2>crw-------&nbsp;&nbsp;&nbsp; 1 =
root&nbsp;&nbsp;&nbsp;&nbsp; root&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; =
10,&nbsp; 63 Oct 27 13:34 control</FONT>
<BR><FONT SIZE=3D2>brw-------&nbsp;&nbsp;&nbsp; 1 =
root&nbsp;&nbsp;&nbsp;&nbsp; root&nbsp;&nbsp;&nbsp;&nbsp; =
254,&nbsp;&nbsp; 1 Oct 22 08:56 vg00-home</FONT>
<BR><FONT SIZE=3D2>brw-------&nbsp;&nbsp;&nbsp; 1 =
root&nbsp;&nbsp;&nbsp;&nbsp; root&nbsp;&nbsp;&nbsp;&nbsp; =
254,&nbsp;&nbsp; 0 Oct 22 08:56 vg00-root</FONT>
<BR><FONT SIZE=3D2>brw-------&nbsp;&nbsp;&nbsp; 1 =
root&nbsp;&nbsp;&nbsp;&nbsp; root&nbsp;&nbsp;&nbsp;&nbsp; =
254,&nbsp;&nbsp; 3 Oct 29 08:21 vg00-tmp</FONT>
<BR><FONT SIZE=3D2>brw-------&nbsp;&nbsp;&nbsp; 1 =
root&nbsp;&nbsp;&nbsp;&nbsp; root&nbsp;&nbsp;&nbsp;&nbsp; =
254,&nbsp;&nbsp; 4 Oct 29 08:21 vg00-usr</FONT>
<BR><FONT SIZE=3D2>brw-------&nbsp;&nbsp;&nbsp; 1 =
root&nbsp;&nbsp;&nbsp;&nbsp; root&nbsp;&nbsp;&nbsp;&nbsp; =
254,&nbsp;&nbsp; 2 Oct 29 08:21 vg00-var</FONT>
</P>

<P><FONT SIZE=3D2>-------- CUT --------</FONT>
</P>

<P><FONT SIZE=3D2>In order to (try to) make this work, I did copy all =
the &quot;missing&quot; binaries, libs, and dev nodes into the evms =
initrd image.&nbsp; I would supply that listing, but it would be quite =
long...</FONT></P>

<P><FONT SIZE=3D2>Here is my menu.lst from grub.&nbsp; I've been =
testing with grub just so that I could enter changes at boot time =
instead of running &quot;lilo&quot; all over the place.</FONT></P>

<P><FONT SIZE=3D2>-------- CUT --------</FONT>
</P>

<P><FONT SIZE=3D2>gweber@windforce:/tmp/test$ more menu.lst</FONT>
<BR><FONT SIZE=3D2># Author: Luis R. Rodriguez =
&lt;mcgrof@ruslug.rutgers.edu&gt;</FONT>
<BR><FONT SIZE=3D2># GRUB configuration example file</FONT>
</P>

<P><FONT SIZE=3D2># Should give you an idea of how to use GRUB to dual =
boot</FONT>
</P>

<P><FONT SIZE=3D2># This makes Linux the default ;) Use 1 if you want =
Windows as default</FONT>
<BR><FONT SIZE=3D2>default=3D1</FONT>
</P>

<P><FONT SIZE=3D2># This means that from now on, GRUB will parse / as =
(hd0,0)/</FONT>
<BR><FONT SIZE=3D2>root&nbsp;&nbsp;&nbsp; (hd0,3)</FONT>
</P>

<P><FONT SIZE=3D2># Fun splashimage ;-)</FONT>
<BR><FONT SIZE=3D2># Check <A =
HREF=3D"http://ruslug.rutgers.edu/~mcgrof/grub-images" =
TARGET=3D"_blank">http://ruslug.rutgers.edu/~mcgrof/grub-images</A> for =
a HOWTO</FONT>
<BR><FONT SIZE=3D2># on making GRUB splashimages.</FONT>
<BR><FONT SIZE=3D2>#</FONT>
<BR><FONT SIZE=3D2># I recommend putting all GRUB splashimages in =
/boot/grub/images</FONT>
<BR><FONT SIZE=3D2># to not bloat the /boot/grub directory ;)</FONT>
<BR><FONT SIZE=3D2>splashimage =
(hd0,0)/grub/images/debian_cooleye-dither.xpm.gz</FONT>
</P>

<P><FONT SIZE=3D2># vga=3Dxxx sets the framebuffer console to a =
specific resolution.</FONT>
<BR><FONT SIZE=3D2># Here is a table you can use so it can help you =
decide</FONT>
<BR><FONT SIZE=3D2># what resolution you want to use:</FONT>
<BR><FONT SIZE=3D2>#&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; =
colour&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; =
depth&nbsp;&nbsp; | 640x480&nbsp; 800x600&nbsp; 1024x768 =
1280x1024</FONT>
<BR><FONT SIZE=3D2>#&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; =
256&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nb=
sp; (8bit)&nbsp; |&nbsp; 769&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; =
771&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; =
773&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; 775</FONT>
<BR><FONT SIZE=3D2>#&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; =
32000&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; =
(15bit) |&nbsp; 784&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; =
787&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; =
790&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; 793</FONT>
<BR><FONT SIZE=3D2>#&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; =
65000&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; =
(16bit) |&nbsp; 785&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; =
788&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; =
791&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; 794</FONT>
<BR><FONT SIZE=3D2>#&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; 16.7 =
Mill.&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; (24bit) |&nbsp; =
786&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; =
789&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; =
792&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; 795</FONT>
</P>
<BR>

<P><FONT SIZE=3D2># As you will see I have my kernels in =
/boot/kernels/</FONT>
<BR><FONT SIZE=3D2># I have found that GRUB allows for a easy-to-use =
structured and neat</FONT>
<BR><FONT SIZE=3D2># /boot/ directory. My /boot/ has:</FONT>
<BR><FONT SIZE=3D2># configs/ kernels/ initrds/ System.maps/ =
vmlinuxes/</FONT>
<BR><FONT SIZE=3D2># Looks much nicer than the bloated default /boot/ =
most distributions use :P</FONT>
</P>

<P><FONT SIZE=3D2># Ugh... :( you poor thing</FONT>
<BR><FONT SIZE=3D2>#title&nbsp; Windows XP</FONT>
<BR><FONT SIZE=3D2>#rootnoverify&nbsp;&nbsp; (hd0,0)</FONT>
<BR><FONT SIZE=3D2># Windows 9x, ME line: chainloader+1</FONT>
<BR><FONT SIZE=3D2># WIndows XP line:</FONT>
<BR><FONT SIZE=3D2>#chainloader =3D (hd0,0)+1</FONT>
</P>

<P><FONT SIZE=3D2># Yay, viva gorditas</FONT>
<BR><FONT SIZE=3D2>#title&nbsp; Debian/X11/GNOME/GNU/etc Linux =
(2.4.18-bf2.4)</FONT>
<BR><FONT SIZE=3D2>#kernel /boot/kernels/vmlinuz-2.4.18-bf2.4 =
root=3D/dev/hda5 console=3Dttys0 vga=3D791</FONT>
<BR><FONT SIZE=3D2>title&nbsp;&nbsp; Linux (2.6.0-lvm)</FONT>
<BR><FONT SIZE=3D2>kernel&nbsp; (hd0,0)/vmlinuz-2.6.0-test9-aa0.2 =
root=3Dfe00 console=3Dttys0</FONT>
<BR><FONT SIZE=3D2>initrd&nbsp; (hd0,0)/initrd-gw.gz</FONT>
</P>

<P><FONT SIZE=3D2>title&nbsp;&nbsp; Linux (2.6.0)</FONT>
<BR><FONT SIZE=3D2>kernel&nbsp; (hd0,0)/boot/vmlinuz-2.6.0-test9-aa0.2 =
root=3D/dev/hda4 console=3Dttys0 vga</FONT>
<BR><FONT SIZE=3D2>=3D791</FONT>
<BR><FONT SIZE=3D2>#initrd&nbsp; =
(hd0,3)/boot/initrd-lvm-2.6.0-test8-aa0.1.gz</FONT>
</P>

<P><FONT SIZE=3D2>title&nbsp;&nbsp; Linux (2.4.22-xfs)</FONT>
<BR><FONT SIZE=3D2>kernel&nbsp; (hd0,3)/boot/vmlinuz-2.4.22-xfs =
root=3D/dev/hda4 console=3Dttys0 vga=3D791</FONT>
<BR><FONT SIZE=3D2>initrd&nbsp; (hd0,3)/boot/initrd.gz</FONT>
</P>
<BR>

<P><FONT SIZE=3D2>-------- CUT --------</FONT>
</P>

<P><FONT SIZE=3D2>Thanks in advance!!</FONT>
</P>

<P><FONT SIZE=3D2>&nbsp;&nbsp;&nbsp; Geoff</FONT>
</P>
<BR>

<P><FONT SIZE=3D2>&nbsp;</FONT>
</P>

<P><FONT SIZE=3D2>-----Original Message-----</FONT>
<BR><FONT SIZE=3D2>From: Luca Berra</FONT>
<BR><FONT SIZE=3D2>To: Weber, Geoffrey M.</FONT>
<BR><FONT SIZE=3D2>Cc: 'linux-lvm@sistina.com'</FONT>
<BR><FONT SIZE=3D2>Sent: 10/30/2003 7:49 AM</FONT>
<BR><FONT SIZE=3D2>Subject: Re: [linux-lvm] Problems with initrd for =
LVM2 on 2.6.0-test8 and -test9 kernels.. .</FONT>
</P>

<P><FONT SIZE=3D2>On Wed, Oct 29, 2003 at 09:26:14AM -0600, Weber, =
Geoffrey M. wrote:</FONT>
<BR><FONT SIZE=3D2>&gt;&nbsp;&nbsp; library).&nbsp;&nbsp;&nbsp; =
As&nbsp;&nbsp; soon&nbsp; as&nbsp; I&nbsp; try&nbsp; to&nbsp; use&nbsp; =
LILO&nbsp; or&nbsp; GRUB&nbsp; with</FONT>
<BR><FONT SIZE=3D2>the</FONT>
<BR><FONT SIZE=3D2>&gt;&nbsp;&nbsp; &quot;root=3D/dev/vg00/root&quot; =
or &quot;root=3D3f00&quot; (device major and minor</FONT>
<BR><FONT SIZE=3D2>numbers),</FONT>
<BR><FONT SIZE=3D2>&gt;&nbsp;&nbsp; my&nbsp; machine&nbsp; hangs&nbsp; =
after&nbsp; &quot;Uncompressing&nbsp; Linux...&nbsp; Ok,&nbsp; =
booting</FONT>
<BR><FONT SIZE=3D2>the</FONT>
<BR><FONT SIZE=3D2>&gt;&nbsp;&nbsp; kernel.&quot;.</FONT>
<BR><FONT SIZE=3D2>could you give us some more details about your =
setup, including actual</FONT>
<BR><FONT SIZE=3D2>lines from your configuration.</FONT>
</P>

<P><FONT SIZE=3D2>&gt;&nbsp;&nbsp; I&nbsp; have&nbsp; also tried =
(unsuccessfully) to use an initrd image I found</FONT>
<BR><FONT SIZE=3D2>on</FONT>
<BR><FONT SIZE=3D2>&gt;&nbsp;&nbsp; the 'net at [1]<A =
HREF=3D"http://www.comedia.it/~bluca/cooker/lvm2/" =
TARGET=3D"_blank">http://www.comedia.it/~bluca/cooker/lvm2/</A></FONT>
</P>

<P><FONT SIZE=3D2>There is no initrd image at that location.</FONT>
<BR><FONT SIZE=3D2>What you find there is modified Mandrake rpm to =
support lvm2 in Mandrake</FONT>
<BR><FONT SIZE=3D2>Linux 9.2/cooker, and has not been tested with =
anything different than</FONT>
<BR><FONT SIZE=3D2>that.</FONT>
</P>

<P><FONT SIZE=3D2>&gt;&nbsp;&nbsp; to&nbsp; see&nbsp; what&nbsp; =
I&nbsp; could find out. When trying to use the Busybox</FONT>
<BR><FONT SIZE=3D2>&quot;ash&quot;</FONT>
<BR><FONT SIZE=3D2>&gt;&nbsp;&nbsp; command&nbsp; inside&nbsp; =
the&nbsp; modified evms initrd image, however, the</FONT>
<BR><FONT SIZE=3D2>machine</FONT>
<BR><FONT SIZE=3D2>&gt;&nbsp;&nbsp; doesn't halt and give me a shell at =
all but keeps booting.</FONT>
<BR><FONT SIZE=3D2>i saw this problem as well, i don't know if it is =
caused by some device</FONT>
<BR><FONT SIZE=3D2>file missing in the initrd image or what.</FONT>
</P>

<P><FONT SIZE=3D2>L.</FONT>
</P>

<P><FONT SIZE=3D2>-- </FONT>
<BR><FONT SIZE=3D2>Luca Berra -- bluca@comedia.it</FONT>
<BR><FONT SIZE=3D2>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; =
Communication Media &amp; Services S.r.l.</FONT>
<BR><FONT SIZE=3D2>&nbsp;/&quot;\</FONT>
<BR><FONT SIZE=3D2>&nbsp;\ /&nbsp;&nbsp;&nbsp;&nbsp; ASCII RIBBON =
CAMPAIGN</FONT>
<BR><FONT SIZE=3D2>&nbsp; X&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; =
AGAINST HTML MAIL</FONT>
<BR><FONT SIZE=3D2>&nbsp;/ \</FONT>
</P>
<BR>
<BR>

<P><B><FONT SIZE=3D2>NOTICE: This electronic mail transmission may =
contain confidential information and is intended only for the person(s) =
named.&nbsp; Any use, copying or disclosure by any other person is =
strictly prohibited. If you have received this transmission in error, =
please notify the sender via e-mail.</FONT></B></P>
<BR>
<BR>

</BODY>
</HTML>
------_=_NextPart_001_01C39EFD.0A0F5F80--
