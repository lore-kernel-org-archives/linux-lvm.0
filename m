From: "yves.alloyer" <Yves.ALLOYER@slpinfoware.com>
Subject: RE: [linux-lvm] pvcreate fails on a software RAID metadisk
Date: Fri, 5 Oct 2001 11:13:35 +0200
Message-Id: <NEBBLHFAEINCLDICDLOAIENJCHAA.yves.alloyer@slpinfoware.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
In-Reply-To: <3BBC8B5B.1A484028@legis.state.ak.us>
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

I experienced something similar with 1.0.1-rc2 (see the [linux-lvm] Root +
Software RAID 1 in partition + LVM + Reiserfs) thread.
From the code in pv_check_partitioned_dev it seems to me you run into
exactly the same problem.

I did a quick and dirty patch which fixed it for me.
Please be aware: I am new to this list, new to linux LVM...
I know the patch will prevent you from using any partitioned MD device in
LVM. I have no idea of further implications.
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

Please wait until more experienced people comment this patch before using
it.

Yves

> -----Original Message-----
> From: linux-lvm-admin@sistina.com [mailto:linux-lvm-admin@sistina.com]On
> Behalf Of Bill Ellis
> Sent: Thursday, October 04, 2001 6:16 PM
> To: linux-lvm@sistina.com
> Subject: [linux-lvm] pvcreate fails on a software RAID metadisk
>
>
> Hi,
>
> I'm trying to set up lvm 1.01rc4 under a 2.4.10 kernel.  I'm getting an
> error when I try to use pvcreate on a software RAID metadisk.  From the
> '-v' output of pvcreate, it appears that pvcreate thinks my metadisk is
> zero-length.
>
> Here's an example:
>
> root@tik-tok:~# pvcreate /dev/md7
> pvcreate -- ERROR "parameter error" setting up  physical volume "/dev/md7"
>
> root@tik-tok:~# pvcreate -v /dev/md7
> pvcreate -- locking logical volume manager
> pvcreate -- checking physical volume name "/dev/md7"
> pvcreate -- getting physical volume size
> pvcreate -- checking partition type
> pvcreate -- creating new physical volume
> pvcreate -- setting up physical volume for /dev/md7 with 0 sectors
> pvcreate -- ERROR "parameter error" setting up  physical volume "/dev/md7"
>
> root@tik-tok:~# pvcreate --version
> pvcreate: Logical Volume Manager 1.0.1-rc4
> Heinz Mauelshagen, Sistina Software  03/10/2001 (IOP 10)
> root@tik-tok:~# cat /proc/mdstat | grep -A2 md7
> md7 : active raid5 sde7[4] sdd7[3] sdc7[2] sdb7[1] sda7[0]
>       24575488 blocks level 5, 128k chunk, algorithm 0 [5/5] [UUUUU]
>
> root@tik-tok:~# grep md7 /proc/partitions
>    9     7   24575488 md7
>
> Any tips on what might be going on here would be appreciated...
>
> Thanks,
> Bill Ellis
>
>
>
> _______________________________________________
> linux-lvm mailing list
> linux-lvm@sistina.com
> http://lists.sistina.com/mailman/listinfo/linux-lvm
> read the LVM HOW-TO at http://www.sistina.com/lvm/Pages/howto.html
>
