Received: from mx2.redhat.com (mx2.redhat.com [10.255.15.25])
	by int-mx2.corp.redhat.com (8.13.1/8.13.1) with ESMTP id l4O0LDDU002567
	for <linux-lvm@redhat.com>; Wed, 23 May 2007 20:21:14 -0400
Received: from ms-smtp-02.southeast.rr.com (ms-smtp-02.southeast.rr.com
	[24.25.9.101])
	by mx2.redhat.com (8.13.1/8.13.1) with ESMTP id l4O0LAiS015160
	for <linux-lvm@redhat.com>; Wed, 23 May 2007 20:21:10 -0400
Received: from monsterjam.org (cpe-071-070-174-094.nc.res.rr.com
	[71.70.174.94])
	by ms-smtp-02.southeast.rr.com (8.13.6/8.13.6) with ESMTP id
	l4NNjQd8026636
	for <linux-lvm@redhat.com>; Wed, 23 May 2007 19:45:26 -0400 (EDT)
Date: Wed, 23 May 2007 19:45:26 -0400
From: jason@monsterjam.org
Subject: Re: [linux-lvm] lvm upgrade problems.
Message-ID: <20070523234525.GC21463@monsterjam.org>
References: <20070523005108.GB14085@monsterjam.org>
	<1179929417.5276.10.camel@merlin.Mines.EDU>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <1179929417.5276.10.camel@merlin.Mines.EDU>
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
To: "Matthew B. Brookover" <mbrookov@mines.edu>
Cc: LVM general discussion and development <linux-lvm@redhat.com>

ok, everything is fine now.. upgraded the other server to the same versions as this server and 
everyone is happy now. thanks for the help.

Jason


On Wed, May 23, 2007 at 08:10:16AM -0600, Matthew B. 
Brookover wrote:
>    You probably need to start up the cluster infrastructure. cman, ccsd,
>    fencd, and clvmd.
>    This is probably not a good idea, but you can also turn off LVM2
>    locking with:
> lvmconf --disable-cluster
> 
>    you can turn LVM2 locking back on with:
> lvmconf --enable-cluster --lockinglibdir /usr/lib --lockinglib liblvm2clusterloc
> k.so
> 
>    The lvmconf command edits /etc/lvm/lvm.conf.
>    The errors 'connect() failed on local socket: Connection refused'
>    appear from LVM2 commands when clvmd is not running and lvm.conf is
>    configured for a cluster.
>    I am not sure why the device name does not show up.  After turning off
>    locking, you could try to do a 'vgchange -ay' and hopefully it will
>    appear.
>    Matt
>    On Tue, 2007-05-22 at 20:51 -0400, jason@monsterjam.org wrote:
> 
> hey list. Im running
> [root@tf2 ~]# uname -a
> Linux tf2.localdomain 2.6.9-55.ELsmp #1 SMP Fri Apr 20 17:03:35 EDT 2007 i686 i6
> 86 i386
> GNU/Linux
> [root@tf2 ~]# cat /etc/redhat-release
> Red Hat Enterprise Linux AS release 4 (Nahant Update 5)
> [root@tf2 ~]#
> 
> and I have a lvm volume created on a GFS formatted drive that I cant see anymore
> ..
> 
> [root@tf2 ~]# vgscan
>   connect() failed on local socket: Connection refused
>   connect() failed on local socket: Connection refused
>   WARNING: Falling back to local file-based locking.
>   Volume Groups with the clustered attribute will be inaccessible.
>   Reading all physical volumes.  This may take a while...
>   Skipping clustered volume group diskarray
> [root@tf2 ~]# pvscan
>   connect() failed on local socket: Connection refused
>   connect() failed on local socket: Connection refused
>   WARNING: Falling back to local file-based locking.
>   Volume Groups with the clustered attribute will be inaccessible.
>   PV /dev/sdb1   VG diskarray   lvm2 [136.48 GB / 6.48 GB free]
>   Total: 1 [136.48 GB] / in use: 1 [136.48 GB] / in no VG: 0 [0   ]
> [root@tf2 ~]#
> 
> whats more, the device name used to be
> /dev/diskarray/lv1
> now, all I see is
> 
> [root@tf2 ~]# ls -al /dev/disk/by-path/*
> lrwxrwxrwx  1 root root  9 May 22 15:34 /dev/disk/by-path/pci-0000:00:1f.1-ide-0
> :0 -> ../../hda
> lrwxrwxrwx  1 root root  9 May 22 15:34 /dev/disk/by-path/pci-0000:02:0e.0-scsi-
> 0:1:0:0 ->
> ../../sda
> lrwxrwxrwx  1 root root 10 May 22 15:34 /dev/disk/by-path/pci-0000:02:0e.0-scsi-
> 0:1:0:0-part1 ->
> ../../sda1
> lrwxrwxrwx  1 root root 10 May 22 15:34 /dev/disk/by-path/pci-0000:02:0e.0-scsi-
> 0:1:0:0-part2 ->
> ../../sda2
> lrwxrwxrwx  1 root root 10 May 22 15:34 /dev/disk/by-path/pci-0000:02:0e.0-scsi-
> 0:1:0:0-part3 ->
> ../../sda3
> lrwxrwxrwx  1 root root 10 May 22 15:34 /dev/disk/by-path/pci-0000:02:0e.0-scsi-
> 0:1:0:0-part4 ->
> ../../sda4
> lrwxrwxrwx  1 root root 10 May 22 15:34 /dev/disk/by-path/pci-0000:02:0e.0-scsi-
> 0:1:0:0-part5 ->
> ../../sda5
> lrwxrwxrwx  1 root root 10 May 22 15:34 /dev/disk/by-path/pci-0000:02:0e.0-scsi-
> 0:1:0:0-part6 ->
> ../../sda6
> lrwxrwxrwx  1 root root 10 May 22 15:34 /dev/disk/by-path/pci-0000:02:0e.0-scsi-
> 0:1:0:0-part7 ->
> ../../sda7
> lrwxrwxrwx  1 root root 10 May 22 15:34 /dev/disk/by-path/pci-0000:02:0e.0-scsi-
> 0:1:0:0-part8 ->
> ../../sda8
> lrwxrwxrwx  1 root root 10 May 22 15:34 /dev/disk/by-path/pci-0000:02:0e.0-scsi-
> 0:1:0:0-part9 ->
> ../../sda9
> lrwxrwxrwx  1 root root  9 May 22 15:34 /dev/disk/by-path/pci-0000:03:0b.0-scsi-
> 0:2:0:0 ->
> ../../sdb
> lrwxrwxrwx  1 root root 10 May 22 15:34 /dev/disk/by-path/pci-0000:03:0b.0-scsi-
> 0:2:0:0-part1 ->
> ../../sdb1
> [root@tf2 ~]#
> 
> 
> /dev/sdb1 is my disk array..
> 
> any ideas?
> 
> Jason
> 
> 
> _______________________________________________
> linux-lvm mailing list
> [1]linux-lvm@redhat.com
> [2]https://www.redhat.com/mailman/listinfo/linux-lvm
> read the LVM HOW-TO at [3]http://tldp.org/HOWTO/LVM-HOWTO/
> 
> References
> 
>    1. mailto:linux-lvm@redhat.com
>    2. https://www.redhat.com/mailman/listinfo/linux-lvm
>    3. http://tldp.org/HOWTO/LVM-HOWTO/

> _______________________________________________
> linux-lvm mailing list
> linux-lvm@redhat.com
> https://www.redhat.com/mailman/listinfo/linux-lvm
> read the LVM HOW-TO at http://tldp.org/HOWTO/LVM-HOWTO/
