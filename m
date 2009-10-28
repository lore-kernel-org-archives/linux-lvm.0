Received: from mx1.redhat.com (ext-mx04.extmail.prod.ext.phx2.redhat.com
	[10.5.110.8])
	by int-mx02.intmail.prod.int.phx2.redhat.com (8.13.8/8.13.8) with ESMTP
	id n9S7HSUa002519
	for <linux-lvm@redhat.com>; Wed, 28 Oct 2009 03:17:28 -0400
Received: from smtpout.karoo.kcom.com (smtpout.karoo.kcom.com [212.50.160.34])
	by mx1.redhat.com (8.13.8/8.13.8) with ESMTP id n9S7H9lS026324
	for <linux-lvm@redhat.com>; Wed, 28 Oct 2009 03:17:10 -0400
Subject: Re: [linux-lvm] Removing a very old physical drive - revisited
From: Nicholas Robinson <npr@bottlehall.co.uk>
In-Reply-To: <20091028012931.GA27808@us.ibm.com>
References: <1256664432.6383.15.camel@elm.bottlehall.co.uk>
	<20091028012931.GA27808@us.ibm.com>
Date: Wed, 28 Oct 2009 07:17:08 +0000
Message-Id: <1256714228.2246.15.camel@elm.bottlehall.co.uk>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
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
To: LVM general discussion and development <linux-lvm@redhat.com>

Hi Malahal

Thanks for your reply. I don't really want to use the new/temporary disc
long-term, it seems that pvmove needs space to create a mirror-lv whilst
it is working and it seemed possible that the original problem was that
this extra space wasn't there.

# pvscan
  PV /dev/sdb2   VG VolGroup00   lvm2 [27.75 GB / 960.00 MB free]
  PV /dev/sda2   VG VolGroup00   lvm2 [314.97 GB / 30.84 GB free]
  PV /dev/sdd3   VG VolGroup00   lvm2 [52.50 GB / 52.50 GB free]
  Total: 3 [395.22 GB] / in use: 3 [395.22 GB] / in no VG: 0 [0   ]

This shows that sda2 has enough PEs free to take sdb2 ultimately and
sdd3 should have enough space to hold any sensible mirror lv.

I am using an upgraded Fedora 11 installation (from Fedora 8 using
preupgrade) with lvm version 

  LVM version:     2.02.48 (2009-06-30)
  Library version: 1.02.33 (2009-06-30)
  Driver version:  4.14.0

I will try a posting to dm-devel as you suggest.

Thanks

Nick


On Tue, 2009-10-27 at 18:29 -0700, malahal@us.ibm.com wrote:
> Nicholas Robinson [npr@bottlehall.co.uk] wrote:
> > 
> > Nick
> > 
> > # pvmove -vv /dev/sdb2 /dev/sda2
> 
> You can just specify 'pvmove -vv /dev/sdb2' to allow it to allocate on
> your new disk as well or you can do
> 'pvmove -vv /dev/sdb2 /dev/sda2 /dev/<yourNewPVname>' to allow it to
> allocate on the new PV as well.  What distro and what version of LVM and
> device package are you using.  Someone may help if you post it to
> dm-devel mailing list.
> 
> Thanks, Malahal.
> 
> _______________________________________________
> linux-lvm mailing list
> linux-lvm@redhat.com
> https://www.redhat.com/mailman/listinfo/linux-lvm
> read the LVM HOW-TO at http://tldp.org/HOWTO/LVM-HOWTO/
