Received: from mx2.redhat.com (mx2.redhat.com [10.255.15.25])
	by int-mx2.corp.redhat.com (8.13.1/8.13.1) with ESMTP id l09IQ5gS006725
	for <linux-lvm@redhat.com>; Tue, 9 Jan 2007 13:26:05 -0500
Received: from wr-out-0506.google.com (wr-out-0506.google.com [64.233.184.231])
	by mx2.redhat.com (8.12.11.20060308/8.12.11) with ESMTP id
	l09IQ4HG000476
	for <linux-lvm@redhat.com>; Tue, 9 Jan 2007 13:26:05 -0500
Received: by wr-out-0506.google.com with SMTP id i22so39697wra
	for <linux-lvm@redhat.com>; Tue, 09 Jan 2007 10:26:04 -0800 (PST)
Message-ID: <aec22fc50701091026i3b66ec18jbd18760e59164622@mail.gmail.com>
Date: Tue, 9 Jan 2007 21:26:03 +0300
From: `VL <vl.homutov@gmail.com>
MIME-Version: 1.0
Content-Type: multipart/alternative; 
	boundary="----=_Part_75091_23096450.1168367163285"
Subject: [linux-lvm] vgscan -- ERROR "vg_read_with_pv_and_lv(): current PV"
	can't get data of volume group
Reply-To: LVM general discussion and development <linux-lvm@redhat.com>
List-Id: LVM general discussion and development <linux-lvm.redhat.com>
List-Unsubscribe: <https://www.redhat.com/mailman/listinfo/linux-lvm>,
	<mailto:linux-lvm-request@redhat.com?subject=unsubscribe>
List-Archive: <https://www.redhat.com/archives/linux-lvm>
List-Post: <mailto:linux-lvm@redhat.com>
List-Help: <mailto:linux-lvm-request@redhat.com?subject=help>
List-Subscribe: <https://www.redhat.com/mailman/listinfo/linux-lvm>,
	<mailto:linux-lvm-request@redhat.com?subject=subscribe>
List-Id: <linux-lvm.redhat.com>
To: linux-lvm@redhat.com

------=_Part_75091_23096450.1168367163285
Content-Type: text/plain; charset=ISO-8859-1; format=flowed
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

Dear ALL, <linux-lvm@redhat.com>

I have a problem with LVM volume(details below) probably after bad shutdown:

There are 2 volumes: lvm2 and lvm1 (just names, type is lvm-1). lvm2 is fine
and mounted,
and lvm1 has problems:

# pvscan
pvscan -- reading all physical volumes (this may take a while...)
pvscan -- ACTIVE   PV "/dev/sda1" of VG "lvm2" [372.56 GB / 0 free]
pvscan -- ACTIVE   PV "/dev/sdb1" of VG "lvm2" [372.56 GB / 0 free]
pvscan -- inactive PV "/dev/hdg1"  is associated to unknown VG "lvm1" (run
vgscan)
pvscan -- inactive PV "/dev/hdf1"  is associated to unknown VG "lvm1" (run
vgscan)
pvscan -- inactive PV "/dev/hdb1"  is associated to unknown VG "lvm1" (run
vgscan)
pvscan -- total: 5 [1.36 TB] / in use: 5 [1.36 TB] / in no VG: 0 [0]

# vgscan
vgscan -- reading all physical volumes (this may take a while...)
vgscan -- found active volume group "lvm2"
vgscan -- ERROR "vg_read_with_pv_and_lv(): current PV" can't get data of
volume group "lvm1" from physical volume(s)
vgscan -- "/etc/lvmtab" and "/etc/lvmtab.d" successfully created
vgscan -- WARNING: This program does not do a VGDA backup of your volume
groups

 ls -l /dev/lvm*
crw-r-----  1 root root 109, 0 2005-03-27 17:11 /dev/lvm

/dev/lvm1:
total 0
crw-r-----  1 root disk 109, 0 2007-01-05 17:14 group

/dev/lvm2:
total 0
crw-r-----  1 root disk 109, 1 2007-01-09 21:22 group
brw-rw----  1 root disk  58, 1 2007-01-09 21:22 lv2


System description:

kernel 2.4.31 vanilla
slackware-10.2.0
lvm-1.0.8-i486-1

any help will be greatly appreciated.

------=_Part_75091_23096450.1168367163285
Content-Type: text/html; charset=ISO-8859-1
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

<a onclick="return top.js.OpenExtLink(window,event,this)" href="mailto:linux-lvm@redhat.com">Dear ALL,</a><br><br>I have a problem with LVM volume(details below) probably after bad shutdown:<br><br>There are 2 volumes: lvm2 and lvm1 (just names, type is lvm-1). lvm2 is fine and mounted,
<br>and lvm1 has problems:<br><br># pvscan <br>pvscan -- reading all physical volumes (this may take a while...)<br>pvscan -- ACTIVE&nbsp;&nbsp; PV &quot;/dev/sda1&quot; of VG &quot;lvm2&quot; [372.56 GB / 0 free]<br>pvscan -- ACTIVE&nbsp;&nbsp; PV &quot;/dev/sdb1&quot; of VG &quot;lvm2&quot; [
372.56 GB / 0 free]<br>pvscan -- inactive PV &quot;/dev/hdg1&quot;&nbsp; is associated to unknown VG &quot;lvm1&quot; (run vgscan)<br>pvscan -- inactive PV &quot;/dev/hdf1&quot;&nbsp; is associated to unknown VG &quot;lvm1&quot; (run vgscan)
<br>pvscan -- inactive PV &quot;/dev/hdb1&quot;&nbsp; is associated to unknown VG &quot;lvm1&quot; (run vgscan)<br>pvscan -- total: 5 [1.36 TB] / in use: 5 [1.36 TB] / in no VG: 0 [0]<br><br># vgscan <br>vgscan -- reading all physical volumes (this may take a while...)
<br>vgscan -- found active volume group &quot;lvm2&quot;<br>vgscan -- ERROR &quot;vg_read_with_pv_and_lv(): current PV&quot; can&#39;t get data of volume group &quot;lvm1&quot; from physical volume(s)<br>vgscan -- &quot;/etc/lvmtab&quot; and &quot;/etc/lvmtab.d&quot; successfully created
<br>vgscan -- WARNING: This program does not do a VGDA backup of your volume groups<br><br>&nbsp;ls -l /dev/lvm*<br>crw-r-----&nbsp; 1 root root 109, 0 2005-03-27 17:11 /dev/lvm<br><br>/dev/lvm1:<br>total 0<br>crw-r-----&nbsp; 1 root disk 109, 0 2007-01-05 17:14 group
<br><br>/dev/lvm2:<br>total 0<br>crw-r-----&nbsp; 1 root disk 109, 1 2007-01-09 21:22 group<br>brw-rw----&nbsp; 1 root disk&nbsp; 58, 1 2007-01-09 21:22 lv2<br><br><br>System description:<br><br>kernel 2.4.31 vanilla<br>slackware-10.2.0
<br>lvm-1.0.8-i486-1<br><br>any help will be greatly appreciated.<br><br><br>

------=_Part_75091_23096450.1168367163285--
