Received: from mx2.redhat.com (mx2.redhat.com [10.255.15.25])
	by int-mx2.corp.redhat.com (8.13.1/8.13.1) with ESMTP id l4U77Mmh005926
	for <linux-lvm@redhat.com>; Wed, 30 May 2007 03:07:23 -0400
Received: from acheron.ifi.lmu.de (acheron.ifi.lmu.de [129.187.214.135])
	by mx2.redhat.com (8.13.1/8.13.1) with ESMTP id l4U77Hbn025244
	for <linux-lvm@redhat.com>; Wed, 30 May 2007 03:07:17 -0400
Message-ID: <465D229E.5080809@bio.ifi.lmu.de>
Date: Wed, 30 May 2007 09:07:10 +0200
From: Frank Steiner <fsteiner-mail1@bio.ifi.lmu.de>
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Subject: [linux-lvm] Stale NFS handles on LVM2
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
To: nfs@lists.sourceforge.net, linux-lvm@redhat.com

Hi,

I'm not sure if this is a NFS or LVM issue, so I cross-post this.
We get stale NFS handles on a LVM2 volume in the following scenario:

- The NFS server is running SLES10/kernel 2.6.16, but it happens
  with 2.6.21, too

- the server has /dev/sda, a built-in SCSI disk, with
  /dev/sda7 a LVM2 volume, say "exportlvm"

- due to module order in the initrd sda is always sda

- exportlvm is exported to the NFS clients

- the server has 4 fibre-channel raids connected, those have
  several partitions and two of the raids have LVM2 filesystems.

- the server doesn't mount or export any of the FC filesystems

Now, when we shutdown the fc port of the server or remove the fc cable, so 
that all the fc filesystems disappear, and then reboot the server,
the NFS client gets stale NFS handles on the "exportlvm". When we reboot
the client and then reconnect the FC cable or port and reboot the server
again, the stale NFS handles show up again.

When we change /dev/sda7 from a LVM2 to a normal fs, there are no stale 
NFS handles when rebooting the server in this way. 

Looks like rebooting the server after dis-/connecting the FC raids with
their LVMs somehow changes sth. on the LVM2 on /dev/sda7, like the minor
numbers etc. Is that possible? Is it a bug? Indeed the "exportlvm" is 
the last in the list when calling "vgscan" with the FC raids connected.

Is there a way I can ensure that things like minor numbers (or whatever
could cause these stales) are persistent on the "exportlvm"?

cu,
Frank
-- 
Dipl.-Inform. Frank Steiner   Web:  http://www.bio.ifi.lmu.de/~steiner/
Lehrstuhl f. Bioinformatik    Mail: http://www.bio.ifi.lmu.de/~steiner/m/
LMU, Amalienstr. 17           Phone: +49 89 2180-4049
80333 Muenchen, Germany       Fax:   +49 89 2180-99-4049
* Rekursion kann man erst verstehen, wenn man Rekursion verstanden hat. *
