From: Andreas Dilger <adilger@turbolabs.com>
Date: Thu, 6 Sep 2001 09:37:29 -0600
Subject: Re: [linux-lvm] Root on LV
Message-ID: <20010906093729.R32553@turbolinux.com>
References: <OF44ABFE07.4419EBD8-ONC1256ABF.004C8662@ibcnet.hu> <3B978B57.8000208@st-peter.stw.uni-erlangen.de>
Mime-Version: 1.0
Content-Disposition: inline
In-Reply-To: <3B978B57.8000208@st-peter.stw.uni-erlangen.de>
Sender: linux-lvm-admin@sistina.com
Errors-To: linux-lvm-admin@sistina.com
Reply-To: linux-lvm@sistina.com
List-Help: <mailto:linux-lvm-request@sistina.com?subject=help>
List-Post: <mailto:linux-lvm@sistina.com>
List-Subscribe: <http://lists.sistina.com/mailman/listinfo/linux-lvm>,
	<mailto:linux-lvm-request@sistina.com?subject=subscribe>
List-Unsubscribe: <http://lists.sistina.com/mailman/listinfo/linux-lvm>,
	<mailto:linux-lvm-request@sistina.com?subject=unsubscribe>
List-Archive: <http://lists.sistina.com/pipermail/linux-lvm/>
List-Id: <linux-lvm.redhat.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: linux-lvm@sistina.com
Cc: dobos_s@IBCnet.hu

On Sep 06, 2001  16:42 +0200, svetljo wrote:
> it probably will hold the kernel also
> and as far i know there is no bootloader which can access logical volume
> am i wrong

Yes, you are wrong.  LILO+patch can get a kernel from a logical volume.
Now that Linus has accepted my patch to fix LV_USER_BMAP from causing
an oops I will submit the patch to the LILO maintainer.  It can also be
found in the archives for this mailing list (have posted several times).

> dobos_s@IBCnet.hu wrote:
> >My kernel has no modules.
> >Why should I create an ext2 partition for holding an initrd which is not
> >doing any essential things except vgscan and vgchange -ay ?

You don't need vgscan at boot time unless the disks have moved around.
You DO need "vgchange -a y" in order to load the LVM data into the kernel.
If you are running EVMS you don't need that.  I think this is also on the
TODO list for the next LVM version.

Cheers, Andreas
-- 
Andreas Dilger  \ "If a man ate a pound of pasta and a pound of antipasto,
                 \  would they cancel out, leaving him still hungry?"
http://www-mddsp.enel.ucalgary.ca/People/adilger/               -- Dogbert
