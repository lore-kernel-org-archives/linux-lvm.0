Return-Path: <bluca@comedia.it>
Date: Tue, 27 Feb 2001 23:42:26 +0100
From: Luca Berra <bluca@comedia.it>
Subject: Re: [linux-lvm] LVM with devfs
Message-ID: <20010227234226.A10131@colombina.comedia.it>
References: <20010227143604.A9170@oro.net>
Mime-Version: 1.0
Content-Type: multipart/mixed; boundary="G4iJoqBmSsgzjUCe"
Content-Disposition: inline
In-Reply-To: <20010227143604.A9170@oro.net>; from ralph@oro.net on Tue, Feb 27, 2001 at 02:36:04PM -0800
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
To: LVM Mailing List <linux-lvm@sistina.com>
Cc: Ralph Jennings <ralph@oro.net>

--G4iJoqBmSsgzjUCe
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

On Tue, Feb 27, 2001 at 02:36:04PM -0800, Ralph Jennings wrote:
> In case anybody cares, I have an experience here to share:
> 
> When I do a pvcreate on /dev/md/3 with devfs, pvcreate says file
> doesn't exist (talking about /dev/md/3).

patch for /proc/partitions attacched

> Also dies with /dev/discs/disc1/part1. (problem with symlinks?)
> When I use /dev/ide/host0/bus1/target0/lun0/part1 it works.
yes, it doesn't not follow symlinks

-- 
Luca Berra -- bluca@comedia.it
        Communication Media & Services S.r.l.
 /"\
 \ /     ASCII RIBBON CAMPAIGN
  X        AGAINST HTML MAIL
 / \

--G4iJoqBmSsgzjUCe
Content-Type: text/plain; charset=us-ascii
Content-Disposition: attachment; filename="md-devfs.patch"

--- linux-2.4.1-ac9/drivers/md/md.c.bluca.orig	Mon Feb 12 08:59:30 2001
+++ linux-2.4.1-ac9/drivers/md/md.c	Mon Feb 12 09:07:09 2001
@@ -3606,6 +3606,8 @@
 int md__init md_init (void)
 {
 	static char * name = "mdrecoveryd";
+	unsigned int minor;
+	char devname[128];
 	
 	printk (KERN_INFO "md driver %d.%d.%d MAX_MD_DEVS=%d, MD_SB_DISKS=%d\n",
 			MD_MAJOR_VERSION, MD_MINOR_VERSION,
@@ -3617,9 +3619,14 @@
 		return (-1);
 	}
 	devfs_handle = devfs_mk_dir (NULL, "md", NULL);
-	devfs_register_series (devfs_handle, "%u",MAX_MD_DEVS,DEVFS_FL_DEFAULT,
-				MAJOR_NR, 0, S_IFBLK | S_IRUSR | S_IWUSR,
-				&md_fops, NULL);
+	/* we don't use devfs_register_series because we want to fill md_hd_struct */
+	for (minor=0; minor < MAX_MD_DEVS; ++minor)
+	{
+		sprintf (devname, "%u", minor);
+		md_hd_struct[minor].de = devfs_register (devfs_handle,
+			devname, DEVFS_FL_DEFAULT, MAJOR_NR, minor,
+			S_IFBLK | S_IRUSR | S_IWUSR, &md_fops, NULL);
+	}
 
 	/* forward all md request to md_make_request */
 	blk_queue_make_request(BLK_DEFAULT_QUEUE(MAJOR_NR), md_make_request);

--G4iJoqBmSsgzjUCe--
