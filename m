Message-ID: <20020919145709.30802.qmail@web10404.mail.yahoo.com>
From: BOIK MOON <mooasun@yahoo.com>
MIME-Version: 1.0
Content-Type: multipart/mixed; boundary="0-118757654-1032447429=:30646"
Subject: [linux-lvm] Fwd: pvcreate & pvscan error on MD device
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
Date: Thu Sep 19 10:02:54 2002
List-Id: <linux-lvm.redhat.com>
To: linux-lvm@sistina.com

--0-118757654-1032447429=:30646
Content-Type: multipart/alternative; boundary="0-1647274487-1032447429=:30646"

--0-1647274487-1032447429=:30646
Content-Type: text/plain; charset=us-ascii


 
 Note: forwarded message attached.



---------------------------------
Do you Yahoo!?
New DSL Internet Access from SBC & Yahoo!
--0-1647274487-1032447429=:30646
Content-Type: text/html; charset=us-ascii

<P> 
<P>&nbsp;Note: forwarded message attached.</P><p><br><hr size=1>Do you Yahoo!?<br>
New <a href="http://rd.yahoo.com/evt=1207/*http://sbc.yahoo.com/">DSL Internet Access</a> from SBC & Yahoo!</a>
--0-1647274487-1032447429=:30646--

--0-118757654-1032447429=:30646
Content-Type: message/rfc822

Received: from [66.127.100.114] by web10409.mail.yahoo.com via HTTP; Wed, 18 Sep 2002 20:30:59 PDT
Date: Wed, 18 Sep 2002 20:30:59 -0700 (PDT)
From: BOIK MOON <mooasun@yahoo.com>
Subject: pvcreate & pvscan error on MD device
To: linux-lvm@sistina.com
MIME-Version: 1.0
Content-Type: multipart/alternative; boundary="0-362390394-1032406259=:36370"
Content-Length: 1330

--0-362390394-1032406259=:36370
Content-Type: text/plain; charset=us-ascii

Hello, I do not have any error on PVCREATE, but
I do not have more than one MD device registred on my PVSCAN.
However, it is OK for the regular devices. Please help me, any clues?

The following are console message:

root# cat /proc/mdstat
Personalities : [linear] [raid0] [raid1] [raid5]
read_ahead 1024 sectors
md1 : active raid1 hdd4[1] hdb4[0]
      2048192 blocks [2/2] [UU]

md0 : active raid1 hdc4[1] hda4[0]
      2048192 blocks [2/2] [UU]

unused devices: <none>
root# pvcreate /dev/md1
pvcreate -- physical volume "/dev/md1" successfully created

root# pvcreate /dev/md0
pvcreate -- physical volume "/dev/md0" successfully created

root# pvscan
pvscan -- reading all physical volumes (this may take a while...)
pvscan -- inactive PV "/dev/md0"  is in no VG  [1.95 GB]
pvscan -- inactive PV "/dev/hdg4" is in no VG  [1000.12 MB]
pvscan -- inactive PV "/dev/hdh4" is in no VG  [1000.12 MB]
pvscan -- total: 3 [3.91 GB] / in use: 0 [0] / in no VG: 3 [3.91 GB]

root# pvdisplay /dev/md1
pvdisplay -- ERROR "pv_read(): pv_create_name_from_kdev_t" no VALID physical
volume "/dev/md1"


root# pvdisplay /dev/md0
pvdisplay -- "/dev/md0" is a new physical volume of 1.95 GB

root# pvdata /dev/md1
--- NEW Physical volume ---
PV Name               /dev/md1
VG Name
PV Size               1.95 GB
PV#                   0
PV Status             NOT available
Allocatable           NO
Cur LV                0
PE Size (KByte)       0
Total PE              0
Free PE               0
Allocated PE          0
PV UUID               Ke5PpL-bWgO-GTkR-E6Wt-QOzz-pRhy-cJQcPW




---------------------------------
Do you Yahoo!?
New DSL Internet Access from SBC & Yahoo!
--0-362390394-1032406259=:36370
Content-Type: text/html; charset=us-ascii

<DIV><FONT face=Arial size=2>Hello,</FONT></DIV>
<DIV><FONT face=Arial size=2></FONT>&nbsp;</DIV>
<DIV><FONT face=Arial size=2><FONT face="Times New Roman" size=3>I do not have any error on PVCREATE, but<BR>I do not have more than one MD device registred on my PVSCAN.<BR>However, it is OK for the regular devices. Please help me, any clues?<BR><BR>The following are console message:<BR><BR>root# cat /proc/mdstat<BR>Personalities : [linear] [raid0] [raid1] [raid5]<BR>read_ahead 1024 sectors<BR>md1 : active raid1 hdd4[1] hdb4[0]<BR>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; 2048192 blocks [2/2] [UU]<BR><BR>md0 : active raid1 hdc4[1] hda4[0]<BR>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; 2048192 blocks [2/2] [UU]<BR><BR>unused devices: &lt;none&gt;<BR>root# pvcreate /dev/md1<BR>pvcreate -- physical volume "/dev/md1" successfully created<BR><BR>root# pvcreate /dev/md0<BR>pvcreate -- physical volume "/dev/md0" successfully created<BR><BR>root# pvscan<BR>pvscan -- reading all physical volumes (this may take a while...)<BR>pvscan -- inactive PV "/dev/md0"&nbsp; is in no VG&nbsp; [1.95 GB]<BR>pvscan -- inactive PV "/dev/hdg4" is in no VG&nbsp; [1000.12 MB]<BR>pvscan -- inactive PV "/dev/hdh4" is in no VG&nbsp; [1000.12 MB]<BR>pvscan -- total: 3 [3.91 GB] / in use: 0 [0] / in no VG: 3 [3.91 GB]<BR><BR></FONT><FONT face="Times New Roman" size=3>root</FONT><FONT face="Times New Roman" size=3># pvdisplay /dev/md1<BR>pvdisplay -- ERROR "pv_read(): pv_create_name_from_kdev_t" no VALID physical<BR>volume "/dev/md1"<BR><BR><BR></FONT><FONT face="Times New Roman" size=3>root</FONT><FONT face="Times New Roman" size=3># pvdisplay /dev/md0<BR>pvdisplay -- "/dev/md0" is a new physical volume of 1.95 GB<BR><BR></FONT><FONT face="Times New Roman" size=3>root</FONT><FONT face="Times New Roman" size=3># pvdata /dev/md1<BR>--- NEW Physical volume ---<BR>PV Name&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; /dev/md1<BR>VG Name<BR>PV Size&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; 1.95 GB<BR>PV#&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; 0<BR>PV Status&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; NOT available<BR>Allocatable&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; NO<BR>Cur LV&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; 0<BR>PE Size (KByte)&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; 0<BR>Total PE&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; 0<BR>Free PE&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; 0<BR>Allocated PE&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; 0<BR>PV UUID&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; Ke5PpL-bWgO-GTkR-E6Wt-QOzz-pRhy-cJQcPW</FONT><BR><BR></DIV></FONT><p><br><hr size=1>Do you Yahoo!?<br>
New <a href="http://rd.yahoo.com/evt=1207/*http://sbc.yahoo.com/">DSL Internet Access</a> from SBC & Yahoo!</a>
--0-362390394-1032406259=:36370--

--0-118757654-1032447429=:30646--
