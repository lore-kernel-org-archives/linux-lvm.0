Return-Path: <vherva@niksula.hut.fi>
Date: Thu, 28 Jun 2001 15:06:18 +0300
From: Ville Herva <vherva@niksula.hut.fi>
Message-ID: <20010628150618.A21760@niksula.cs.hut.fi>
References: <20010621203303.A14617@niksula.cs.hut.fi>
Mime-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20010621203303.A14617@niksula.cs.hut.fi>; from vherva@niksula.cs.hut.fi on Thu, Jun 21, 2001 at 08:33:03PM +0300
Subject: [linux-lvm] [SOLVED,RFC] Re: Problems with lvm root
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
Cc: Markus Kemppinen <markus.kemppinen@viasys.com>

On Thu, Jun 21, 2001 at 08:33:03PM +0300, you [Ville Herva] claimed:
> I'm unable to boot with lvm root. The boot process halts with these
> messages:
> 
> VFS: Mounted root (ext2 filesystem).
> 
> vgscan -- reading all physical volumes (this may take a while...)
> vgscan -- found inactive volume group "scratch"
> vgscan -- found inactive volume group "root-stripe"
> vgscan -- ERROR 6 writing volume group backup file
> /etc/lvmtab.d/root-stripe.tmp in vg_cfgbackup.c [line 266]
> vgscan -- ERROR: unable to do a backup of volume group "root-stripe"
> vgscan -- ERROR "lvm_tab_vg_remove(): unlink" removing volume group
> "root-stripe" from "/etc/lvmtab"
> vgscan -- ERROR "lvm_tab_vg_remove(): unlink" creating "/etc/lvmtab" and
> "/etc/lvmtab.d"
> 
> vgchange -- volume group "scratch" successfully activated
> 
> VFS: Cannot open root device "3a01" or 3a:01
> Please append a correct "root=" boot option
> Kernel panic: VFS: Unable to mount root fs on 3a:01

It seems that the problem was caused by insufficient space on the initrd
image. I added some debug (df -h) to the linuxrc and to vgscan source. This
is what it gave:

Filesystem    Type    Size  Used Avail Use% Mounted on
/dev/ram1     ext2    3.0M  2.6M  449k  86% /
vgscan -- removing "/etc/lvmtab" and "/etc/lvmtab.d"
vgscan -- creating empty "/etc/lvmtab" and "/etc/lvmtab.d"
vgscan -- reading all physical volumes (this may take a while...)
vgscan -- scanning for all active volume group(s) first
vgscan -- found inactive volume group "scratch"
vgscan -- reading data of volume group "scratch" from physical volume(s)
vgscan -- inserting "scratch" into lvmtab
vgscan -- backing up volume group "scratch"
vgscan -- checking volume group name "scratch"
vgscan -- checking volume group consistency of "scratch"
vgscan -- checking existence of "/etc/lvmtab.d"
vgscan -- storing volume group data of "scratch" in
"/etc/lvmtab.d/scratch.tmp"
vgscan -- storing physical volume data of "scratch" in
"/etc/lvmtab.d/scratch.tmp"
vgscan -- storing logical volume data of volume group "scratch" in
"/etc/lvmtab.d/scratch.tmp"
vgscan -- renaming "/etc/lvmtab.d/scratch.tmp" to "/etc/lvmtab.d/scratch"
vgscan -- removing special files and directory for volume group "scratch"
vgscan -- creating directory and group character special file for "scratch"
vgscan -- creating block device special files for scratch
vgscan -- found inactive volume group "root-stripe"
vgscan -- reading data of volume group "root-stripe" from physical volume(s)
vgscan -- inserting "root-stripe" into lvmtab
vgscan -- backing up volume group "root-stripe"
vgscan -- checking volume group name "root-stripe"
vgscan -- checking volume group consistency of "root-stripe"
vgscan -- checking existence of "/etc/lvmtab.d"
vgscan -- storing volume group data of "root-stripe" in
"/etc/lvmtab.d/root-stripe.tmp"
vgscan -- storing physical volume data of "root-stripe" in
"/etc/lvmtab.d/root-stripe.tmp"
vgscan -- storing logical volume data of volume group "root-stripe" in
"/etc/lvmtab.d/root-stripe.tmp"
vgscan -- ERROR 6 (n=48100) writing volume group backup file
/etc/lvmtab.d/root-stripe.tmp in vg_cfgbackup.c [line 267]
vgscan -- ERROR: unable to do a backup of volume group "root-stripe"
vgscan -- ERROR "lvm_tab_vg_remove(): unlink" removing volume group
"root-stripe" from "/etc/lvmtab"
vgscan -- ERROR "lvm_tab_vg_remove(): unlink" creating "/etc/lvmtab" and
"/etc/l
vmtab.d"

Filesystem    Type    Size  Used Avail Use% Mounted on
/dev/ram1     ext2    3.0M  2.9M  131k  96% /
vgchange -- volume group "scratch" successfully activated


So clearly vgscan / vg_cfgbackup.c tried to write more data that fitted onto
initrd. write returned n=48100, which is less than vgscan tried to write,
but not and error. The relevant piece from vg_cfgbackup.c:

#define VGCFG_WRITE( handle, what, size, file_name) ( { \
      unsigned int this_size = size; \
      if ( write ( handle, &this_size, sizeof ( this_size)) != \
           sizeof ( this_size)) { \
         fprintf ( stderr, "%s -- ERROR %d writing structure size to volume
" \
                           "group backup file %s in %s [line %d]\n", \
                           cmd, errno, file_name, __FILE__, __LINE__); \
         close ( handle); \
         unlink ( file_name); \
         ret = -LVM_EVG_CFGBACKUP_WRITE; \
         goto vg_cfgbackup_end; \
      }; \
      if ( write ( handle, what, size) != size) { \
         fprintf ( stderr, "%s -- ERROR %d (n=%i) writing volume group
backup "
\
                           "file %s in %s [line %d]\n", \
                           cmd, errno, file_name, __FILE__, __LINE__); \
         close ( handle); \
         unlink ( file_name); \
         ret = -LVM_EVG_CFGBACKUP_WRITE; \
         goto vg_cfgbackup_end; \
      }; \
} )


Because write didn't return error, errno was essentially uninitialized (6 in
this case), and the error value ("No such device or address") confused the
heck out of me.

I did

head -c 8m /dev/zero > initrd
mkfs -m 0 -N 15000 -f 2808 -g 888 initrd
mount -o loop initrd initrd-mount
cp -ax initrd-orig-mount initrd-mount
umount initrd-mount 
gzip -9 initrd

and rebooted. Now everything worked.

Since I suspect this is quite a common problem, the error message could be
more informative. Perhaps something like


--- vg_cfgbackup.c-orig Thu Jun 28 14:43:57 2001
+++ vg_cfgbackup.c      Thu Jun 28 14:54:37 2001
@@ -52,6 +52,7 @@

 #define        VGCFG_WRITE( handle, what, size, file_name) ( { \
       unsigned int this_size = size; \
+      int n; \
       if ( write ( handle, &this_size, sizeof ( this_size)) != \
            sizeof ( this_size)) { \
          fprintf ( stderr, "%s -- ERROR %d writing structure size to volume" \
@@ -62,10 +63,15 @@
          ret = -LVM_EVG_CFGBACKUP_WRITE; \
          goto vg_cfgbackup_end; \
       }; \
-      if ( write ( handle, what, size) != size) { \
-         fprintf ( stderr, "%s -- ERROR %d writing volume group backup " \
-                           "file %s in %s [line %d]\n", \
-                           cmd, errno, file_name, __FILE__, __LINE__); \
+      if ( ( n = write ( handle, what, size)) != size) { \
+         if (n >= 0)
+            fprintf ( stderr, "%s -- ERROR (short write) writing " \
+                              "volume group backup file %s in %s " \
+                              "[line %d] (File system full?)\n", \
+                              cmd, file_name, __FILE__, __LINE__); \
+         else
+            fprintf ( stderr, "%s -- ERROR %d writing volume group backup " \
+                              "file %s in %s [line %d]\n", \
+                              cmd, file_name, __FILE__, __LINE__); \
          close ( handle); \
          unlink ( file_name); \
          ret = -LVM_EVG_CFGBACKUP_WRITE; \



I might be a good idea to loop on write until it return 0 or error (although
short writes may be guaranteed not to happen on regular files on linux).
 
Also, lvmcreate_initrd might put some more headroom in the initrd to prevent
this from happening.


-- v --

v@iki.fi
