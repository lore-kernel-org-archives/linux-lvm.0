From: "yves.alloyer" <Yves.ALLOYER@slpinfoware.com>
Subject: RE: [linux-lvm] Root + Software RAID 1 in partition + LVM + Reiserfs
Date: Fri, 5 Oct 2001 11:04:13 +0200
Message-Id: <NEBBLHFAEINCLDICDLOAOENICHAA.yves.alloyer@slpinfoware.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
In-Reply-To: <20011004120644.J31061@turbolinux.com>
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
To: linux-lvm@sistina.com

There is a very similar thread called [linux-lvm] pvcreate fails on a
software RAID metadisk
I'm posting the patch to it too...

Snip...
>
> > pvcreate /dev/md1 complained about using a Linux SWAP partition
>
> Did you change the partition type with fdisk to be the LVM partition type?
> Hmm, I suppose that if you are using MD RAID autostart, you need to have
> that partition type instead.
>
> > I tweaked lvm_check_partitioned_device to have it return FALSE for MD
> > devices. This would probably prevent me from partitioning any
> MD device. But
> > I won't anyway... that's what I use LVM for.
>
> I don't think you CAN partition an MD device and use it (what
> would the minor
> numbers be?).  Please submit the patch.
>
Snip...

Please beware. This patch is the quick and dirty type. I have no idea as to
its implications except I know it will prevent from partitioning MD devices.
------------------------------------------------------------
diff -ru 1.0.1-rc2/tools/lib/lvm_check_partitioned_dev.c
slp-1.0.1-rc2/tools/lib/lvm_check_partitioned_dev.c
--- 1.0.1-rc2/tools/lib/lvm_check_partitioned_dev.c	Mon Aug 20 17:17:56 2001
+++ slp-1.0.1-rc2/tools/lib/lvm_check_partitioned_dev.c	Thu Oct  4 14:47:37
2001
@@ -55,6 +55,8 @@
 	switch (lvm_get_device_type(st_rdev)) {
 	case LVM_DEVICE_TYPE_INVALID:
 	    break;
+	case 2:	/* YAL: MD device on partition. Won't partition it. */
+		break;
 	default:
 	    ret = TRUE;
 	}
------------------------------------------------------------
>
> Cheers, Andreas
> --
> Andreas Dilger  \ "If a man ate a pound of pasta and a pound of antipasto,
>                  \  would they cancel out, leaving him still hungry?"
> http://www-mddsp.enel.ucalgary.ca/People/adilger/               -- Dogbert
>
Snip...

Yves
