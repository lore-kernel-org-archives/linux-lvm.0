Subject: Re: [linux-lvm] ext2online and 2.4.18
From: Ian Prowell <ip_lvm@prowell.org>
In-Reply-To: <20020619214731.GB22427@clusterfs.com>
References: <1024512969.1862.6.camel@hiro.prowell.org.bogus>
	<20020619195508.GA22427@clusterfs.com>
	<1024521044.1861.6.camel@hiro.prowell.org.bogus> 
	<20020619214731.GB22427@clusterfs.com>
Content-Type: multipart/mixed; boundary="=-lTp18A6c8Yw5jzKSpGk1"
Message-Id: <1024525638.1861.54.camel@hiro.prowell.org.bogus>
Mime-Version: 1.0
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
Date: Wed Jun 19 17:27:03 2002
List-Id: <linux-lvm.redhat.com>
To: Andreas Dilger <adilger@clusterfs.com>
Cc: linux-lvm@sistina.com

--=-lTp18A6c8Yw5jzKSpGk1
Content-Type: text/plain
Content-Transfer-Encoding: 7bit

Attached is the reject file.  It looks like hunk 10 removes 27 lines
from super.c around line 594, but these were not getting removed in
2.4.18.  Also attached is what I think the 2.4.18 patch should be.

-Ian


On Wed, 2002-06-19 at 14:47, Andreas Dilger wrote:
> On Jun 19, 2002  14:10 -0700, Ian Prowell wrote:
> > Andreas,
> > Thanks for the prompt reply.  To be more specific I am using RedHat's
> > 2.4.18-4 kernel.  When I apply the patch I get the following output.
> > 
> > [root@metaverse src]# cat /root/online-ext2-2.4.17.diff | patch -p0
> > patching file linux/fs/ext2/super.c
> > Hunk #9 succeeded at 730 (offset -1 lines).
> > Hunk #10 FAILED at 883.
> > Hunk #11 succeeded at 893 (offset 1 line).
> > Hunk #12 succeeded at 917 (offset -1 lines).
> > Hunk #13 succeeded at 979 (offset 1 line).
> > Hunk #14 succeeded at 987 (offset -1 lines).
> > Hunk #15 succeeded at 1024 (offset 1 line).
> > 1 out of 15 hunks FAILED -- saving rejects to file
> > linux/fs/ext2/super.c.rej
> > 
> > It looks like most of the patch is working, but I am not a kernel
> > developer and really have no idea what failed on hunk 10.  If it would
> > be useful I can send the rejects file.
> 
> It won't really be useful for you to send the failed hunk, because I
> have no idea why it is failing.  I would suggest firing up a text editor
> with fs/ext2/super.c and fs/ext2/super.c.rej and just manually cut-paste
> the failed parts in.
> 
> Unified diffs are rather simple to understand.
> 
> Lines like "@@ -123,6 +234,8 @@" are telling you that the original file
> had this hunk at line 123 and the modified file had the replacement
> hunk at line 234.
> 
> Lines like "-                blah" are removing that line from the
> original file and replacing it with "+           blarg" in the new file.
> 
> Hopefully hunk #10 isn't too large...  Sadly, the larger the hunk, the
> more likely it is to not apply cleanly...
> 
> Cheers, Andreas
> --
> Andreas Dilger
> http://www-mddsp.enel.ucalgary.ca/People/adilger/
> http://sourceforge.net/projects/ext2resize/


--=-lTp18A6c8Yw5jzKSpGk1
Content-Disposition: attachment; filename=super.c.rej
Content-Type: application/x-reject; name=super.c.rej
Content-Transfer-Encoding: base64

KioqKioqKioqKioqKioqCioqKiA1OTQsNjI2ICoqKioKICAJCWdvdG8gZmFpbGVkX21vdW50Owog
IAl9CiAgCi0gCXNiLT51LmV4dDJfc2Iuc19ncm91cHNfY291bnQgPSAobGUzMl90b19jcHUoZXMt
PnNfYmxvY2tzX2NvdW50KSAtCi0gCQkJCSAgICAgICAgbGUzMl90b19jcHUoZXMtPnNfZmlyc3Rf
ZGF0YV9ibG9jaykgKwotIAkJCQkgICAgICAgRVhUMl9CTE9DS1NfUEVSX0dST1VQKHNiKSAtIDEp
IC8KLSAJCQkJICAgICAgIEVYVDJfQkxPQ0tTX1BFUl9HUk9VUChzYik7Ci0gCWRiX2NvdW50ID0g
KHNiLT51LmV4dDJfc2Iuc19ncm91cHNfY291bnQgKyBFWFQyX0RFU0NfUEVSX0JMT0NLKHNiKSAt
IDEpIC8KLSAJCSAgIEVYVDJfREVTQ19QRVJfQkxPQ0soc2IpOwotIAlzYi0+dS5leHQyX3NiLnNf
Z3JvdXBfZGVzYyA9IGttYWxsb2MgKGRiX2NvdW50ICogc2l6ZW9mIChzdHJ1Y3QgYnVmZmVyX2hl
YWQgKiksIEdGUF9LRVJORUwpOwotIAlpZiAoc2ItPnUuZXh0Ml9zYi5zX2dyb3VwX2Rlc2MgPT0g
TlVMTCkgewotIAkJcHJpbnRrICgiRVhUMi1mczogbm90IGVub3VnaCBtZW1vcnlcbiIpOwotIAkJ
Z290byBmYWlsZWRfbW91bnQ7Ci0gCX0KLSAJZm9yIChpID0gMDsgaSA8IGRiX2NvdW50OyBpKysp
IHsKLSAJCXNiLT51LmV4dDJfc2Iuc19ncm91cF9kZXNjW2ldID0gYnJlYWQgKGRldiwgbG9naWNf
c2JfYmxvY2sgKyBpICsgMSwKLSAJCQkJCQkgICAgICAgc2ItPnNfYmxvY2tzaXplKTsKLSAJCWlm
ICghc2ItPnUuZXh0Ml9zYi5zX2dyb3VwX2Rlc2NbaV0pIHsKLSAJCQlmb3IgKGogPSAwOyBqIDwg
aTsgaisrKQotIAkJCQlicmVsc2UgKHNiLT51LmV4dDJfc2Iuc19ncm91cF9kZXNjW2pdKTsKLSAJ
CQlrZnJlZShzYi0+dS5leHQyX3NiLnNfZ3JvdXBfZGVzYyk7Ci0gCQkJcHJpbnRrICgiRVhUMi1m
czogdW5hYmxlIHRvIHJlYWQgZ3JvdXAgZGVzY3JpcHRvcnNcbiIpOwotIAkJCWdvdG8gZmFpbGVk
X21vdW50OwotIAkJfQotIAl9Ci0gCWlmICghZXh0Ml9jaGVja19kZXNjcmlwdG9ycyAoc2IpKSB7
Ci0gCQlwcmludGsgKCJFWFQyLWZzOiBncm91cCBkZXNjcmlwdG9ycyBjb3JydXB0ZWQhXG4iKTsK
LSAJCWRiX2NvdW50ID0gaTsKLSAJCWdvdG8gZmFpbGVkX21vdW50MjsKLSAJfQogIAlmb3IgKGkg
PSAwOyBpIDwgRVhUMl9NQVhfR1JPVVBfTE9BREVEOyBpKyspIHsKICAJCXNiLT51LmV4dDJfc2Iu
c19pbm9kZV9iaXRtYXBfbnVtYmVyW2ldID0gMDsKICAJCXNiLT51LmV4dDJfc2Iuc19pbm9kZV9i
aXRtYXBbaV0gPSBOVUxMOwotLS0gODgzLDg4OCAtLS0tCiAgCQlnb3RvIGZhaWxlZF9tb3VudDsK
ICAJfQogIAogIAlmb3IgKGkgPSAwOyBpIDwgRVhUMl9NQVhfR1JPVVBfTE9BREVEOyBpKyspIHsK
ICAJCXNiLT51LmV4dDJfc2Iuc19pbm9kZV9iaXRtYXBfbnVtYmVyW2ldID0gMDsKICAJCXNiLT51
LmV4dDJfc2Iuc19pbm9kZV9iaXRtYXBbaV0gPSBOVUxMOwo=

--=-lTp18A6c8Yw5jzKSpGk1
Content-Disposition: attachment; filename=online-ext2-2.4.18.diff
Content-Transfer-Encoding: quoted-printable
Content-Type: text/x-patch; name=online-ext2-2.4.18.diff; charset=ISO-8859-1

diff -ru linux-2.4.18.orig/CREDITS linux/CREDITS
--- linux-2.4.18.orig/CREDITS	Mon Feb 25 11:37:50 2002
+++ linux/CREDITS	Wed Jun 19 14:56:34 2002
@@ -694,6 +694,15 @@
 S: Warrendale, Pennsylvania 15086
 S: USA
=20
+N: Andreas Dilger
+E: adilger@turbolinux.com
+W: http://www-mddsp.enel.ucalgary.ca/People/adilger/
+D: Ext2 filesystem online resize capability
+D: Ext3/LVM hacking
+S: 630 Schooner Cove N.W.
+S: Calgary, AB
+S: Canada   T3L 1Z1
+
 N: Alex deVries
 E: adevries@thepuffingroup.com
 D: Various SGI parts, bits of HAL2 and Newport, PA-RISC Linux.
diff -ru linux-2.4.18.orig/Documentation/Configure.help linux/Documentation=
/Configure.help
--- linux-2.4.18.orig/Documentation/Configure.help	Mon Feb 25 11:37:51 2002
+++ linux/Documentation/Configure.help	Wed Jun 19 14:56:34 2002
@@ -14016,6 +14016,20 @@
   be compiled as a module, and so this could be dangerous.  Most
   everyone wants to say Y here.
=20
+Online resize for ext2 filesystems
+CONFIG_EXT2_RESIZE
+  This option gives you the ability to increase the size of an ext2
+  filesystem while it is mounted (in use).  In order to do this, you
+  must also be able to resize the underlying disk partition, probably
+  via a Logical Volume Manager (LVM), metadevice (MD), or hardware
+  RAID device - none of that capability is included in this feature.
+  If you don't know what any of these things are, or you haven't
+  configured your kernel for them, you should probably say N here.  If
+  you choose Y, then your kernel will be about 3k larger, and you need
+  to get some more software (http://ext2resize.sourceforge.net/) in
+  order to actually resize your filesystem, otherwise this feature
+  will just sit unused inside the kernel.
+
 Ext3 journalling file system support (EXPERIMENTAL)
 CONFIG_EXT3_FS
   This is the journalling version of the Second extended file system
diff -ru linux-2.4.18.orig/fs/Config.in linux/fs/Config.in
--- linux-2.4.18.orig/fs/Config.in	Mon Feb 25 11:38:07 2002
+++ linux/fs/Config.in	Wed Jun 19 14:56:34 2002
@@ -77,6 +77,7 @@
 tristate 'ROM file system support' CONFIG_ROMFS_FS
=20
 tristate 'Second extended fs support' CONFIG_EXT2_FS
+dep_mbool '  Online ext2 resize support (DANGEROUS)' CONFIG_EXT2_RESIZE $C=
ONFIG_EXT2_FS $CONFIG_EXPERIMENTAL
=20
 tristate 'System V/Xenix/V7/Coherent file system support' CONFIG_SYSV_FS
=20
diff -ru linux-2.4.18.orig/fs/ext2/balloc.c linux/fs/ext2/balloc.c
--- linux-2.4.18.orig/fs/ext2/balloc.c	Mon Feb 25 11:38:08 2002
+++ linux/fs/ext2/balloc.c	Wed Jun 19 14:56:34 2002
@@ -616,13 +616,13 @@
=20
 unsigned long ext2_count_free_blocks (struct super_block * sb)
 {
-#ifdef EXT2FS_DEBUG
 	struct ext2_super_block * es;
 	unsigned long desc_count, bitmap_count, x;
 	int bitmap_nr;
 	struct ext2_group_desc * gdp;
 	int i;
-=09
+
+	if (test_opt(sb, DEBUG) && test_opt(sb, CHECK)) {
 	lock_super (sb);
 	es =3D sb->u.ext2_sb.s_es;
 	desc_count =3D 0;
@@ -643,13 +643,12 @@
 			i, le16_to_cpu(gdp->bg_free_blocks_count), x);
 		bitmap_count +=3D x;
 	}
-	printk("ext2_count_free_blocks: stored =3D %lu, computed =3D %lu, %lu\n",
+	printk(__FUNCTION__": stored =3D %u, computed gdt =3D %lu, bitmap =3D %lu=
\n",
 	       le32_to_cpu(es->s_free_blocks_count), desc_count, bitmap_count);
 	unlock_super (sb);
 	return bitmap_count;
-#else
+	} else
 	return le32_to_cpu(sb->u.ext2_sb.s_es->s_free_blocks_count);
-#endif
 }
=20
 static inline int block_in_use (unsigned long block,
diff -ru linux-2.4.18.orig/fs/ext2/super.c linux/fs/ext2/super.c
--- linux-2.4.18.orig/fs/ext2/super.c	Mon Feb 25 11:38:08 2002
+++ linux/fs/ext2/super.c	Wed Jun 19 15:16:33 2002
@@ -14,6 +14,7 @@
  *
  *  Big-endian to little-endian byte-swapping/bitmaps by
  *        David S. Miller (davem@caip.rutgers.edu), 1995
+ *  Online resize by Andreas Dilger (adilger@turbolinux.com), July 1999
  */
=20
 #include <linux/config.h>
@@ -163,7 +164,9 @@
  */
 static int parse_options (char * options, unsigned long * sb_block,
 			  unsigned short *resuid, unsigned short * resgid,
-			  unsigned long * mount_options)
+			  unsigned long *mount_options,
+			  unsigned long *n_blocks_count,
+			  unsigned long *resgdt)
 {
 	char * this_char;
 	char * value;
@@ -229,6 +232,31 @@
 		else if (!strcmp (this_char, "nogrpid") ||
 			 !strcmp (this_char, "sysvgroups"))
 			clear_opt (*mount_options, GRPID);
+#ifdef CONFIG_EXT2_RESIZE
+		else if (!strcmp(this_char, "resize")) {
+			printk("EXT2-fs: parse_options: resize=3D%s\n", value);
+			if (!n_blocks_count) {
+				printk("EXT2-fs: resize option only available "
+				       "for remount\n");
+				return 0;
+			}
+			if (!value || !*value) {
+				printk("EXT2-fs: resize requires number of "
+				       "blocks\n");
+				return 0;
+			}
+			*n_blocks_count =3D simple_strtoul(value, &value, 0);
+			if (*value =3D=3D ':') {
+				value++;
+				*resgdt =3D simple_strtoul(value, &value, 0);
+			}
+			if (*value) {
+				printk("EXT2-fs: invalid resize option: %s\n",
+				       value);
+				return 0;
+			}
+		}
+#endif /* CONFIG_EXT2_RESIZE */
 		else if (!strcmp (this_char, "resgid")) {
 			if (!value || !*value) {
 				printk ("EXT2-fs: the resgid option requires "
@@ -314,10 +342,10 @@
 	es->s_mnt_count=3Dcpu_to_le16(le16_to_cpu(es->s_mnt_count) + 1);
 	ext2_write_super(sb);
 	if (test_opt (sb, DEBUG))
-		printk ("[EXT II FS %s, %s, bs=3D%lu, fs=3D%lu, gc=3D%lu, "
+		printk ("[EXT II FS %s, %s, bs=3D%lu, bc=3D%u, gc=3D%lu, "
 			"bpg=3D%lu, ipg=3D%lu, mo=3D%04lx]\n",
 			EXT2FS_VERSION, EXT2FS_DATE, sb->s_blocksize,
-			sb->u.ext2_sb.s_frag_size,
+			le32_to_cpu(es->s_blocks_count),
 			sb->u.ext2_sb.s_groups_count,
 			EXT2_BLOCKS_PER_GROUP(sb),
 			EXT2_INODES_PER_GROUP(sb),
@@ -331,7 +359,9 @@
 	return res;
 }
=20
-static int ext2_check_descriptors (struct super_block * sb)
+static int ext2_check_descriptors(struct super_block *sb,
+				  struct buffer_head **group_desc,
+				  unsigned long groups_count)
 {
 	int i;
 	int desc_block =3D 0;
@@ -340,10 +370,10 @@
=20
 	ext2_debug ("Checking group descriptors");
=20
-	for (i =3D 0; i < sb->u.ext2_sb.s_groups_count; i++)
+	for (i =3D 0; i < groups_count; i++)
 	{
 		if ((i % EXT2_DESC_PER_BLOCK(sb)) =3D=3D 0)
-			gdp =3D (struct ext2_group_desc *) sb->u.ext2_sb.s_group_desc[desc_bloc=
k++]->b_data;
+			gdp =3D (struct ext2_group_desc *)group_desc[desc_block++]->b_data;
 		if (le32_to_cpu(gdp->bg_block_bitmap) < block ||
 		    le32_to_cpu(gdp->bg_block_bitmap) >=3D block + EXT2_BLOCKS_PER_GROUP=
(sb))
 		{
@@ -378,6 +408,267 @@
 	return 1;
 }
=20
+static int ext2_read_descriptors(struct super_block *sb,
+				 unsigned long blocks_count)
+{
+	struct buffer_head **group_desc;
+	struct buffer_head **o_group_desc;
+	unsigned long groups_count;
+	unsigned long o_groups_count;
+	unsigned long gdb_count;
+	unsigned long o_gdb_count;
+
+	o_group_desc =3D EXT2_SB(sb)->s_group_desc;
+	o_groups_count =3D EXT2_SB(sb)->s_groups_count;
+	o_gdb_count =3D EXT2_SB(sb)->s_gdb_count;
+
+	groups_count =3D (blocks_count -
+			le32_to_cpu(EXT2_SB(sb)->s_es->s_first_data_block) +
+			EXT2_BLOCKS_PER_GROUP(sb) - 1) /
+			EXT2_BLOCKS_PER_GROUP(sb);
+	gdb_count =3D (groups_count + EXT2_DESC_PER_BLOCK(sb) - 1) /
+		   EXT2_DESC_PER_BLOCK(sb);
+	if (test_opt(sb, DEBUG)) {
+		printk("EXT2-fs: ext2_read_descriptors: o_groups_count=3D%lu, "
+		       "groups_count=3D%lu, blocks_count=3D%lu\n", o_groups_count,
+		       groups_count, blocks_count);
+		printk("EXT2-fs: ext2_read_descriptors: o_gdb_count=3D%lu, "
+		       "gdb_count=3D%lu\n", o_gdb_count, gdb_count);
+	}
+
+	if (o_gdb_count !=3D gdb_count) {
+		unsigned long logic_gd_block =3D EXT2_SB(sb)->s_sbh->b_blocknr +1;
+		unsigned long i;
+
+		group_desc =3D (struct buffer_head **)kmalloc(gdb_count *
+				sizeof(struct buffer_head *), GFP_KERNEL);
+		if (group_desc =3D=3D NULL) {
+			ext2_warning(sb, __FUNCTION__,
+				     "not enough memory for %ld group blocks",
+				     gdb_count);
+			return -ENOMEM;
+		}
+		for (i =3D o_gdb_count; i < gdb_count; i++) {	/* Add blocks */
+			group_desc[i] =3D bread(sb->s_dev, logic_gd_block + i,
+					      sb->s_blocksize);
+			if (!group_desc[i]) {
+				unsigned long j;
+
+				for (j =3D o_gdb_count; j < i; j++)
+					brelse(group_desc[j]);
+				kfree(group_desc);
+				ext2_warning(sb, __FUNCTION__,
+					     "can't read group block %ld",
+					     i);
+				return -EIO;
+			}
+		}
+
+		/*
+		 * Copy over pointers to old descriptor blocks already loaded.
+		 */
+		memcpy(group_desc, o_group_desc,
+		       (o_gdb_count < gdb_count ? o_gdb_count : gdb_count) *
+		       sizeof(struct buffer_head *));
+	} else
+		group_desc =3D o_group_desc; /* this will never be NULL */
+
+	if (!ext2_check_descriptors(sb, group_desc, groups_count)) {
+		unsigned long j;
+
+		for (j =3D o_gdb_count; j < gdb_count; j++)
+			brelse(group_desc[j]);
+		if (group_desc !=3D o_group_desc)
+			kfree(group_desc);
+		return -EINVAL;
+	}
+
+	EXT2_SB(sb)->s_group_desc =3D group_desc;
+	EXT2_SB(sb)->s_groups_count =3D groups_count;
+	EXT2_SB(sb)->s_gdb_count =3D gdb_count;
+
+	if (o_group_desc && o_group_desc !=3D EXT2_SB(sb)->s_group_desc)
+		kfree(o_group_desc);
+
+	return 0;
+} /* ext2_read_descriptors */
+
+#ifdef CONFIG_EXT2_RESIZE
+/* Make the disk blocks in a new group available to the filesystem */
+static int ext2_update_group(struct super_block *sb, unsigned int block_gr=
oup,
+			     unsigned int reserved, unsigned int resgdt)
+{
+	struct ext2_group_desc *gdp;
+	struct ext2_super_block *es;
+	int blocks;
+	int m_blocks;
+	int inodes;
+	unsigned long gdb;
+	int shrink =3D reserved > 100 ? 1 : 0;
+
+	es =3D EXT2_SB(sb)->s_es;
+	gdp =3D ext2_get_group_desc(sb, block_group, NULL);
+	gdb =3D ext2_bg_num_gdb(sb, block_group);
+
+	inodes =3D le32_to_cpu(gdp->bg_free_inodes_count);
+	blocks =3D le32_to_cpu(gdp->bg_free_blocks_count);
+	m_blocks =3D EXT2_SB(sb)->s_itb_per_group + 2 +
+		ext2_bg_has_super(sb, block_group) +
+		(gdb ? gdb + resgdt : 0) + blocks;
+
+	if (block_group < EXT2_SB(sb)->s_groups_count - 1 &&
+	    m_blocks !=3D EXT2_BLOCKS_PER_GROUP(sb)) {
+		ext2_warning(sb, __FUNCTION__,
+			     "bad group size for %s group %d (%d blocks) "
+			     "(iblk =3D %ld, GDT blk %ld, resgdt %d, blocks %d\n",
+			     ext2_bg_has_super(sb, block_group) ? "normal" :
+			     "no-backup", block_group, m_blocks,
+			     EXT2_SB(sb)->s_itb_per_group, gdb, resgdt, blocks);
+		return -EINVAL;
+	}
+
+	es->s_free_inodes_count =3D
+		cpu_to_le32(le32_to_cpu(es->s_free_inodes_count) + inodes);
+	es->s_inodes_count =3D cpu_to_le32(le32_to_cpu(es->s_inodes_count) +
+		inodes);
+
+	es->s_free_blocks_count =3D
+		cpu_to_le32(le32_to_cpu(es->s_free_blocks_count) + blocks);
+	es->s_blocks_count =3D cpu_to_le32(le32_to_cpu(es->s_blocks_count) +
+		m_blocks);
+	es->s_r_blocks_count =3D cpu_to_le32(le32_to_cpu(es->s_r_blocks_count) +
+		m_blocks * reserved / 100);
+
+	mark_buffer_dirty(EXT2_SB(sb)->s_sbh);
+	sb->s_dirt =3D 1;
+
+	if (test_opt(sb, DEBUG)) {
+		printk("EXT2-fs: ext2_update_group: %s %s group %u: "
+		       "%u inodes, %u blocks (%u free), %d (%d%%) reserved\n",
+		       shrink ? "removing" : "adding",
+		       ext2_bg_has_super(sb, block_group) ? "normal" :
+		       "no-super", block_group, inodes, m_blocks, blocks,
+		       m_blocks * reserved / 100, reserved);
+		printk("EXT2-fs: ext2_update_group: %u inodes (%u free), "
+		       "%u blocks (%u free)\n",
+		       le32_to_cpu(es->s_inodes_count),
+		       le32_to_cpu(es->s_free_inodes_count),
+		       le32_to_cpu(es->s_blocks_count),
+		       le32_to_cpu(es->s_free_blocks_count));
+	}
+
+	return 0;
+} /* ext2_update_group */
+
+/* Resize the filesystem to the new number of blocks specified.  If requir=
ed,
+ * the new group descriptors should have already been configured for us (w=
e
+ * only check that they are valid).
+ */
+static int ext2_resize_fs(struct super_block *sb,
+			  struct ext2_super_block *es,
+			  unsigned long n_blocks_count, unsigned long resgdt)
+{
+	unsigned long o_blocks_count;
+	unsigned long o_groups_count;
+	unsigned long last, add;
+	unsigned long reserved;
+	struct buffer_head *bh;
+	unsigned long i;
+	int err =3D 0;
+
+	o_blocks_count =3D le32_to_cpu(es->s_blocks_count);
+	o_groups_count =3D EXT2_SB(sb)->s_groups_count;
+
+	if (test_opt(sb, DEBUG))
+		printk("EXT2-fs: ext2_resize_fs: from %lu to %lu blocks\n",
+		       o_blocks_count, n_blocks_count);
+
+	if (n_blocks_count =3D=3D 0 || n_blocks_count =3D=3D o_blocks_count)
+		return 0;
+
+	if (n_blocks_count < o_blocks_count) {
+		ext2_warning(sb, __FUNCTION__, "error: can't shrink FS!");
+		return -EBUSY;
+	}
+
+	/* See if the device is actually as big as what was requested */
+	bh =3D bread(sb->s_dev, n_blocks_count - 1, EXT2_BLOCK_SIZE(sb));
+	if (!bh) {
+		ext2_warning(sb, __FUNCTION__,
+			     "unable to read last block, resize aborted");
+		return -ENOSPC;
+	}
+	brelse(bh);
+
+	/* For reserved percentage calculation, we avoid 32-bit overflow. */
+	reserved =3D o_blocks_count > 10000000 ?
+		(le32_to_cpu(es->s_r_blocks_count) + o_blocks_count / 200) /
+			(o_blocks_count / 100) :
+		(le32_to_cpu(es->s_r_blocks_count) * 100 + o_blocks_count / 2) /
+			o_blocks_count;
+
+	if ((err =3D ext2_read_descriptors(sb, n_blocks_count))) {
+		ext2_warning(sb, __FUNCTION__,
+			     "group descriptor error %d, resize aborted", err);
+		return err;
+	}
+
+	/* Handle the remaining blocks in the last partial group. */
+	last =3D (o_blocks_count - le32_to_cpu(es->s_first_data_block)) %
+		EXT2_BLOCKS_PER_GROUP(sb);
+	if (last !=3D 0) {	/* The last group isn't full yet */
+		struct inode inode;
+		add =3D EXT2_BLOCKS_PER_GROUP(sb) - last;
+		if (add + o_blocks_count > n_blocks_count)
+			add =3D n_blocks_count - o_blocks_count;
+		es->s_blocks_count =3D
+			cpu_to_le32(le32_to_cpu(es->s_blocks_count) + add);
+		es->s_r_blocks_count =3D
+			cpu_to_le32(le32_to_cpu(es->s_r_blocks_count) +
+				    add * reserved / 100);
+		mark_buffer_dirty(EXT2_SB(sb)->s_sbh);
+		sb->s_dirt =3D 1;
+		unlock_super(sb);
+		/*
+		 * Fake out an inode enough to "free" the new blocks in this
+		 * group.  Turn off quotas for this inode so it doesn't get
+		 * confused by freeing blocks that don't really exist yet.
+		 */
+		inode.i_sb =3D sb;
+		inode.i_state =3D I_DIRTY;
+		INIT_LIST_HEAD(&inode.i_hash);
+		for (i =3D 0; i < MAXQUOTAS; i++)
+			inode.i_dquot[i] =3D NODQUOT;
+		ext2_free_blocks(&inode, o_blocks_count, add);
+		if (test_opt(sb, DEBUG))
+			printk("EXT2-fs: ext2_resize_fs: added %lu new blocks "
+			       "to %lu blocks in last group\n",
+			       add, o_blocks_count);
+		lock_super(sb);
+	}
+
+	/*
+	 * Update superblock with remaining new group block/inode counts
+	 */
+	for (i =3D o_groups_count; i < EXT2_SB(sb)->s_groups_count &&
+	     !(err =3D ext2_update_group(sb, i, reserved, resgdt)); i++)
+		/* empty loop */;
+
+	if (err || le32_to_cpu(es->s_blocks_count) !=3D n_blocks_count) {
+		ext2_warning(sb, __FUNCTION__,
+			     "specified size does not match new block count "
+			     "(%lu !=3D %u) (err %d)", n_blocks_count,
+			     le32_to_cpu(es->s_blocks_count), err);
+		EXT2_SB(sb)->s_mount_state &=3D ~EXT2_VALID_FS;
+	} else
+		EXT2_SB(sb)->s_mount_state |=3D EXT2_VALID_FS;
+
+	return err;
+} /* ext2_resize_fs */
+#else  /* !CONFIG_EXT2_RESIZE */
+#define ext2_resize_fs(sb, es, n_blocks_count, resgdt) 0
+#endif /* CONFIG_EXT2_RESIZE */
+
 #define log2(n) ffz(~(n))
 =20
 /*
@@ -409,8 +700,7 @@
 	unsigned long offset =3D 0;
 	kdev_t dev =3D sb->s_dev;
 	int blocksize =3D BLOCK_SIZE;
-	int db_count;
-	int i, j;
+	int i;
=20
 	/*
 	 * See what the current blocksize for the device is, and
@@ -425,7 +715,7 @@
=20
 	sb->u.ext2_sb.s_mount_opt =3D 0;
 	if (!parse_options ((char *) data, &sb_block, &resuid, &resgid,
-	    &sb->u.ext2_sb.s_mount_opt)) {
+	    &sb->u.ext2_sb.s_mount_opt, NULL, NULL)) {
 		return NULL;
 	}
=20
@@ -596,32 +886,6 @@
 		goto failed_mount;
 	}
=20
-	sb->u.ext2_sb.s_groups_count =3D (le32_to_cpu(es->s_blocks_count) -
-				        le32_to_cpu(es->s_first_data_block) +
-				       EXT2_BLOCKS_PER_GROUP(sb) - 1) /
-				       EXT2_BLOCKS_PER_GROUP(sb);
-	db_count =3D (sb->u.ext2_sb.s_groups_count + EXT2_DESC_PER_BLOCK(sb) - 1)=
 /
-		   EXT2_DESC_PER_BLOCK(sb);
-	sb->u.ext2_sb.s_group_desc =3D kmalloc (db_count * sizeof (struct buffer_=
head *), GFP_KERNEL);
-	if (sb->u.ext2_sb.s_group_desc =3D=3D NULL) {
-		printk ("EXT2-fs: not enough memory\n");
-		goto failed_mount;
-	}
-	for (i =3D 0; i < db_count; i++) {
-		sb->u.ext2_sb.s_group_desc[i] =3D sb_bread(sb, logic_sb_block + i + 1);
-		if (!sb->u.ext2_sb.s_group_desc[i]) {
-			for (j =3D 0; j < i; j++)
-				brelse (sb->u.ext2_sb.s_group_desc[j]);
-			kfree(sb->u.ext2_sb.s_group_desc);
-			printk ("EXT2-fs: unable to read group descriptors\n");
-			goto failed_mount;
-		}
-	}
-	if (!ext2_check_descriptors (sb)) {
-		printk ("EXT2-fs: group descriptors corrupted!\n");
-		db_count =3D i;
-		goto failed_mount2;
-	}
 	for (i =3D 0; i < EXT2_MAX_GROUP_LOADED; i++) {
 		sb->u.ext2_sb.s_inode_bitmap_number[i] =3D 0;
 		sb->u.ext2_sb.s_inode_bitmap[i] =3D NULL;
@@ -630,11 +894,18 @@
 	}
 	sb->u.ext2_sb.s_loaded_inode_bitmaps =3D 0;
 	sb->u.ext2_sb.s_loaded_block_bitmaps =3D 0;
-	sb->u.ext2_sb.s_gdb_count =3D db_count;
 	/*
 	 * set up enough so that it can read an inode
 	 */
 	sb->s_op =3D &ext2_sops;
+	sb->u.ext2_sb.s_group_desc =3D NULL;
+	sb->u.ext2_sb.s_groups_count =3D 0;
+	sb->u.ext2_sb.s_gdb_count =3D 0;
+	if ((i =3D ext2_read_descriptors(sb, le32_to_cpu(es->s_blocks_count)))) {
+		ext2_error(sb, __FUNCTION__,
+			   "group descriptor error %d, unable to mount", i);
+		goto failed_mount;
+	}
 	sb->s_root =3D d_alloc_root(iget(sb, EXT2_ROOT_INO));
 	if (!sb->s_root || !S_ISDIR(sb->s_root->d_inode->i_mode) ||
 	    !sb->s_root->d_inode->i_blocks || !sb->s_root->d_inode->i_size) {
@@ -649,7 +920,7 @@
 	ext2_setup_super (sb, es, sb->s_flags & MS_RDONLY);
 	return sb;
 failed_mount2:
-	for (i =3D 0; i < db_count; i++)
+	for (i =3D 0; i < sb->u.ext2_sb.s_gdb_count; i++)
 		brelse(sb->u.ext2_sb.s_group_desc[i]);
 	kfree(sb->u.ext2_sb.s_group_desc);
 failed_mount:
@@ -709,6 +980,8 @@
 	struct ext2_super_block * es;
 	unsigned short resuid =3D sb->u.ext2_sb.s_resuid;
 	unsigned short resgid =3D sb->u.ext2_sb.s_resgid;
+	unsigned long n_blocks_count =3D 0;
+	unsigned long resgdt =3D 0;
 	unsigned long new_mount_opt;
 	unsigned long tmp;
=20
@@ -717,14 +990,16 @@
 	 */
 	new_mount_opt =3D sb->u.ext2_sb.s_mount_opt;
 	if (!parse_options (data, &tmp, &resuid, &resgid,
-			    &new_mount_opt))
+			    &new_mount_opt, &n_blocks_count, &resgdt))
 		return -EINVAL;
=20
 	sb->u.ext2_sb.s_mount_opt =3D new_mount_opt;
 	sb->u.ext2_sb.s_resuid =3D resuid;
 	sb->u.ext2_sb.s_resgid =3D resgid;
 	es =3D sb->u.ext2_sb.s_es;
-	if ((*flags & MS_RDONLY) =3D=3D (sb->s_flags & MS_RDONLY))
+	if ((*flags & MS_RDONLY) =3D=3D (sb->s_flags & MS_RDONLY) &&
+	    (n_blocks_count =3D=3D 0 ||
+	     n_blocks_count =3D=3D le32_to_cpu(es->s_blocks_count)))
 		return 0;
 	if (*flags & MS_RDONLY) {
 		if (le16_to_cpu(es->s_state) & EXT2_VALID_FS ||
@@ -751,6 +1026,8 @@
 		 * by e2fsck since we originally mounted the partition.)
 		 */
 		sb->u.ext2_sb.s_mount_state =3D le16_to_cpu(es->s_state);
+		if ((ret =3D ext2_resize_fs(sb, es, n_blocks_count, resgdt)))
+			return ret;
 		if (!ext2_setup_super (sb, es, 0))
 			sb->s_flags &=3D ~MS_RDONLY;
 	}
diff -ru linux-2.4.18.orig/include/linux/ext2_fs.h linux/include/linux/ext2=
_fs.h
--- linux-2.4.18.orig/include/linux/ext2_fs.h	Thu Nov 22 11:46:52 2001
+++ linux/include/linux/ext2_fs.h	Wed Jun 19 14:56:34 2002
@@ -26,6 +26,7 @@
  * Define EXT2FS_DEBUG to produce debug messages
  */
 #undef EXT2FS_DEBUG
+#define CONFIG_EXT2_CHECK
=20
 /*
  * Define EXT2_PREALLOCATE to preallocate data blocks for expanding files
@@ -61,6 +62,7 @@
 #define EXT2_ACL_DATA_INO	 4	/* ACL inode */
 #define EXT2_BOOT_LOADER_INO	 5	/* Boot loader inode */
 #define EXT2_UNDEL_DIR_INO	 6	/* Undelete directory inode */
+#define EXT2_RESIZE_INO		 7	/* Reserved group descriptors inode */
=20
 /* First non-reserved inode for old ext2 filesystems */
 #define EXT2_GOOD_OLD_FIRST_INO	11

--=-lTp18A6c8Yw5jzKSpGk1--
