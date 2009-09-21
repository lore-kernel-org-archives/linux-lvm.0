Received: from mx1.redhat.com (ext-mx09.extmail.prod.ext.phx2.redhat.com
	[10.5.110.13])
	by int-mx01.intmail.prod.int.phx2.redhat.com (8.13.8/8.13.8) with ESMTP
	id n8LM3nGT007494
	for <linux-lvm@redhat.com>; Mon, 21 Sep 2009 18:03:50 -0400
Received: from outbound.icp-qv1-irony-out4.iinet.net.au
	(outbound.icp-qv1-irony-out4.iinet.net.au [203.59.1.150])
	by mx1.redhat.com (8.13.8/8.13.8) with ESMTP id n8LM3cOK012214
	for <linux-lvm@redhat.com>; Mon, 21 Sep 2009 18:03:39 -0400
Message-ID: <4AB7F839.4000602@iinet.net.au>
Date: Tue, 22 Sep 2009 08:03:37 +1000
From: David Timms <dtimms@iinet.net.au>
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Subject: [linux-lvm] extend lv fails: invalid argument and failed to suspend
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
Content-Type: text/plain; charset="us-ascii"; format="flowed"
To: LVM general discussion and development <linux-lvm@redhat.com>

Hi,
I have an lvm root, which I am trying to expand into pv free space:
=====pvs -v
     Scanning for physical volume names
   PV         VG   Fmt  Attr PSize   PFree  DevSize PV UUID 

   /dev/sda2  vg2  lvm2 a-    49.28G     0   49.29G 
yKlt1o-0aKd-fO8M-Gy4p-4bGg-46Ww-BHotg2
   /dev/sda3  vg2  lvm2 a-    49.28G     0   49.29G 
o8fVEA-PilV-Pwum-WDtH-O2lF-XOTW-2XPeWu
   /dev/sda4  vg2  lvm2 a-    49.28G     0   49.29G 
yiiiWw-1jXz-QvEm-wj46-GrFm-nuTR-PlNrl8
   /dev/sdb2  vg2  lvm2 a-   229.03G     0  229.05G 
xItcHe-aeR8-BndU-3WUx-ltA3-eF6A-BRxIs5
   /dev/sdb3  vg2  lvm2 a-   229.80G     0  229.81G 
nO7RQk-NaAG-yA9m-LiNi-XmSD-HKHX-lRt4ua
   /dev/sdb5  vg2  lvm2 a-   235.00G     0  235.01G 
m1xJY0-BLuu-IyAT-W17r-XY6R-XZQF-2cLw0w
   /dev/sdc3  vg1  lvm2 a-    48.41G 13.88G  34.59G 
z6zl0h-oiRp-jJ12-KpDA-X11g-y2YH-hKjx9U
   /dev/sdd2  vg2  lvm2 a-    11.72G     0   11.72G 
pGnLD2-SUMV-V82W-myqj-yUH8-x0m1-6XgWe0
   /dev/sdd3  vg2  lvm2 a-    13.86G     0   13.87G 
n1kZD5-VCP2-Erj1-rtSg-3kki-5Iod-DyAmNG

so: 13GB free on vg1...
=====lvs -v
     Finding all logical volumes
   LV      VG   #Seg Attr   LSize   Maj Min KMaj KMin Origin Snap%  Move 
Copy%  Log Convert LV UUID
   lvhome  vg1     1 -wi-ao  21.53G  -1  -1 253  1 
                     2qxr1c-ObDr-BedT-B8Aq-6fBE-81tW-3mQvuP
   lvslash vg1     1 -wi-ao  12.00G  -1  -1 253  0 
                     A72rig-0oMK-KgVt-k6vo-rq7O-PKX0-koudNn
   lvswap  vg1     1 -wi-ao   1.00G  -1  -1 253  2 
                     7JzPLM-qqYs-Y4r4-SYdi-9M3j-7teZ-mNqVgW
   lvinfra vg2    10 -wi-ao 300.94G  -1  -1 253  4 
                     q1qH2f-wqOQ-A7gQ-F8Zq-DGZZ-YumT-TjpmGe
   lvmedia vg2     5 -wi-ao 566.31G  -1  -1 253  3 
                     8q5eTn-6ruu-NS5E-Zf6o-e88H-Urae-gXdB2Y

and lvslash is on vg1 and I want to grow it by +4GB
=====
- boot rescue
- don't mount
- lvm vgchange -a y
- lvm lvextend -v -L+4G /dev/vg1/lvslash

Trying to remember the error:
=====
...
Loading vg1 table
device-mapper: reload ioctl failed: invalid argument
Failed to suspend lvslash
=====
Now I only looked at pvs since alastair suggested another user with a 
similar problem.
In fact, while pvs says vg1 has 13.88G free, I think this is actually 
really supposed to be a negative number, since:
(DevSize) - (PSize) = (PFree)
  34.59G - 48.41G = -13.82  /= 13.88
, which looks like a bug in at least pvs !

I don't know how I got into this situation, nor how to proceed, but do 
know that the access to all the disk partitions is working normally at 
he moment, despite the above inconsistency.

Any ideas on how to solve this ?

DaveT.
