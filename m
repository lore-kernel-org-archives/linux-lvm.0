From: Peter.Wuestefeld@resnova.de
Subject: Re: [linux-lvm] LVM and sw RAID1
Message-ID: <OFBD402CC0.EADC9B6D-ONC1256945.00396FA2@resnova.de>
Date: Thu, 24 Aug 2000 12:37:43 +0200
MIME-Version: 1.0
Content-Type: multipart/alternative; boundary="=_alternative 0039A33DC1256945_="
Sender: owner-linux-lvm
Errors-To: owner-linux-lvm
List-Id: <linux-lvm.redhat.com>
To: Andreas Dilger <adilger@turbolinux.com>
Cc: linux-lvm@msede.com, owner-linux-lvm@msede.com, Peter Green <pcg@gospelcom.net>

This is a multipart message in MIME format.
--=_alternative 0039A33DC1256945_=
Content-Type: text/plain; charset="us-ascii"

Hi,

I think you are trying to cure the wrong disease ;-)

> [root@dmna /root]# pvcreate -f /dev/md0
> pvcreate -- invalid partition type 0x83 for "/dev/md0" (must be 0x8e)

shows what is wrong:

try to set the partition id to 0x8e with fdisk/sfdisk/cfdisk - that should 
solve the problem.

HTH,

Peter

Mit freundlichem Gruss/Best Regards

Peter Wuestefeld
IBM Certified System Administrator AIX 4.3
IBM Certified Support Professional AIX 4.3
==================================
res nova Unternehmensberatung GmbH
                   ...aktiv in AIX
MAIL:  Ruppmannstrasse 41
       D-70565 Stuttgart, Germany
FON:   +49 711 78888 0
FAX:   +49 711 78888 99
WWW:   http://www.resnova.de
SMTP: mailto: Peter.Wuestefeld@resnova.de

Computers are useless. They can only give you answers.
        -- Pablo Picasso




Andreas Dilger <adilger@turbolinux.com>
Sent by: owner-linux-lvm@msede.com
24.08.00 02:02

 
        To:     Peter Green <pcg@gospelcom.net>
        cc:     Andreas Dilger <adilger@turbolinux.com>, linux-lvm@msede.com
        Subject:        Re: [linux-lvm] LVM and sw RAID1

Peter writes:
> [root@dmna /root]# pvcreate /dev/md0
> pvcreate -- invalid partition type 0x83 for "/dev/md0" (must be 0x8e)
> 
> [root@dmna /root]# pvcreate -f /dev/md0
> pvcreate -- invalid partition type 0x83 for "/dev/md0" (must be 0x8e)
> 
> [root@dmna /root]# pvcreate -ff /dev/md0
> pvcreate -- invalid partition type 0x83 for "/dev/md0" (must be 0x8e)

Have you tried running "pvcreate -v -d /dev/md0"?  It may be that you
get some more clues with this.  Maybe even strace of the above.  It
looks like pvcreate is not getting the correct "dev" or "rdev" from the
inode...

Cheers, Andreas
-- 
Andreas Dilger  \ "If a man ate a pound of pasta and a pound of antipasto,
                 \  would they cancel out, leaving him still hungry?"
http://www-mddsp.enel.ucalgary.ca/People/adilger/               -- Dogbert



--=_alternative 0039A33DC1256945_=
Content-Type: text/html; charset="us-ascii"


<br><font size=2 face="sans-serif">Hi,</font>
<br>
<br><font size=2 face="sans-serif">I think you are trying to cure the wrong disease ;-)</font>
<br>
<br><font size=2 face="Courier New">&gt; [root@dmna /root]# pvcreate -f /dev/md0<br>
&gt; pvcreate -- invalid partition type 0x83 for &quot;/dev/md0&quot; (must be 0x8e)</font>
<br>
<br><font size=2 face="sans-serif">shows what is wrong:</font>
<br>
<br><font size=2 face="sans-serif">try to set the partition id to 0x8e with fdisk/sfdisk/cfdisk - that should solve the problem.</font>
<br>
<br><font size=2 face="sans-serif">HTH,</font>
<br>
<br><font size=2 face="sans-serif">Peter</font>
<br><font size=2 face="sans-serif"><br>
Mit freundlichem Gruss/Best Regards</font>
<br>
<br><font size=2 face="sans-serif">Peter Wuestefeld<br>
IBM Certified System Administrator AIX 4.3<br>
IBM Certified Support Professional AIX 4.3<br>
==================================<br>
res nova Unternehmensberatung GmbH<br>
 &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; ...aktiv in AIX<br>
MAIL: &nbsp;Ruppmannstrasse 41<br>
 &nbsp; &nbsp; &nbsp; D-70565 Stuttgart, Germany<br>
FON: &nbsp; +49 711 78888 0<br>
FAX: &nbsp; +49 711 78888 99<br>
WWW: &nbsp; http://www.resnova.de<br>
SMTP: mailto: Peter.Wuestefeld@resnova.de</font>
<br>
<br><font size=2 face="sans-serif">Computers are useless. They can only give you answers.<br>
 &nbsp; &nbsp; &nbsp; &nbsp;-- Pablo Picasso</font>
<br>
<br>
<br>
<table width=100%>
<tr valign=top>
<td>
<td><font size=1 face="sans-serif"><b>Andreas Dilger &lt;adilger@turbolinux.com&gt;</b></font>
<br><font size=1 face="sans-serif">Sent by: owner-linux-lvm@msede.com</font>
<p><font size=1 face="sans-serif">24.08.00 02:02</font>
<br>
<td><font size=1 face="Arial">&nbsp; &nbsp; &nbsp; &nbsp; </font>
<br><font size=1 face="sans-serif">&nbsp; &nbsp; &nbsp; &nbsp; To: &nbsp; &nbsp; &nbsp; &nbsp;Peter Green &lt;pcg@gospelcom.net&gt;</font>
<br><font size=1 face="sans-serif">&nbsp; &nbsp; &nbsp; &nbsp; cc: &nbsp; &nbsp; &nbsp; &nbsp;Andreas Dilger &lt;adilger@turbolinux.com&gt;, linux-lvm@msede.com</font>
<br><font size=1 face="sans-serif">&nbsp; &nbsp; &nbsp; &nbsp; Subject: &nbsp; &nbsp; &nbsp; &nbsp;Re: [linux-lvm] LVM and sw RAID1</font></table>
<br>
<br><font size=2 face="Courier New">Peter writes:<br>
&gt; [root@dmna /root]# pvcreate /dev/md0<br>
&gt; pvcreate -- invalid partition type 0x83 for &quot;/dev/md0&quot; (must be 0x8e)<br>
&gt; <br>
&gt; [root@dmna /root]# pvcreate -f /dev/md0<br>
&gt; pvcreate -- invalid partition type 0x83 for &quot;/dev/md0&quot; (must be 0x8e)<br>
&gt; <br>
&gt; [root@dmna /root]# pvcreate -ff /dev/md0<br>
&gt; pvcreate -- invalid partition type 0x83 for &quot;/dev/md0&quot; (must be 0x8e)<br>
<br>
Have you tried running &quot;pvcreate -v -d /dev/md0&quot;? &nbsp;It may be that you<br>
get some more clues with this. &nbsp;Maybe even strace of the above. &nbsp;It<br>
looks like pvcreate is not getting the correct &quot;dev&quot; or &quot;rdev&quot; from the<br>
inode...<br>
<br>
Cheers, Andreas<br>
-- <br>
Andreas Dilger &nbsp;\ &quot;If a man ate a pound of pasta and a pound of antipasto,<br>
 &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; \ &nbsp;would they cancel out, leaving him still hungry?&quot;<br>
http://www-mddsp.enel.ucalgary.ca/People/adilger/ &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; -- Dogbert<br>
</font>
<br>
<br>
--=_alternative 0039A33DC1256945_=--
