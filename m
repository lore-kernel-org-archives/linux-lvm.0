Received: from mx1.redhat.com (ext-mx13.extmail.prod.ext.phx2.redhat.com
	[10.5.110.18])
	by int-mx12.intmail.prod.int.phx2.redhat.com (8.14.4/8.14.4) with ESMTP
	id p8J72ha0012399
	for <linux-lvm@redhat.com>; Mon, 19 Sep 2011 03:02:43 -0400
Received: from Ishtar.sc.tlinx.org (ishtar.tlinx.org [173.164.175.65])
	by mx1.redhat.com (8.14.4/8.14.4) with ESMTP id p8J72d9U010948
	for <linux-lvm@redhat.com>; Mon, 19 Sep 2011 03:02:39 -0400
Received: from [192.168.3.140] (Athenae2 [192.168.3.140])
	by Ishtar.sc.tlinx.org (8.14.4/8.14.4/SuSE Linux 0.8) with ESMTP id
	p8J72YU9009444
	for <linux-lvm@redhat.com>; Mon, 19 Sep 2011 00:02:36 -0700
Message-ID: <4E76E90A.4030500@tlinx.org>
Date: Mon, 19 Sep 2011 00:02:34 -0700
From: "Linda A. Walsh" <lvm@tlinx.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Subject: [linux-lvm] deficient lvs interface: worked around: restore
	premerge state to stop merge...
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
Content-Type: text/plain; charset="us-ascii"; format="flowed"
To: LVM general discussion and development <linux-lvm@redhat.com>



FWIW,

posting the way to stop a merge, (given that no one else seemed
to have the answer)... removed the 'uninteresting vg/lv's...

Home still merging:
# lvs --all -o lv_name,lv_attr,origin
  LV                       Attr    Origin
  Home                     Owi-ao
  [Home-2011.09.03-00.28.36] Swi---  Home


Since the device for the snapshot was gone (dmsetup removed it),
the only place it seemed to be stored on disk was
the on-disk VolGroup table...so...lets fix that!

Find right backup...

# vgcfgrestore -l Home+Space
  File:             /etc/lvm/archive/Home+Space_00199.vg
  VG name:          Home+Space
  Description:      Created *before* executing 'lvconvert --merge  \
                   /dev/Home+Space/Home-2011.09.03-00.28.36'
  Backup Time:      Sun Sep 11 17:29:56 2011

Restore:


# vgcfgrestore -f /etc/lvm/archive/Home+Space_00199.vg   Home+Space
  Restored volume group Home+Space
# lvs
  LV                       VG         Attr     LSize   Origin
  Home                     Home+Space owi-ao   1.00t
  Home-2011.09.03-00.28.36 Home+Space swi---   1.00t   Home
# lvremove /dev/Home+Space/Home-2011.09.03-00.28.36
  Logical volume "Home-2011.09.03-00.28.36" successfully removed

Didn't even have to use "-f" on the lvremove...

Hey, seems like it's the only way to stop a merge (?)

-l
