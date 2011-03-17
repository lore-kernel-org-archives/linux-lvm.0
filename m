Received: from mx1.redhat.com (ext-mx12.extmail.prod.ext.phx2.redhat.com
	[10.5.110.17])
	by int-mx10.intmail.prod.int.phx2.redhat.com (8.14.4/8.14.4) with ESMTP
	id p2HHX9M7010808
	for <linux-lvm@redhat.com>; Thu, 17 Mar 2011 13:33:09 -0400
Received: from ciomail2.sc.gov (ciomail2.sc.gov [167.7.36.2])
	by mx1.redhat.com (8.14.4/8.14.4) with SMTP id p2HHWwxP029579
	for <linux-lvm@redhat.com>; Thu, 17 Mar 2011 13:32:59 -0400
Received: from keys.cio.sc.gov (keys.cio.sc.gov [127.0.0.1])
	by keys.cio.sc.gov (PGP Universal) with ESMTP id 8A66136585F4
	for <linux-lvm@redhat.com>; Thu, 17 Mar 2011 13:31:37 -0400 (EDT)
From: "Males, Jess" <jmales@cio.sc.gov>
Date: Thu, 17 Mar 2011 13:32:55 -0400
Message-ID: <0A03EDA0F33C5C428BFFF019C40D609E9CB74986A8@SCMBXC01.bcbad.state.sc.us>
Content-Language: en-US
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: [linux-lvm] vgexport usage
Reply-To: LVM general discussion and development <linux-lvm@redhat.com>
List-Id: LVM general discussion and development <linux-lvm.redhat.com>
List-Unsubscribe: <https://www.redhat.com/mailman/options/linux-lvm>,
	<mailto:linux-lvm-request@redhat.com?subject=unsubscribe>
List-Archive: <https://www.redhat.com/archives/linux-lvm>
List-Post: <mailto:linux-lvm@redhat.com>
List-Help: <mailto:linux-lvm-request@redhat.com?subject=help>
List-Subscribe: <https://www.redhat.com/mailman/listinfo/linux-lvm>,
	<mailto:linux-lvm-request@redhat.com?subject=subscribe>
List-Id: <linux-lvm.redhat.com>
To: "linux-lvm@redhat.com" <linux-lvm@redhat.com>

From 'man 8 vgexport':
vgexport allows you to make the inactive VolumeGroupName(s) unknown to  the  system.

By 'unknown to the system' I would expect it would not appear in vg listings such as vgs (shown below) or vgdisplay.

[root@icarus lvm]# vgcreate junk /dev/loop1 /dev/loop2 /dev/loop3
  Volume group "junk" successfully created
[root@icarus lvm]# vgs
  VG         #PV #LV #SN Attr   VSize  VFree 
  junk         3   0   0 wz--n- 48.00M 48.00M
[root@icarus lvm]# vgchange junk -a n
  0 logical volume(s) in volume group "junk" now active
[root@icarus lvm]# vgs
  VG         #PV #LV #SN Attr   VSize  VFree 
  junk         3   0   0 wz--n- 48.00M 48.00M
[root@icarus lvm]# vgexport junk
  Volume group "junk" successfully exported
[root@icarus lvm]# vgs
  VG         #PV #LV #SN Attr   VSize  VFree 
  junk         3   0   0 wzx-n- 48.00M 48.00M


However, more disturbing is that if I remove one of the disks, lvm complains about a missing item.

[root@icarus lvm]# losetup -d /dev/loop2
[root@icarus lvm]# vgs
  Couldn't find device with uuid 1gNBDl-dOqI-OQid-TIcq-8Lp2-qUa2-PwdvnB.
  VG         #PV #LV #SN Attr   VSize  VFree 
  junk         3   0   0 wzxpn- 48.00M 48.00M


Am I expecting the wrong things from this command?


Thanks,

-- Jess Males
