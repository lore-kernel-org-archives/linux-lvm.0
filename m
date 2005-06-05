Received: from mx1.redhat.com (mx1.redhat.com [172.16.48.31])
	by int-mx1.corp.redhat.com (8.11.6/8.11.6) with ESMTP id j55JxsO12048
	for <linux-lvm@redhat.com>; Sun, 5 Jun 2005 15:59:54 -0400
Received: from cs.columbia.edu (cs.columbia.edu [128.59.16.20])
	by mx1.redhat.com (8.12.11/8.12.11) with ESMTP id j55Jxqfc021107
	for <linux-lvm@redhat.com>; Sun, 5 Jun 2005 15:59:53 -0400
Received: from algiers.clic.cs.columbia.edu
	(IDENT:nKfJXwYihEncR7RlcVSiVkh3XxVSFiSu@algiers.clic.cs.columbia.edu
	[128.59.15.63])
	by cs.columbia.edu (8.12.10/8.12.10) with ESMTP id j55JxoSa011868
	(version=TLSv1/SSLv3 cipher=EDH-RSA-DES-CBC3-SHA bits=168 verify=NOT)
	for <linux-lvm@redhat.com>; Sun, 5 Jun 2005 15:59:51 -0400 (EDT)
Received: from algiers.clic.cs.columbia.edu
	(IDENT:ez+N7YPhiGRd1VSoVOj3UtfrHoPdpD9H@localhost [127.0.0.1])
	by algiers.clic.cs.columbia.edu (8.12.10/8.12.10) with ESMTP id
	j55JxoMl015372
	for <linux-lvm@redhat.com>; Sun, 5 Jun 2005 15:59:50 -0400
Received: from localhost (phung@localhost)
	by algiers.clic.cs.columbia.edu (8.12.10/8.12.10/Submit) with ESMTP id
	j55JxoYK015368
	for <linux-lvm@redhat.com>; Sun, 5 Jun 2005 15:59:50 -0400
Date: Sun, 5 Jun 2005 15:59:50 -0400 (EDT)
From: "Dan B. Phung" <phung@cs.columbia.edu>
Subject: Re: [linux-lvm] LVM help needed: conflicting names
In-Reply-To: <1118000735.5018.21.camel@erdelyi>
Message-ID: <Pine.LNX.4.44.0506051558560.14259-100000@algiers.clic.cs.columbia.edu>
MIME-Version: 1.0
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
Content-Type: TEXT/PLAIN; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: LVM general discussion and development <linux-lvm@redhat.com>

have you tried:

$ man vgrename

NAME
       vgrename - rename a volume group

DESCRIPTION
       vgrename renames an existing (see vgcreate(8) ) volume group

Examples
       "vgrename /dev/vg02 /dev/my_volume_group" renames existing volume 
group "vg02" to "my_volume_group".

       "vgrename vg02 my_volume_group" does the same.

-dan

On 5, Jun, 2005, Neil declared:

> [Sorry about the dup; sent this to redhat-list earlier but just
>  discovered this list which the more appropriate place.]
> 
> Hi-
> 
> I lost a machine (bad PS or MB -- disk is fine) and am trying to
> bring up the disk in a second machine in order to access certain
> filesystems from it.  The second machine's disk has a single
> volume group 'vg0' containing several logical volumes, 'root',
> 'usr', 'home', etc (/boot is its own primary partition).
> Unfortunately the disk from the dead machine is configured almost
> identically, with a single 'vg0' volume group and some logical
> partitions of the same name.
> 
> Booting with both disks in the machine fails; it gets totally
> confused about which /dev/vg0/root (for example) it is supposed
> to be using.  I think I can configure lvm.conf so that the second
> disk is ignored by pvscan/vgscan during bootup, but I'm still
> stuck on how to actually mount any of the second disk's LVM 
> filesystems because of the name clashes.  Somehow I'd like to
> rename the volume group on the second disk to 'vg1', for example.
> 
> Anybody have any ideas?
> 
> Thanks!
>   Neil <nnc@newmexico.com>
> 
> _______________________________________________
> linux-lvm mailing list
> linux-lvm@redhat.com
> https://www.redhat.com/mailman/listinfo/linux-lvm
> read the LVM HOW-TO at http://tldp.org/HOWTO/LVM-HOWTO/
> 

-- 
