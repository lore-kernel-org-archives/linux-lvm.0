Received: from mx1.redhat.com (ext-mx15.extmail.prod.ext.phx2.redhat.com
	[10.5.110.20])
	by int-mx12.intmail.prod.int.phx2.redhat.com (8.14.4/8.14.4) with ESMTP
	id r9H970KI002673
	for <linux-lvm@redhat.com>; Thu, 17 Oct 2013 05:07:00 -0400
Received: from ppsw-42.csi.cam.ac.uk (ppsw-mx-f.csi.cam.ac.uk [131.111.8.149])
	by mx1.redhat.com (8.14.4/8.14.4) with ESMTP id r9H96v4i014660
	for <linux-lvm@redhat.com>; Thu, 17 Oct 2013 05:06:58 -0400
Message-ID: <525FA8AF.1010408@cam.ac.uk>
Date: Thu, 17 Oct 2013 10:06:55 +0100
From: David McBride <dwm37@cam.ac.uk>
MIME-Version: 1.0
References: <CAE63xUO1jhgxQoRbJU-8+j-cxRB7QEspu=JWvekp9ExzFmnjSA@mail.gmail.com>
	<alpine.DEB.2.00.1310160914360.22271@cobra.newdream.net>
In-Reply-To: <alpine.DEB.2.00.1310160914360.22271@cobra.newdream.net>
Content-Transfer-Encoding: 7bit
Subject: Re: [linux-lvm] poor read performance on rbd+LVM, LVM overload
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
To: Sage Weil <sage@inktank.com>
Cc: ugis22@gmail.com, "ceph-devel@vger.kernel.org" <ceph-devel@vger.kernel.org>, "ceph-users@ceph.com" <ceph-users@ceph.com>, linux-lvm@redhat.com

On 16/10/2013 17:16, Sage Weil wrote:

> I'm not sure what options LVM provides for aligning things to the
> underlying storage...

There is a generic kernel ABI for exposing performance properties of 
block devices to higher layers, so that they can automatically tune 
themselves according to those performance properties, and report their 
performance properties to users higher up the stack.

LVM supports both reading this data from underlying physical devices, 
configuring itself as appropriate --- as well as reporting this data to 
users of LVs, so that they can, too.

(For example, mkfs.xfs uses libblkid to automatically select the optimal 
stripe-size, stride width, etc. of an LVM volume sitting on top of an MD 
disk array.)

A good starting point appears to be:

 
http://git.kernel.org/cgit/linux/kernel/git/torvalds/linux.git/commit/?id=c72758f33784e5e2a1a4bb9421ef3e6de8f9fcf3

If Ceph RBD block devices don't currently expose this information, that 
should be a relatively simple addition that will result in all higher 
layers, whether LVM or a native filesystem, automatically tuning 
themselves at creation-time for the RBD's performance characteristics.

(As an aside, it's possible that OSD journalling performance could also 
be improved by teaching it to heed this topology information.  I can 
imagine that when writing directly to block devices it may be possible 
to improve performance, such as when using LVM-on-an-SSD, or a DOS 
partition on a 4k-sector SATA disk.)

  ~ ~ ~

In the mean time, the documentation I found for LVM2 suggests that the 
`pvcreate` command supports the "--dataalignment" and 
"--dataalignmentoffset" flags.

The former should be the RBD object size, e.g. 4MB by default.  In this 
case, you'll also need to set the latter compensate for the offset 
introduced by the GPT place-holder partition table at the start of the 
device so that LVM data extents begin on an object boundry.

Cheers,
David
-- 
David McBride <dwm37@cam.ac.uk>
Unix Specialist, University Computing Service
