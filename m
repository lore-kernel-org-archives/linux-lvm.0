Received: from mx1.redhat.com (mx1.redhat.com [172.16.48.31])
	by int-mx1.corp.redhat.com (8.11.6/8.11.6) with ESMTP id k0HIcI117575
	for <linux-lvm@redhat.com>; Tue, 17 Jan 2006 13:38:18 -0500
Received: from cvo1.cvo.roguewave.com (cvo-ext.roguewave.com [12.22.36.198])
	by mx1.redhat.com (8.12.11/8.12.11) with ESMTP id k0HIcHdj005164
	for <linux-lvm@redhat.com>; Tue, 17 Jan 2006 13:38:18 -0500
Message-ID: <D486606E7AD20947BDB7E56862E04C390185A285@cvo1.cvo.roguewave.com>
From: Poul Petersen <petersp@roguewave.com>
Date: Tue, 17 Jan 2006 10:38:11 -0800
MIME-Version: 1.0
Subject: [linux-lvm] Strange reduction in Total PE upon multiple
	vgreduce+vgextend
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
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: "'linux-lvm@redhat.com'" <linux-lvm@redhat.com>

	I happened to move a physical device between a few volume groups and
then tried to do a pvmove which failed for a lack of sufficient extents.
This was quite surprising because I knew that there should be enough PEs. A
little experimentation revealed what was going on:

# pvcreate -f -M2 /dev/sd[pq]1
  Physical volume "/dev/sdp1" successfully created
  Physical volume "/dev/sdq1" successfully created

# vgcreate vg20 -s32M -M2 /dev/sdp1 /dev/sd[pq]1
  Volume group "vg20" successfully created

# vgdisplay -v vg20
<cut>
  --- Physical volumes ---
  PV Name               /dev/sdp1     
  PV UUID               6dKzli-EgUp-ChPM-Rgaj-S74F-DTd5-AkCMsW
  PV Status             allocatable
  Total PE / Free PE    469 / 469
   
  PV Name               /dev/sdq1     
  PV UUID               L2rapn-MRCZ-9bKt-4gp7-vcqa-mxZN-UBvARN
  PV Status             allocatable
  Total PE / Free PE    469 / 469

	So each physical device has 469 extents. After a vgreduce/vgextend:
   
# vgreduce vg20 /dev/sdp1 ; vgextend vg20 /dev/sdp1
  Removed "/dev/sdp1" from volume group "vg20"
  Volume group "vg20" successfully extended

# vgdisplay -v vg20
<cut>
  --- Physical volumes ---
  PV Name               /dev/sdq1     
  PV UUID               L2rapn-MRCZ-9bKt-4gp7-vcqa-mxZN-UBvARN
  PV Status             allocatable
  Total PE / Free PE    469 / 469
   
  PV Name               /dev/sdp1     
  PV UUID               6dKzli-EgUp-ChPM-Rgaj-S74F-DTd5-AkCMsW
  PV Status             allocatable
  Total PE / Free PE    468 / 468

	Notice that sdp1 now only has 468 PEs. I lose one PE everytime I
vgreduce/vgextend:
   
# vgreduce vg20 /dev/sdp1 ; vgextend vg20 /dev/sdp1
  Removed "/dev/sdp1" from volume group "vg20"
  Volume group "vg20" successfully extended
# vgreduce vg20 /dev/sdp1 ; vgextend vg20 /dev/sdp1
  Removed "/dev/sdp1" from volume group "vg20"
  Volume group "vg20" successfully extended
# vgreduce vg20 /dev/sdp1 ; vgextend vg20 /dev/sdp1
  Removed "/dev/sdp1" from volume group "vg20"
  Volume group "vg20" successfully extended
# vgdisplay -v vg20
<cut>
  --- Physical volumes ---
  PV Name               /dev/sdq1     
  PV UUID               L2rapn-MRCZ-9bKt-4gp7-vcqa-mxZN-UBvARN
  PV Status             allocatable
  Total PE / Free PE    469 / 469
   
  PV Name               /dev/sdp1     
  PV UUID               6dKzli-EgUp-ChPM-Rgaj-S74F-DTd5-AkCMsW
  PV Status             allocatable
  Total PE / Free PE    465 / 465
   
	If I recreate the PV, then I get all 469 PEs back. Is this an
expected behaviour? I'm pretty sure I did not run into this with LVM1 (we
recently upgraded). Here are my system specs:

# vgdisplay --version
  LVM version:     2.01.08 (2005-03-22)
  Library version: 1.01.02 (2005-05-17)
  Driver version:  4.4.0
# cat /etc/redhat-release 
Fedora Core release 4 (Stentz)

Thanks,

-poul
