Received: from mx1.redhat.com (mx1.redhat.com [172.16.48.31])
	by int-mx1.corp.redhat.com (8.11.6/8.11.6) with SMTP id i1DE6Ti16887
	for <linux-lvm@redhat.com>; Fri, 13 Feb 2004 09:06:29 -0500
Received: from sbbmail1.sbb.ch (sbbmail1.sbb.ch [193.192.251.19])
	by mx1.redhat.com (8.11.6/8.11.6) with SMTP id i1DE6Sb23241
	for <linux-lvm@redhat.com>; Fri, 13 Feb 2004 09:06:28 -0500
Received: from intmail2.sbb.ch (intmail2.sbb.ch [10.104.85.251])
	by sbbmail1.sbb.ch (Switch-3.1.4/Switch-3.1.0) with ESMTP id i1DE6G0v013184
	(version=TLSv1/SSLv3 cipher=EDH-RSA-DES-CBC3-SHA bits=168 verify=FAIL)
	for <linux-lvm@redhat.com>; Fri, 13 Feb 2004 15:06:16 +0100
Received: from gmx.net (i34390.sbb.ch [147.78.17.245])
	by intmail2.sbb.ch (Switch-3.1.4/Switch-3.1.0) with ESMTP id i1DE6G9i027487
	for <linux-lvm@redhat.com>; Fri, 13 Feb 2004 15:06:16 +0100
Message-ID: <402CD9D6.5CAAA796@gmx.net>
From: Thomas Meller <thomas.meller@gmx.net>
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Subject: [linux-lvm] Volume groups on SAN storage
Sender: linux-lvm-admin@redhat.com
Errors-To: linux-lvm-admin@redhat.com
Reply-To: linux-lvm@redhat.com
List-Help: <mailto:linux-lvm-request@redhat.com?subject=help>
List-Post: <mailto:linux-lvm@redhat.com>
List-Subscribe: <https://www.redhat.com/mailman/listinfo/linux-lvm>,
	<mailto:linux-lvm-request@redhat.com?subject=subscribe>
List-Id: LVM general discussion and development <linux-lvm.redhat.com>
List-Unsubscribe: <https://www.redhat.com/mailman/listinfo/linux-lvm>,
	<mailto:linux-lvm-request@redhat.com?subject=unsubscribe>
List-Archive: <https://www.redhat.com/archives/linux-lvm/>
Date: Fri Feb 13 09:05:33 2004
List-Id: <linux-lvm.redhat.com>
Content-Type: text/plain; charset="us-ascii"
To: linux-lvm@redhat.com

Hello everybody,

recently (today) I had a problem.

I'm trying to create a HA Cluster for a DCE server.
This is difficult work and sometimes very confusing.

My goal is to make it bootable from a SAN.
So far I managed to install GRUB and boot the machine. The rootfs and the rest can be
mounted.
I found, then, that the SCSI-devices inside one of my volume groups were the wrong ones.

What is special about that is that the same content on a device can be seen on different
SCSI-devices. This is due to some mirroring within the storage sytems. I cannot avoid that.

Now, I have a readonly physical volume inside one of my volume groups. I want to insert the
writeable mirror and get rid of the readonly.
AFAICS this is not possible because I cannot force vgscan to insert a specified SCSI-device.
Of course the VGDA is marked "part of VG xxx" and cannot be written anymore. So it cannot be
imported nor exported or added to a new VG.

Maybe there is an option anywhere how to scan a particular device. 

Does anybody know how to trick LVM?
Is there a hexeditor to patch the VGDA backups to use different /dev/sdXX devices?
And if so, does that help?

I'm using redhat 8.0 and I'm bound to that version.

TIA

Thomas

-- 
Thomas Meller
mailto: thomas.meller@t-systems.ch
mailto: thomas.meller@gmx.net
----
...Our continuing mission: To seek out knowledge of C, to explore strange
UNIX commands, and to boldly code where no one has had a man page before.
