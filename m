Received: from mx3.redhat.com (mx3.redhat.com [172.16.48.32])
	by int-mx1.corp.redhat.com (8.11.6/8.11.6) with ESMTP id j0RIFVO18831
	for <linux-lvm@redhat.com>; Thu, 27 Jan 2005 13:15:31 -0500
From: =?iso-8859-1?q?J=FCrgen=20Lange?= <jlange@epo.org>
Date: Thu, 27 Jan 2005 19:15:16 +0100
MIME-Version: 1.0
Message-Id: <200501271915.16469.jlange@epo.org>
Content-Transfer-Encoding: 7bit
Content-Disposition: inline
Subject: [linux-lvm] data loss because of mixing LVM and LVM2
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
To: linux-lvm@sistina.com

Hello,

I made the error in using pvmove and vgreduce from a SuSE 9.2 bootdisk
(kernel 2.6.x) and LVM2 on a LVM created by SuSE 8.2 (kernel 2.4.20) and LVM.
in the attached file lvm_crash.txt I add the exact output from vgscan, 
vgmknodes, vgimport, pvdata and pvdisplay. (the stderr output of the same 
commands is in the other file lvm_crash_2.txt)

Basically vgscan reports:
  vgscan -- reading all physical volumes (this may take a while...)
  vgscan -- found active volume group "sysvg"
  vgscan -- ERROR "vg_read_with_pv_and_lv(): current PV" can't get data of
                volume group "systemvg" from physical volume(s)
  vgscan -- "/etc/lvmtab" and "/etc/lvmtab.d" successfully created
(I created another VG, sysvg, in the meantime.)

I believe that all PEs (i.e. all of my lost data) are on my /dev/hda7, as 
pvdisplay on the other PVs of my VG systemvg always used to report:
"Allocated PE 0".
However, the VG "systemvg" is not recognised anymore.
I left the /dev/hda7 partition untouched - but I repartitioned the disk where 
the other (presumebly empty) PVs were on.

I put the last systemvg.conf file in the attachment as well (from probably 
before the vgreduce actually (not) happened).

Do you see a chance in recovering my data?
Thanks a lot,

-- 
Regards,
J. Lange (jlange@epo.org)
