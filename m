Received: from mx2.redhat.com (mx2.redhat.com [10.255.15.25])
	by int-mx2.corp.redhat.com (8.13.1/8.13.1) with ESMTP id l1SI7QcU021366
	for <linux-lvm@redhat.com>; Wed, 28 Feb 2007 13:07:27 -0500
Received: from nz-out-0506.google.com (nz-out-0506.google.com [64.233.162.224])
	by mx2.redhat.com (8.13.1/8.13.1) with ESMTP id l1SI7OjD011149
	for <linux-lvm@redhat.com>; Wed, 28 Feb 2007 13:07:25 -0500
Received: by nz-out-0506.google.com with SMTP id s18so235192nze
	for <linux-lvm@redhat.com>; Wed, 28 Feb 2007 10:07:24 -0800 (PST)
Message-ID: <5d25729a0702281007p381e10fas464177acaa614dc2@mail.gmail.com>
Date: Wed, 28 Feb 2007 13:07:20 -0500
From: "Nick Gyma" <nickgyma@gmail.com>
Subject: Re: [linux-lvm] Help: Mount point does not report full size of LV.
MIME-Version: 1.0
Content-Type: multipart/alternative; 
	boundary="----=_Part_43852_15138712.1172686040195"
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

------=_Part_43852_15138712.1172686040195
Content-Type: text/plain; charset=ISO-8859-1; format=flowed
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

 Thanks for the reply.  The other two disks are file system ext3.  Is it
possible to change this 3rd disk to be ext3 as well from the current state
i'm in?  and then resize to fill?

Thanks for helping.  here are the results of vgdisplay:  (the 208.31GB is
correct)

nick@ubuntu:~$ sudo vgdisplay -v
Finding all volume groups
Finding volume group "VGforMyth"
--- Volume group ---
VG Name VGforMyth
System ID
Format lvm2
Metadata Areas 3
Metadata Sequence No 5
VG Access read/write
VG Status resizable
MAX LV 0
Cur LV 1
Open LV 0
Max PV 0
Cur PV 3
Act PV 3
VG Size 208.31 GB
PE Size 64.00 MB
Total PE 3333
Alloc PE / Size 3333 / 208.31 GB
Free PE / Size 0 / 0
VG UUID C8kSGQ-rAw1-GmUi-7oKx-zatX-8D1A-bYuK35

--- Logical volume ---
LV Name /dev/VGforMyth/video
VG Name VGforMyth
LV UUID q6mYAL-6r5u-92bK-xeIc-qttc-Zmxk-00e0rS
LV Write Access read/write
LV Status available
# open 0
LV Size 208.31 GB
Current LE 3333
Segments 3
Allocation inherit
Read ahead sectors 0
Block device 253:0

--- Physical volumes ---
PV Name /dev/hda4
PV UUID 9VmJ6M-UxhP-7LRF-SAOE-ix3l-pSWe-a2ueRL
PV Status allocatable
Total PE / Free PE 950 / 0

PV Name /dev/hdb1
PV UUID tCKbgt-nBvc-r8FS-OxEd-u9XW-NiOA-00q0BI
PV Status allocatable
Total PE / Free PE 1192 / 0

PV Name /dev/hdd1
PV UUID KEBtSE-LKcc-l79g-2NSh-6VLQ-HKoG-l0zciX
PV Status allocatable
Total PE / Free PE 1191 / 0

------=_Part_43852_15138712.1172686040195
Content-Type: text/html; charset=ISO-8859-1
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

<div id="mb_0">
<div>Thanks for the reply.&nbsp; The other two disks are file system ext3.&nbsp; Is it possible to change this 3rd disk to be ext3 as well from the current state i&#39;m in?&nbsp; and then resize to fill?</div>
<div>&nbsp;</div>
<div>Thanks for&nbsp;helping.&nbsp; here are the results of vgdisplay:&nbsp; (the 208.31GB is correct)</div>
<div>&nbsp;</div>
<div>nick@ubuntu:~$ sudo vgdisplay -v<br>Finding all volume groups<br>Finding volume group &quot;VGforMyth&quot;<br>--- Volume group ---<br>VG Name VGforMyth<br>System ID <br>Format lvm2<br>Metadata Areas 3<br>Metadata Sequence No 5 
<br>VG Access read/write<br>VG Status resizable<br>MAX LV 0<br>Cur LV 1<br>Open LV 0<br>Max PV 0<br>Cur PV 3<br>Act PV 3<br>VG Size 208.31 GB<br>PE Size 64.00 MB<br>Total PE 3333<br>Alloc PE / Size 3333 / 208.31 GB<br>Free PE / Size 0 / 0 
<br>VG UUID C8kSGQ-rAw1-GmUi-7oKx-zatX-8D1A-bYuK35<br><br>--- Logical volume ---<br>LV Name /dev/VGforMyth/video<br>VG Name VGforMyth<br>LV UUID q6mYAL-6r5u-92bK-xeIc-qttc-Zmxk-00e0rS<br>LV Write Access read/write<br>LV Status available 
<br># open 0<br>LV Size 208.31 GB<br>Current LE 3333<br>Segments 3<br>Allocation inherit<br>Read ahead sectors 0<br>Block device 253:0<br><br>--- Physical volumes ---<br>PV Name /dev/hda4 <br>PV UUID 9VmJ6M-UxhP-7LRF-SAOE-ix3l-pSWe-a2ueRL 
<br>PV Status allocatable<br>Total PE / Free PE 950 / 0<br><br>PV Name /dev/hdb1 <br>PV UUID tCKbgt-nBvc-r8FS-OxEd-u9XW-NiOA-00q0BI<br>PV Status allocatable<br>Total PE / Free PE 1192 / 0<br><br>PV Name /dev/hdd1 <br>PV UUID KEBtSE-LKcc-l79g-2NSh-6VLQ-HKoG-l0zciX 
<br>PV Status allocatable<br>Total PE / Free PE 1191 / 0</div></div>

------=_Part_43852_15138712.1172686040195--
