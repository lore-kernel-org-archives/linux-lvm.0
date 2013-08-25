Received: from mx1.redhat.com (ext-mx13.extmail.prod.ext.phx2.redhat.com
	[10.5.110.18])
	by int-mx01.intmail.prod.int.phx2.redhat.com (8.13.8/8.13.8) with ESMTP
	id r7PBT0AC001831
	for <linux-lvm@redhat.com>; Sun, 25 Aug 2013 07:29:00 -0400
Received: from mout.web.de (mout.web.de [212.227.15.14])
	by mx1.redhat.com (8.14.4/8.14.4) with ESMTP id r7PBSwK4021795
	for <linux-lvm@redhat.com>; Sun, 25 Aug 2013 07:28:58 -0400
Received: from 3capp-webde-bs10.server.lan ([172.19.170.10]) by
	mriweb.server.lan (mriweb002) with ESMTP (Nemesis) id
	0MBXqq-1VNyM30lcs-00AYb3 for <linux-lvm@redhat.com>; Sun, 25 Aug 2013
	13:28:57 +0200
MIME-Version: 1.0
Message-ID: <trinity-3825ffd4-bc3f-4b3d-b3b8-b0feb9436f1f-1377430137079@3capp-webde-bs10>
From: oliver_block2@web.de
Date: Sun, 25 Aug 2013 13:28:57 +0200 (CEST)
Subject: [linux-lvm] Duplicate physical volumes
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
Content-Type: text/html; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: linux-lvm@redhat.com

<html><head></head><body><div style="font-family: Verdana;font-size: 12.0px;"><div>Dear LVM list,</div>

<div>&nbsp;</div>

<div>this is my first posting to this list and actually I am making my first experiences with LVM. The following is my situation:</div>

<div>&nbsp;</div>

<div>I had a RAID 1 consisting of /dev/sdb1 and /dev/sdc1 making /dev/md2 and used this device as a physical volume for LVM. I used this inside the volume group vg_data.</div>

<div>&nbsp;</div>

<div>Now I decided to convert this RAID 1 into a RAID 5 by &quot;adding a third and identical partition /dev/sdd1&quot;. It follows how I am going to realize this:</div>

<div>&nbsp;</div>

<div>First I removed /dev/sdc1 from /dev/md2 (the old RAID 1) leaving it in degraded state.</div>

<div>Then I created a new RAID 5, having device name /dev/md0 with a total of three disks, but running only with two disks for the moment, namely /dev/sdc1 and /dev/sdd1.</div>

<div>The plan is now to initialize /dev/md0 as a physical volume and add a volume group and logical volume on top of this. Then I would copy the data from the old RAID 1 to the new RAID 5. Finally I will remove the old RAID 1 and add the remaining device /dev/sdb1 to the new RAID 5. Then the conversion would be complete.</div>

<div>&nbsp;</div>

<div>Now the actual problem related to LVM:</div>

<div>&nbsp;</div>

<div>While trying to initialize the new /dev/md0 as a pysical volume for LVM, I get the following message:</div>

<div>&nbsp;</div>

<div>
<div># pvcreate /dev/md0<br/>
&nbsp; Incorrect metadata area header checksum on /dev/md0 at offset 3000456183808<br/>
&nbsp; Found duplicate PV LNqPKpqdtqcLkmiqHYOeeVddNYx7FDOq: using /dev/md2 not /dev/md0<br/>
&nbsp; Can&#39;t initialize physical volume &quot;/dev/md0&quot; of volume group &quot;vg_data&quot; without -ff</div>

<div>&nbsp;</div>

<div>I guess the reason is that new RAID 5 contains the data of the old disk (which was part of the RAID 1) and therefore it appears to have the same PV metadata. So I am amout to force its reinitialization.</div>

<div>&nbsp;</div>

<div>However, I looked as /dev/md2 first:</div>

<div>&nbsp;</div>

<div>
<div># pvdisplay /dev/md2<br/>
&nbsp; Found duplicate PV LNqPKpqdtqcLkmiqHYOeeVddNYx7FDOq: using /dev/md0 not /dev/md2<br/>
&nbsp; Incorrect metadata area header checksum on /dev/md0 at offset 3000456183808<br/>
&nbsp; Incorrect metadata area header checksum on /dev/md0 at offset 3000456183808<br/>
&nbsp; WARNING: Volume group vg_data is not consistent<br/>
&nbsp; --- Physical volume ---<br/>
&nbsp; PV Name&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; /dev/md0<br/>
&nbsp; VG Name&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; vg_data<br/>
&nbsp; PV Size&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; 2,73 TiB / not usable 2,81 MiB<br/>
&nbsp; Allocatable&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; yes (but full)<br/>
&nbsp; PE Size&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; 4,00 MiB<br/>
&nbsp; Total PE&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; 715364<br/>
&nbsp; Free PE&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; 0<br/>
&nbsp; Allocated PE&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; 715364<br/>
&nbsp; PV UUID&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; LNqPKp-qdtq-cLkm-iqHY-OeeV-ddNY-x7FDOq<br/>
&nbsp; &nbsp;</div>

<div>
<div><br/>
I am a bit confused that /dev/md0 appears under &quot;PV name&quot; here. I asked for /dev/md2. Why this? Does pvdisplay get confused since there are two devices with the same metadata? I have no backup of /dev/md2 (and it is difficult to create one) and therefore I have to avoid to damage /dev/md2. Can I be sure that if I run &quot;pvcreate -ff /dev/md0&quot; that /dev/md2 will not be touched?</div>

<div>&nbsp;</div>

<div>I appreciate your help, since I am a bit confused by the output of pvdisplay.</div>

<div>&nbsp;</div>

<div>Best regards</div>

<div>Oliver</div>
</div>
</div>
</div></div></body></html>
