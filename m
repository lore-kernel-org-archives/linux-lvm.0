Received: from mx3.redhat.com (mx3.redhat.com [172.16.48.32])
	by int-mx1.corp.redhat.com (8.13.1/8.13.1) with ESMTP id m6FJ0sDN005257
	for <linux-lvm@redhat.com>; Tue, 15 Jul 2008 15:00:54 -0400
Received: from mendel.bio.caltech.edu (mendel.bio.caltech.edu [131.215.12.38])
	by mx3.redhat.com (8.13.8/8.13.8) with ESMTP id m6FJ0iuF022592
	for <linux-lvm@redhat.com>; Tue, 15 Jul 2008 15:00:44 -0400
Received: from nobody by mendel.bio.caltech.edu with local (Exim 4.63)
	(envelope-from <mathog@caltech.edu>) id 1KIplT-0007TT-Py
	for linux-lvm@redhat.com; Tue, 15 Jul 2008 12:00:43 -0700
From: "David Mathog" <mathog@caltech.edu>
MIME-Version: 1.0
Message-Id: <E1KIplT-0007TT-Py@mendel.bio.caltech.edu>
Date: Tue, 15 Jul 2008 12:00:43 -0700
Subject: [linux-lvm] UPS shutdown on system with lvm volume for root
Reply-To: LVM general discussion and development <linux-lvm@redhat.com>
List-Id: LVM general discussion and development <linux-lvm.redhat.com>
List-Unsubscribe: <https://www.redhat.com/mailman/listinfo/linux-lvm>,
	<mailto:linux-lvm-request@redhat.com?subject=unsubscribe>
List-Archive: <https://www.redhat.com/archives/linux-lvm>
List-Post: <mailto:linux-lvm@redhat.com>
List-Help: <mailto:linux-lvm-request@redhat.com?subject=help>
List-Subscribe: <https://www.redhat.com/mailman/listinfo/linux-lvm>,
	<mailto:linux-lvm-request@redhat.com?subject=subscribe>
List-Id: <linux-lvm.redhat.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: linux-lvm@redhat.com

I am trying to use nut on a Centos 5.0 system. On this system "/" is a
1.4 Tb LVM volume composed of two 700Gb partitions (striped). Nut is set
up completely except for the final modification to the /etc/init.d/halt
script. So far I have made this change:

< command=/sbin/halt
< if [ -f /var/run/killpower -a -r /etc/ups/upsmon.conf -a -f
/etc/sysconfig/ups ] ; then
< /usr/local/ups/sbin/upsdrvctl shutdown
---
> if [ "$command" = /sbin/halt -a -r /etc/ups/upsmon.conf -a -f
/etc/killpower -a -f /etc/sysconfig/ups ] ; then
> . /etc/sysconfig/ups
> if [ "$SERVER" = "yes" -a "$MODEL" = "upsdrvctl" ] ; then
> /sbin/upsdrvctl shutdown
> elif [ "$SERVER" = "yes" -a "$MODEL" != "NONE" -a -n "$MODEL" -a -n
"$DEVICE" ] ; then
> $MODEL $OPTIONS_HALT -k $DEVICE
> fi

However, I'm worried that this might corrupt the LVM metadata.  The
"upsdrvctl shutdown" is equivalent to pulling the server's power cord
out. Because of this, elsewhere in the nut documentation it suggested doing

mdadm --readonly <device>

before the upsdrvctl shutdown. However, I do not believe that the
present system is using mdadm. 

Is a similar command necessary for lvm? Or will the lvm volume have been
remounted readonly "automagically" by this section of the halt script,
which precedes the above changes by a couple of lines?

# Remount read only anything that's left mounted.
# echo $"Remounting remaining filesystems readonly"
mount | awk '{ print $3 }' | while read line; do
fstab-decode mount -n -o ro,remount $line
done

It is important that the logical volume is shut down nicely on a power
failure event, since it takes a very long time to fsck it, and that
should not be needed when power is restored from a controlled UPS
initiated shutdown. Additionally, swap is also a logical volume, so it
might need special attention too. 

In a normal shutdown the upsdrvctl is never called and the halt proceeds to:
--------------------

# First, try kexec. If that fails, fall back to rebooting the old way.
[ -n "$kexec_command" ] && $kexec_command -e >& /dev/null

HALTARGS="-d"
[ -f /poweroff -o ! -f /halt ] && HALTARGS="$HALTARGS -p"

exec $command $HALTARGS

---------------------------

Is anything in there required for the lvm to be seen as clean on the
next boot???

Thanks,

David Mathog
mathog@caltech.edu
Manager, Sequence Analysis Facility, Biology Division, Caltech
