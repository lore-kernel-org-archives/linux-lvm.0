From: Mark Haverkamp <markh@osdl.org>
Date: Tue, 22 Feb 2005 10:34:26 -0800
Message-Id: <1109097266.19592.11.camel@markh1.pdx.osdl.net>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Subject: [linux-lvm] vgcreate with many disks
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
To: lvm mailing list <linux-lvm@redhat.com>, Alasdair G Kergon <agk@redhat.com>
Cc: Daniel McNeil <daniel@osdl.org>, Dave Olien <dmo@osdl.org>

We've been working with lvm and many iscsi disks (4142 disks).  We tried
to create a volume group of 256 of these disks and ended up killing it
after 90 minutes.  We added some printfs in the code and found that it
was taking about 45 seconds per disk to add it to the volume group and
that lvmcache_label_scan was the problem in this section of code in
_pv_read:
	if (!memlock()) {
		lvmcache_label_scan(fmt->cmd, 1);

		if (info->vginfo && info->vginfo->vgname &&
		    *info->vginfo->vgname &&
		    _get_pv_from_vg(info->fmt, info->vginfo->vgname,
				    info->dev->pvid, pv)) {
			return 1;
		}
	}


As an experiment, we changed the full_scan variable to 0 and now we can
create the volume group in about 1.5 minutes.  What is the reason for
specifying the full scan at this point?

Thanks,
Mark.

-- 
Mark Haverkamp <markh@osdl.org>
