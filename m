Return-Path: <johannjh@iafrica.com>
From: "Johann" <johannjh@iafrica.com>
Subject: RE: [linux-lvm] Strtup probs !
Date: Tue, 17 Jul 2001 19:36:08 +0200
Message-ID: <FDEJIMPDHJAAPNLFKBMGEELJCEAA.johannjh@iafrica.com>
In-reply-to: <0GGM00EWJ7ZIWI@smtp08.iafrica.com>
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
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: linux-lvm@sistina.com, ahiam@hotmail.com

As I promised....

cd /etc/rc.d
cp -a rc.S rc.S.old
patch -p0 <rc.S.diff

The cp part to make a backup in case.

Theo
----- snip snip file: rc.S.diff---------------
--- rc.S.or	Tue Jul 17 18:11:20 2001
+++ rc.S	Tue Jul 17 17:57:36 2001
@@ -4,6 +4,7 @@
 #
 # Mostly written by:  Patrick J. Volkerding, <volkerdi@slackware.com>
 #
+# Added LVM support <tgs@iafrica.com>

 PATH=/sbin:/usr/sbin:/bin:/usr/bin

@@ -28,19 +29,21 @@
   READWRITE=yes
 fi

+
 # Check the integrity of all filesystems
 if [ ! $READWRITE = yes ]; then
-  /sbin/fsck -A -a
+  /sbin/fsck -a /
+  # Check only the root fs first, but no others
   # If there was a failure, drop into single-user mode.
   if [ $? -gt 1 ] ; then
     echo
     echo
-    echo "*******************************************************"
-    echo "*** An error occurred during the file system check. ***"
-    echo "*** You will now be given a chance to log into the  ***"
-    echo "*** system in single-user mode to fix the problem.  ***"
-    echo "*** Running 'e2fsck -v -y <partition>' might help.  ***"
-    echo "*******************************************************"
+    echo "************************************************************"
+    echo "*** An error occurred during the root file system check. ***"
+    echo "*** You will now be given a chance to log into the       ***"
+    echo "*** system in single-user mode to fix the problem.       ***"
+    echo "*** Running 'e2fsck -v -y <partition>' might help.       ***"
+    echo "************************************************************"
     echo
     echo "Once you exit the single-user shell, the system will reboot."
     echo
@@ -82,6 +85,44 @@
     echo -n "get into your machine and start looking for the problem. "
     read junk;
   fi
+  # okay / fs is clean, and mounted as rw
+  # This was an addition, limits vgscan to /proc thus
+  # speeding up the scan immensely.
+  /sbin/mount /proc
+
+  # Initialize Logical Volume Manager
+  /sbin/vgscan
+  /sbin/vgchange -ay
+
+  /sbin/fsck -A -a -R
+  #Check all the other filesystem, including the LVM's, excluding /
+
+  # If there was a failure, drop into single-user mode.
+  if [ $? -gt 1 ] ; then
+    echo
+    echo
+    echo "*******************************************************"
+    echo "*** An error occurred during the file system check. ***"
+    echo "*** You will now be given a chance to log into the  ***"
+    echo "*** system in single-user mode to fix the problem.  ***"
+    echo "*** Running 'e2fsck -v -y <partition>' might help.  ***"
+    echo "*** The root filesystem is ok and mounted readwrite ***"
+    echo "*******************************************************"
+    echo
+    echo "Once you exit the single-user shell, the system will reboot."
+    echo
+
+    PS1="(Repair filesystem) \#"; export PS1
+    sulogin
+
+    echo "Unmounting file systems."
+    umount -a -r
+    mount -n -o remount,ro /
+    echo "Rebooting system."
+    sleep 2
+    reboot
+  fi
+
 else
   echo "Testing filesystem status: read-write filesystem"
   if cat /etc/fstab | grep ' / ' | grep umsdos 1> /dev/null 2> /dev/null ;
then
@@ -111,14 +152,16 @@
     echo -n "Press ENTER to continue. "
     read junk;
   fi
+
 fi

+
 # remove /etc/mtab* so that mount will create it with a root entry
 /bin/rm -f /etc/mtab* /etc/nologin /etc/shutdownpid

 # mount file systems in fstab (and create an entry for /)
 # but not NFS or SMB because TCP/IP is not yet configured
-/sbin/mount -a -v -t nonfs,nosmbfs
+/sbin/mount -a -v -t nonfs,nosmbfs,proc

 # Clean up temporary files on the /var volume:
 /bin/rm -f /var/run/utmp /var/run/*.pid /var/log/setup/tmp/*
--snip snip snip end of file---------------


-----Original Message-----
From: linux-lvm-admin@sistina.com [mailto:linux-lvm-admin@sistina.com]On
Behalf Of tgs@iafrica.com
Sent: 17 July 2001 01:27
To: linux-lvm@sistina.com; ahiam@hotmail.com
Cc: tgs@iafrica.com
Subject: Re: [linux-lvm] Strtup probs !


I had the same experience. The lvm-how to needs to be updated (changes in
the
boot scripts for slackware). You going to have to change the rc.S file. I
will
prepare a patch for this tonight and post on the mail list, as well email it
to
you.

In the mean time I can explain the problem to you. Currently the rc.S in
slackware (I'm using version 8.0) does the following:
1. Mount to root partition as ro (read-only).
2. fsck all the filesystems in /etc/fstab. If one of them are a LVM
partition
fsck can't talk to that  then it can't fsck that filesystem and exits with
an
error - you then go into admin mode. In order for fsck to be able to check
those filesystem you have to activate the volumes (i.e. vgchange -ay). To
the
problem is that you can only run vgchange -ya if the root partition is
mounted
rw. So you have a chicken-egg situation here.

My solution is:
1. mount the root partition as read-only.
2. run fsck -a /
3. remount the root partition as read-write
4. run vgscan and vgchange -ay
5. run fsck -A -a -R     (will check all the fs but not the root, because it
is
already been checked and mounted read-write)


I havnn't converted my root partition on a LVM yet. I don't intent to do
that
not before I very sure that LVM 1.0 is released and stable.

I'm sure quota should work. I might be under correction but quota will work
for
the filesystem, in your case /home is ext2 and should work.

Theo


> hi all,
>
> i need help with the following probs 'm facing.....
> my system is--->  512MB, 500Mhz, 3 scsi, Compaq server with 7.0 Slackware
> upgradded packages with latest from Slackware & kernel 2.4.6 ( with LVM as
> module)
> 1) could not start LVM with /etc/fstab entries !   ;-(
>     i have created initrd.gz & have done exactly as stated in HOW-TO to
> start LVM at startup ( i'm doing it only on my /home ).
>     if i dont put entries on my /etc/fstab ( for home & LVM) then it works
> ok, but sooner i put it there on boot there is an error of  something swap
> disk which takes me to administrative mode !!!!.. my /etc/fstab enrty is
> /dev/VGmail/LVmail    /home    ext2    defaults    1    1
>
> 2) can quota be implimented with LVM  for eg on my /home .. ??
>
> 3) how to have root partion on LVM.
>     i tried to do that too like in the HOW-TO & did dd on an empty
partion.
> but when i tried to convert root partion to LVM  i got errors.. so can
> anyone tell me the actual steps pls !
>
> pls excuse me for my english
> thanxs in advance...
> arindam haldar
> _______________________________________________
> linux-lvm mailing list
> linux-lvm@sistina.com
> http://lists.sistina.com/mailman/listinfo/linux-lvm
> read the LVM HOW-TO at http://www.sistina.com/lvm/Pages/howto.html


---------------------------------------------
This message was sent using M-Web Airmail.
http://airmail.mweb.co.za/


_______________________________________________
linux-lvm mailing list
linux-lvm@sistina.com
http://lists.sistina.com/mailman/listinfo/linux-lvm
read the LVM HOW-TO at http://www.sistina.com/lvm/Pages/howto.html
