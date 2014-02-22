Received: from mx1.redhat.com (ext-mx15.extmail.prod.ext.phx2.redhat.com
	[10.5.110.20])
	by int-mx12.intmail.prod.int.phx2.redhat.com (8.14.4/8.14.4) with ESMTP
	id s1M7EDbU023185
	for <linux-lvm@redhat.com>; Sat, 22 Feb 2014 02:14:13 -0500
Received: from mail-pa0-f44.google.com (mail-pa0-f44.google.com
	[209.85.220.44])
	by mx1.redhat.com (8.14.4/8.14.4) with ESMTP id s1M7EBEo000416
	for <linux-lvm@redhat.com>; Sat, 22 Feb 2014 02:14:11 -0500
Received: by mail-pa0-f44.google.com with SMTP id kq14so4419607pab.31
	for <linux-lvm@redhat.com>; Fri, 21 Feb 2014 23:14:11 -0800 (PST)
Date: Fri, 21 Feb 2014 23:14:08 -0800
From: Julie Ashworth <ashworth@berkeley.edu>
Message-ID: <20140222071408.GA10598@localhost.localdomain>
MIME-Version: 1.0
Content-Disposition: inline
Subject: [linux-lvm] LV mirror extents on same physical device
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
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: linux-lvm@redhat.com

hi all,

just some background...
I installed a CentOS5 server in 2010 with a mdadm RAID1 containing 2 partitions (/dev/sda1 and /dev/sdb1). /dev/sda1 failed, and unfortuately, the mirror failed to sync with a new drive.

On this RAID1, I have one VG (VolGroup00) with 5 LVs.

I contacted the folks on the mdadm mailing list. The data on /dev/sdb is good, so they recommended that I convert the linear LVs to mirrors (to copy the data to a new drive).

I formatted a new drive (/dev/sde) identical to /dev/sd[ab], added it to a mdadm device (/dev/md2), which I then added to my VG:
mdadm --create --level=1 -n 2 /dev/md2 /dev/sde2 missing
pvcreate /dev/md2
vgextend VolGroup00 /dev/md2

I then converted all my volumes to mirrors:
lvconvert -m1 --mirrorlog=mirrored --alloc=anywhere /dev/VolGroup00/srvlv
lvconvert -m1 --mirrorlog=mirrored --alloc=anywhere /dev/VolGroup00/rootlv
lvconvert -m1 --mirrorlog=mirrored --alloc=anywhere /dev/VolGroup00/swaplv
lvconvert -m1 --mirrorlog=mirrored --alloc=anywhere /dev/VolGroup00/varlv
lvconvert -m1 --mirrorlog=mirrored --alloc=anywhere /dev/VolGroup00/tmplv

(in case you're wondering, when this completed, I added /dev/sda1 to /dev/md2, so /dev/md2 is a fuctional mdadm RAID1).

Now... the problem ;)....

When I run 'lvs' I see that the LV mirror extents were created on the same device (/dev/md1):

# lvs -a -o +devices 
LV                     VG         Attr   LSize  Origin Snap%  Move Log         Copy%  Convert Devices                                        
rootlv                 VolGroup00 mwi-ao 10.00G                    rootlv_mlog 100.00         rootlv_mimage_0(0),rootlv_mimage_1(0)          
[rootlv_mimage_0]      VolGroup00 iwi-ao 10.00G                                               /dev/md1(0)                                    
[rootlv_mimage_1]      VolGroup00 iwi-ao 10.00G                                               /dev/md1(4036)                                 
[rootlv_mlog]          VolGroup00 mwa-ao 32.00M                                100.00         rootlv_mlog_mimage_0(0),rootlv_mlog_mimage_1(0)
[rootlv_mlog_mimage_0] VolGroup00 iwi-ao 32.00M                                               /dev/md2(4)                                    
[rootlv_mlog_mimage_1] VolGroup00 iwi-ao 32.00M                                               /dev/md1(4356)      


My long-term goal is to convert the mirror back to a linear volume using just /dev/md2, i.e.
lvconvert -m0 /dev/VolGroup00/rootlv /dev/md1
lvconvert -m0 /dev/VolGroup00/swaplv /dev/md1
lvconvert -m0 /dev/VolGroup00/srvlv /dev/md1
lvconvert -m0 /dev/VolGroup00/varlv /dev/md1
lvconvert -m0 /dev/VolGroup00/tmplv /dev/md1

... so it seems problematic that both extents are on /dev/md1.

I thought lvm was supposed to use both physical devices. Do you know why both extents were created on the same physical device?
Should I create another extent on /dev/md2 before I remove the /dev/md1 extent(s)? If so, can you give me an example of how to use lvconvert in this case?

Thanks in advance!
best,
Julie
