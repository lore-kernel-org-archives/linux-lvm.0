Received: from mx3.redhat.com (mx3.redhat.com [172.16.48.32])
	by int-mx1.corp.redhat.com (8.11.6/8.11.6) with ESMTP id j2MNCvO22781
	for <linux-lvm@redhat.com>; Tue, 22 Mar 2005 18:12:57 -0500
Received: from rproxy.gmail.com (rproxy.gmail.com [64.233.170.206])
	by mx3.redhat.com (8.12.11/8.12.11) with ESMTP id j2MNCqdx018949
	for <linux-lvm@redhat.com>; Tue, 22 Mar 2005 18:12:52 -0500
Received: by rproxy.gmail.com with SMTP id 40so161915rnz
	for <linux-lvm@redhat.com>; Tue, 22 Mar 2005 15:12:46 -0800 (PST)
Message-ID: <e5146c2a05032215124af3c0d7@mail.gmail.com>
Date: Tue, 22 Mar 2005 18:12:46 -0500
From: Sasha Z <kleptophobiac@gmail.com>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Subject: [linux-lvm] Can't restore the volume group after ghosting an hdd
Reply-To: Sasha Z <kleptophobiac@gmail.com>,
	LVM general discussion and development <linux-lvm@redhat.com>
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
To: linux-lvm@redhat.com

I had a hard drive begin to go bad on me, so I ghosted it to another
drive. lvm2 successfully picked up on the ghosted drive and didn't
complain about it. I used pvmove to send the data off to other parts
of the array. I removed the hdd I ghosted to from the array, wiped it,
and readded it as a new drive.

Now I can't seem to put my array back together.
I'm worried about the output of the lvs command saying that the volume
group is inconsistent. What exactly does that mean, and what do I do
about it? I can still seem to mount everything ok and get to my data,
but these errors are disconcerting. Is there a way to get everything
back to "normal"?

pvs:
  Found duplicate PV iCXUP4rdy2ZhoIJ4NWl1s3dr1au6QofX: using /dev/hdg1
not /dev/hdg
  Found duplicate PV fFNJ9uKeNSMVQxwLH82lnI3J0hQYRKTh: using /dev/hdk1
not /dev/hdk
  Warning: Volume Group vg0 is not consistent
  PV         VG   Fmt  Attr PSize   PFree
  /dev/hde4  vg0  lvm2 a-   179.75G      0
  /dev/hdg   vg0  lvm2 a-   172.55G  60.36G
  /dev/hdi   vg0  lvm2 a-   152.67G 152.67G
  /dev/hdk   vg0  lvm2 a-   233.76G      0

vgs:
  Found duplicate PV iCXUP4rdy2ZhoIJ4NWl1s3dr1au6QofX: using /dev/hdg1
not /dev/hdg
  Found duplicate PV fFNJ9uKeNSMVQxwLH82lnI3J0hQYRKTh: using /dev/hdk1
not /dev/hdk
  VG   #PV #LV #SN Attr  VSize   VFree
  vg0    4   1   0 wz--n 738.73G 213.03G

lvs:
  Found duplicate PV iCXUP4rdy2ZhoIJ4NWl1s3dr1au6QofX: using /dev/hdg1
not /dev/hdg
  Found duplicate PV fFNJ9uKeNSMVQxwLH82lnI3J0hQYRKTh: using /dev/hdk1
not /dev/hdk
  Volume group "vg0" inconsistent
  LV   VG   Attr   LSize   Origin Snap%  Move Copy%
  lv0  vg0  -wi--- 525.70G
