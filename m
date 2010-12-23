Received: from mx1.redhat.com (ext-mx07.extmail.prod.ext.phx2.redhat.com
	[10.5.110.11])
	by int-mx01.intmail.prod.int.phx2.redhat.com (8.13.8/8.13.8) with ESMTP
	id oBN88cCk010279
	for <linux-lvm@redhat.com>; Thu, 23 Dec 2010 03:08:40 -0500
Received: from biostat.ucsf.edu (upstrm185.psg-ucsf.org [38.99.193.74])
	by mx1.redhat.com (8.13.8/8.13.8) with ESMTP id oBN88PGa021148
	for <linux-lvm@redhat.com>; Thu, 23 Dec 2010 03:08:26 -0500
From: Ross Boylan <ross@biostat.ucsf.edu>
Date: Thu, 23 Dec 2010 00:08:17 -0800
Message-Id: <1293091697.20485.12.camel@corn.betterworld.us>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Subject: [linux-lvm] vgmerge with different physical extent sizes
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
To: LVM general discussion and development <linux-lvm@redhat.com>

What happens if you vgmerge 2 VG's and they have different physical
extent sizes?

I ask because I created a VG and specfied
vgcreate -s 32MB rose /dev/sdc2
# created a LV and formatted it, then inactivated it
vgmerge daisy rose

I notice that vgdisplay now says that daisy has
  PE Size               32.00 MB.

When I created daisy I don't think I used the -s option, though I may
have created it with a Debian tool that picked 32MB.  I've looked for an
explicit record, or the results of an earlier vgdisplay, but I don't see
anything (I do have some earlier lvdisplay's).

Is PE size mismatch anything that might be causing me trouble?  This is
LVM2.

Thanks.
Ross
