From: Andreas Dilger <adilger@turbolabs.com>
Date: Wed, 19 Sep 2001 16:51:34 -0600
Subject: Re: [linux-lvm] LVM
Message-ID: <20010919165134.R14526@turbolinux.com>
References: <NBBBJHKIOKPKOGOEPEDPAEEJDNAA.stuart@bh90210.net> <3BA0AE16.1A4F69F@carolina.rr.com> <87u1xzv3gm.fsf@arm.t19.ds.pwr.wroc.pl>
Mime-Version: 1.0
Content-Disposition: inline
In-Reply-To: <87u1xzv3gm.fsf@arm.t19.ds.pwr.wroc.pl>
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

On Sep 19, 2001  13:12 +0200, Arkadiusz Miskiewicz wrote:
> > you MUST run lvmcreate_initrd and use the initrd it creates if you run
> > an LVM root fs.
> btw. lvmcreate_initrd is broken. It copies /bin/bash and /bin/sh while
> on some systems /bin/sh is link to /bin/othershell (like /bin/ksh on
> my systems), so initrd created by lvmcreate_initrd is not usable on
> these machines.

Please try the below patch.  If it works I can check it into CVS.

Cheers, Andreas
====================  initrd-1.0.1.diff  ==========================
diff -u -r1.12 lvmcreate_initrd
--- tools/lvmcreate_initrd	2001/08/30 18:57:31	1.12
+++ tools/lvmcreate_initrd	2001/09/19 22:50:03
@@ -135,7 +135,7 @@
 
 # The size of the ramdisk is automatically calculated unless this is set
 #INITRDSIZE=
-INITRDFILES="/sbin/vgchange /sbin/vgscan /bin/bash /bin/mount /bin/umount /bin/sh /bin/rm"
+INITRDFILES="/sbin/vgchange /sbin/vgscan /bin/mount /bin/umount /bin/rm"
 
 if [ "$USEMOD" ]; then
    # Check for an LVM module, otherwise it must be compiled into the kernel
@@ -343,6 +343,13 @@
 find $INITRDFILES | cpio -pdm $OPT_Q $TMPMNT
 if [ $? -ne 0 ]; then
    echo "$cmd -- ERROR cpio to ram disk"
+   cleanup 1
+fi
+
+# Copy /bin/sh directly to avoid issues with symlinks
+cp -p /bin/sh $TMPMNT/bin/sh
+if [ $? -ne 0 ]; then
+   echo "$cmd -- ERROR copying /bin/sh to ram disk"
    cleanup 1
 fi
--
Andreas Dilger  \ "If a man ate a pound of pasta and a pound of antipasto,
                 \  would they cancel out, leaving him still hungry?"
http://www-mddsp.enel.ucalgary.ca/People/adilger/               -- Dogbert
