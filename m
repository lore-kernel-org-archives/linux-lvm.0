Received: from mx3.redhat.com (mx3.redhat.com [172.16.48.32])
	by int-mx1.corp.redhat.com (8.11.6/8.11.6) with ESMTP id j56E13O15103
	for <linux-lvm@redhat.com>; Mon, 6 Jun 2005 10:01:03 -0400
Received: from cs.columbia.edu (cs.columbia.edu [128.59.16.20])
	by mx3.redhat.com (8.12.11/8.12.11) with ESMTP id j56E0uex014633
	for <linux-lvm@redhat.com>; Mon, 6 Jun 2005 10:00:56 -0400
Received: from algiers.clic.cs.columbia.edu
	(IDENT:MrvrZ9KBD6jgWIhfWby3fd0cR/Y9NlgU@algiers.clic.cs.columbia.edu
	[128.59.15.63])
	by cs.columbia.edu (8.12.10/8.12.10) with ESMTP id j56E0rSa007306
	(version=TLSv1/SSLv3 cipher=EDH-RSA-DES-CBC3-SHA bits=168 verify=NOT)
	for <linux-lvm@redhat.com>; Mon, 6 Jun 2005 10:00:53 -0400 (EDT)
Received: from algiers.clic.cs.columbia.edu
	(IDENT:eugtbWhJdASzufpqjztSx/GOLbzZezqD@localhost [127.0.0.1])
	by algiers.clic.cs.columbia.edu (8.12.10/8.12.10) with ESMTP id
	j56E0rMl017717
	for <linux-lvm@redhat.com>; Mon, 6 Jun 2005 10:00:53 -0400
Received: from localhost (phung@localhost)
	by algiers.clic.cs.columbia.edu (8.12.10/8.12.10/Submit) with ESMTP id
	j56E0rp7017713
	for <linux-lvm@redhat.com>; Mon, 6 Jun 2005 10:00:53 -0400
Date: Mon, 6 Jun 2005 10:00:53 -0400 (EDT)
From: "Dan B. Phung" <phung@cs.columbia.edu>
Subject: Re: [linux-lvm] LVM help needed: conflicting names
In-Reply-To: <1118022793.4568.8.camel@erdelyi>
Message-ID: <Pine.LNX.4.44.0506060957540.15794-100000@algiers.clic.cs.columbia.edu>
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

sorry, but I can't remember your setup at the moment.  do you have two
disks booting on one machine?  what happens if you just boot one of the
disks to vgrename the logical volume, then shutdown and then hook the
other machine in.

On 5, Jun, 2005, Neil declared:

> On Sun, 2005-06-05 at 21:55 +0100, Alasdair G Kergon wrote:
> > > > $ man vgrename
> >  
> > With two VGs with the same name, you may have to use a
> > temporary lvm.conf filter to "hide" one of them before 
> > renaming the other.
> 
> My problem turns out to be more insidious than I thought,
> and I can't get even this far.  Both disks have the root
> filesystem (not /boot) under LVM as /dev/vg0/root (fedora
> core 3 systems), and it is initrd that is bailing when
> it finds multiple /dev/vg0/root logical volumes.  The
> lvm.conf file isn't even available at that stage.
> Anybody know if there is a boot option to initrd that
> filters which devices are examined for VG's?
> 
> -Neil
> 
> _______________________________________________
> linux-lvm mailing list
> linux-lvm@redhat.com
> https://www.redhat.com/mailman/listinfo/linux-lvm
> read the LVM HOW-TO at http://tldp.org/HOWTO/LVM-HOWTO/
> 

-- 
