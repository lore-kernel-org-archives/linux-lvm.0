Received: from mx1.redhat.com (ext-mx04.extmail.prod.ext.phx2.redhat.com
	[10.5.110.8])
	by int-mx02.intmail.prod.int.phx2.redhat.com (8.13.8/8.13.8) with ESMTP
	id n8I0wJHR003232
	for <linux-lvm@redhat.com>; Thu, 17 Sep 2009 20:58:19 -0400
Received: from mail.bmsi.com (www.bmsi.com [24.248.44.156])
	by mx1.redhat.com (8.13.8/8.13.8) with ESMTP id n8I0w9bq011420
	for <linux-lvm@redhat.com>; Thu, 17 Sep 2009 20:58:10 -0400
Received: from bmsred.bmsi.com (bmsred.bmsi.com [192.168.9.50])
	by mail.bmsi.com (8.14.3/8.14.3) with ESMTP id n8I0w9gX007841
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-SHA bits=256 verify=NO)
	for <linux-lvm@redhat.com>; Thu, 17 Sep 2009 20:58:09 -0400
Received: from localhost (localhost.localdomain [127.0.0.1])
	by bmsred.bmsi.com (8.14.3/8.14.3) with ESMTP id n8I0w85b009528
	for <linux-lvm@redhat.com>; Thu, 17 Sep 2009 20:58:09 -0400
Date: Thu, 17 Sep 2009 20:58:08 -0400 (EDT)
From: "Stuart D. Gathman" <stuart@bmsi.com>
Subject: Re: [linux-lvm] Using LVM Mirroring to obtain a usable backup
In-Reply-To: <4AB2C5BC.5040804@gmail.com>
Message-ID: <Pine.LNX.4.64.0909172041590.9233@bmsred.bmsi.com>
References: <1253109566.5326.15.camel@delo.gdit>
	<20090916181947.GB15438@us.ibm.com>
	<1253127828.3243.1.camel@delo.gdit>
	<1253181956.30299.25.camel@breeves.fab.redhat.com>
	<Pine.LNX.4.64.0909171044250.6368@bmsred.bmsi.com>
	<1253201655.2339.178.camel@pc.interlinx.bc.ca>
	<Pine.LNX.4.64.0909171844470.9058@bmsred.bmsi.com>
	<4AB2C5BC.5040804@gmail.com>
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

On Thu, 17 Sep 2009, Les Mikesell wrote:

> Stuart D. Gathman wrote:
> > 
> > Those with money to burn seem to favor SANs. (And cloning a PV with
> > a SAN and importclone is an easy solution to the OP problem - if only they
> > had
> > a SAN.) I'm part of the Po' Fo'k contingent.
> 
> Is a SAN something you can emulate with an iscsi target on fairly normal
> equipment?

It depends on the software on the SAN server having something like
a snapshot or mirroring facility available.  At its simplest level, a SAN
server can be just a disk accessed by iSCSI or ATAoE.  (And even I can
afford that.)  But high end SAN servers are LVM systems (using something
like ZFS) and clients attach to logical drives that can be cloned, 
snapshotted, etc.  Kind of moves the whole LVM layer to the disk
subsystem (although it is still useful to have an additional LVM layer
locally).  More people people buying high end SAN servers might have
kept Sun from getting bought by Oracle :-)

A high end SAN server means you allocate "disks" from the SAN instead
of buying physical disks.  Adding another "disk" to a server can be as
simple as allocating another "LV" (or whatever the SAN software calls it)
and attaching it.  The OP would simply clone his disk in the SAN
(and needn't worry about the duplicate VGID as long he doesn't attach 
the clone) before doing the upgrade.

I have one client with a SAN system, and it seems to perform well.
It is one client that never needs to install a physical disk on a
server I maintain for them.  (Caveat, booting from iSCSI requires bringing up a
Nic - which is tricky to do for linux in initrd.)

-- 
	      Stuart D. Gathman <stuart@bmsi.com>
    Business Management Systems Inc.  Phone: 703 591-0911 Fax: 703 591-6154
"Confutatis maledictis, flammis acribus addictis" - background song for
a Microsoft sponsored "Where do you want to go from here?" commercial.
