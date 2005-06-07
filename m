Date: Tue, 7 Jun 2005 15:51:16 +0100
From: Alasdair G Kergon <agk@redhat.com>
Subject: Re: [linux-lvm] Re: VG vg1 metadata writing failed
Message-ID: <20050607145116.GW15809@agk.surrey.redhat.com>
References: <1118087310.5509.40.camel@localhost.localdomain>
	<1118087611.5509.44.camel@localhost.localdomain>
	<1118091844.5509.79.camel@localhost.localdomain>
	<20050606212110.GV15809@agk.surrey.redhat.com>
	<1118093240.5509.81.camel@localhost.localdomain>
Mime-Version: 1.0
Content-Disposition: inline
In-Reply-To: <1118093240.5509.81.camel@localhost.localdomain>
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
To: Ming Zhang <mingz@ele.uri.edu>
Cc: LVM general discussion and development <linux-lvm@redhat.com>

> > Keep an eye on the CVS code - there was an allocation speed-up 
> > added recently, and the 64k limit should be disappearing very 
> > soon too.

I've put a fix into CVS today - try the current CVS code.
Note that you'll also need to use pvcreate --metadatasize
to support large metadata areas.
Also be aware of the current memory restrictions on snapshots:
after creating a certain number of snapshots you'll find
the kernel refuses to let you have any more.

Alasdair
-- 
agk@redhat.com
