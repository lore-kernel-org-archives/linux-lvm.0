From: Peter.Wuestefeld@resnova.de
Subject: [linux-lvm] lvrename oddities
Message-ID: <OF47714B36.BB532552-ONC125692F.00703DF0@resnova.de>
Date: Thu, 3 Aug 2000 08:47:40 +0200
MIME-Version: 1.0
Content-Type: multipart/alternative; boundary="=_alternative 00802B5BC125692F_="
Sender: owner-linux-lvm
Errors-To: owner-linux-lvm
List-Id: <linux-lvm.redhat.com>
To: linux-lvm@msede.com

This is a multipart message in MIME format.
--=_alternative 00802B5BC125692F_=
Content-Type: text/plain; charset="us-ascii"

Hi all,

seen this already?

Systems:
2x PII/450MHz, 1G RAM, Vortex GDT RAID w/ 70G, 3c905TX, installed: SuSE 
6.4, LVM 0.8e (4/1/2000), compiled at SuSE from lvm-0.8-41.src.rpm
Dell Inspiron 7500, PIII mobile 650/500Mhz, 256M RAM, 18G, installed: SuSE 
6.4, LVM 0.8e (4/1/2000), compiled at SuSE from lvm-0.8-41.src.rpm

Actions:
umount /dev/datavg/usrnewlv
lvchange -a n /dev/datavg/usernewlv
lvrename /dev/datavg/usrnewlv /dev/datavg/usrlv
lvchange -a y /dev/datavg/usrlv
mount /dev/datavg/usrlv

Thus far everything worked o.k.
reboot:
vgscan didn't find any VGs, as a follow-on the systems came up without any 
mounted LVs (of course!)
no /etc/lvmtab, no /etc/lvmtab.d

Solution:
- vgchange -a n datavg
- mkdir /etc/lvmtab.d
- cp -p /etc/lvmconf/datavg.conf.1.old  /etc/lvmtab.d/datavg
- cp -p /etc/lvmconf/datavg.conf.1.old /etc/lvmtab
- vgcfgrestore -f /etc/lvmconf/datavg.conf.1.old -n datavg /dev/hda4
- vgchange -a y datavg (Yuppie! success!)
- mount -a 

Just worked because the root FS was on a non-LVM partition.

The old name was restored and the LV could be used again (no data was 
lost). Since that happened on the SMP production system I didn't bother 
playing around and tested on my notebook instead. Not only could I easily 
reproduce the problem,  I also got an  idea what went wrong.

The problem seems to be related to the lvchange -a y after renaming the 
LV. At least it is this what I can conclude after testing.

- lvrename without lvchange -a y did no harm; the machine rebooted 
happily.
- lvrename with lvchange worked as long as the machine was running. The FS 
could be mounted and worked on. On reboot, no /etc/lvmtab and 
/etc/lvmtab.d existed and led to the problems described above. 
- after trying the trick two times on the same LV, on shutdown a lot of 
nasty messages looped very fast (I added -v -d to vgchange in the shutdown 
script); what I could decipher were snippets like ' -322"'and ' vgname "" 
'. I had to switch off the box in order to reboot.
- on boot, vgchange was able to detect the VG and activate it. Luckily the 
recovery procedure described above worked reliably every time I used it - 
since the config files below /etc/lvmconf get rotated every time when 
there have been changes. I copied a working datavg.conf to a safe place 
and used that instead.
- trying to rename the LV again led to the situation that it could be made 
active but booting was even worse; although the VG was activated, no FS 
could be mounted (".../datavg/nnlv is not a valid block device"); in fact, 
I had to delete the LV since I couldn't get it correctly running again. It 
looks like that recovering from renaming can be done only once on a LV. 
Every time after that the LV was "NOT available" after reboot. lvchange -a 
y worked but led to the known problem.

To me it seems as if lvchange is not working correctly after an lvrename, 
rendering the config files useless. When booting, vgscan wipes out 
/etc/lvmtab.d and its contents as well as /etc/lvmtab. On creating the new 
files it stumbles over the corrupted data in /etc/lvmconf/datavg.conf and 
is unable to (re-)store them correctly.

What I'm trying to find out is if this issue is only related to SuSE 6.4 
since I seem to recall that I had that problem on a Debian 2.1 
distribution at least a year ago as well.

Since I was not able to find this issue in the list archives and I don't 
want to patch and recompile the kernel for each and every box I administer 
(there are quite a few out there now; OS migrations are also to consider 
which would lead to additional hassle in this respect as well) - what is 
the recommended solution for this problem?

Can somebody please shed some light on me?

Thanks,

Peter

Mit freundlichem Gruss/Best Regards

Peter Wuestefeld
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
--=_alternative 00802B5BC125692F_=
Content-Type: text/html; charset="us-ascii"


<br><font size=2 face="sans-serif">Hi all,</font>
<br>
<br><font size=2 face="sans-serif">seen this already?</font>
<br>
<br><font size=2 face="sans-serif">Systems:</font>
<br><font size=2 face="sans-serif">2x PII/450MHz, 1G RAM, Vortex GDT RAID w/ 70G, 3c905TX, installed: SuSE 6.4, LVM 0.8e (4/1/2000), compiled at SuSE from lvm-0.8-41.src.rpm</font>
<br><font size=2 face="sans-serif">Dell Inspiron 7500, PIII mobile 650/500Mhz, 256M RAM, 18G, installed: SuSE 6.4, LVM 0.8e (4/1/2000), compiled at SuSE from lvm-0.8-41.src.rpm</font>
<br>
<br><font size=2 face="sans-serif">Actions:</font>
<br><font size=2 face="sans-serif">umount /dev/datavg/usrnewlv</font>
<br><font size=2 face="sans-serif">lvchange -a n /dev/datavg/usernewlv</font>
<br><font size=2 face="sans-serif">lvrename /dev/datavg/usrnewlv /dev/datavg/usrlv</font>
<br><font size=2 face="sans-serif">lvchange -a y /dev/datavg/usrlv</font>
<br><font size=2 face="sans-serif">mount /dev/datavg/usrlv</font>
<br>
<br><font size=2 face="sans-serif">Thus far everything worked o.k.</font>
<br><font size=2 face="sans-serif">reboot:</font>
<br><font size=2 face="sans-serif">vgscan didn't find any VGs, as a follow-on the systems came up without any mounted LVs (of course!)</font>
<br><font size=2 face="sans-serif">no /etc/lvmtab, no /etc/lvmtab.d</font>
<br>
<br><font size=2 face="sans-serif">Solution:</font>
<br><font size=2 face="sans-serif">- vgchange -a n datavg</font>
<br><font size=2 face="sans-serif">- mkdir /etc/lvmtab.d</font>
<br><font size=2 face="sans-serif">- cp -p /etc/lvmconf/datavg.conf.1.old &nbsp;/etc/lvmtab.d/datavg</font>
<br><font size=2 face="sans-serif">- cp -p /etc/lvmconf/datavg.conf.1.old /etc/lvmtab</font>
<br><font size=2 face="sans-serif">- vgcfgrestore -f /etc/lvmconf/datavg.conf.1.old -n datavg /dev/hda4</font>
<br><font size=2 face="sans-serif">- vgchange -a y datavg (Yuppie! success!)</font>
<br><font size=2 face="sans-serif">- mount -a </font>
<br>
<br><font size=2 face="sans-serif">Just worked because the root FS was on a non-LVM partition.</font>
<br>
<br><font size=2 face="sans-serif">The old name was restored and the LV could be used again (no data was lost). Since that happened on the SMP production system I didn't bother playing around and tested on my notebook instead. Not only could I easily reproduce the problem, &nbsp;I also got an &nbsp;idea what went wrong.</font>
<br>
<br><font size=2 face="sans-serif">The problem seems to be related to the lvchange -a y after renaming the LV. At least it is this what I can conclude after testing.</font>
<br>
<br><font size=2 face="sans-serif">- lvrename without lvchange -a y did no harm; the machine rebooted happily.</font>
<br><font size=2 face="sans-serif">- lvrename with lvchange worked as long as the machine was running. The FS could be mounted and worked on. On reboot, no /etc/lvmtab and /etc/lvmtab.d existed and led to the problems described above. </font>
<br><font size=2 face="sans-serif">- after trying the trick two times on the same LV, on shutdown a lot of nasty messages looped very fast (I added -v -d to vgchange in the shutdown script); what I could decipher were snippets like ' -322&quot;'and ' vgname &quot;&quot; '. I had to switch off the box in order to reboot.</font>
<br><font size=2 face="sans-serif">- on boot, vgchange was able to detect the VG and activate it. Luckily the recovery procedure described above worked reliably every time I used it - since the config files below /etc/lvmconf get rotated every time when there have been changes. I copied a working datavg.conf to a safe place and used that instead.</font>
<br><font size=2 face="sans-serif">- trying to rename the LV again led to the situation that it could be made active but booting was even worse; although the VG was activated, no FS could be mounted (&quot;.../datavg/nnlv is not a valid block device&quot;); in fact, I had to delete the LV since I couldn't get it correctly running again. It looks like that recovering from renaming can be done only once on a LV. Every time after that the LV was &quot;NOT available&quot; after reboot. lvchange -a y worked but led to the known problem.</font>
<br>
<br><font size=2 face="sans-serif">To me it seems as if lvchange is not working correctly after an lvrename, rendering the config files useless. When booting, vgscan wipes out /etc/lvmtab.d and its contents as well as /etc/lvmtab. On creating the new files it stumbles over the corrupted data in /etc/lvmconf/datavg.conf and is unable to (re-)store them correctly.</font>
<br>
<br><font size=2 face="sans-serif">What I'm trying to find out is if this issue is only related to SuSE 6.4 since I seem to recall that I had that problem on a Debian 2.1 distribution at least a year ago as well.</font>
<br>
<br><font size=2 face="sans-serif">Since I was not able to find this issue in the list archives and I don't want to patch and recompile the kernel for each and every box I administer (there are quite a few out there now; OS migrations are also to consider which would lead to additional hassle in this respect as well) - what is the recommended solution for this problem?</font>
<br>
<br><font size=2 face="sans-serif">Can somebody please shed some light on me?</font>
<br>
<br><font size=2 face="sans-serif">Thanks,</font>
<br>
<br><font size=2 face="sans-serif">Peter</font>
<br><font size=2 face="sans-serif"><br>
Mit freundlichem Gruss/Best Regards</font>
<br>
<br><font size=2 face="sans-serif">Peter Wuestefeld<br>
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
--=_alternative 00802B5BC125692F_=--
