Return-Path: <root@srv.sistina.com>
Date: Mon, 23 Jul 2001 10:02:03 +0200
From: "Heinz J. Mauelshagen" <Mauelshagen@sistina.com>
Subject: Re: [linux-lvm] I/O error: dev 08:11, sector 0
Message-ID: <20010723100203.C10807@sistina.com>
References: <20010720211356.A932@digit-safe.dyndns.org> <20010721134419.B12590@digit-safe.dyndns.org>
Mime-Version: 1.0
In-Reply-To: <20010721134419.B12590@digit-safe.dyndns.org>; from allanwind@mediaone.net on Sat, Jul 21, 2001 at 01:44:19PM -0400
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
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: linux-lvm@sistina.com

On Sat, Jul 21, 2001 at 01:44:19PM -0400, Allan M. Wind wrote:
> On 2001-07-20 21:13:56, Allan M. Wind wrote:
> 
> > > When does lvm create /dev/sdb1 (I only used /dev/sdb)?
> > 
> > Still curios about this one as I did not create it and cfdisk does not
> > seem to recognize the partition (just reports free space).  How is
> > this partition locatated in relation to the disc device?  I get the
> > above error if dd if=sdb1 but I would think the sector would be
> > reachable via the the disc device also... perhaps there is something
> > wrong with the device partition?
> > 
> > Does lvm use the first sector?  If not, could it just be bad data that
> > is somehow read and therefor complained about and could be wiped?
> > Should I create a partition and feed that to pvcreate instead of
> > giving it the raw disk?
> 
> Used `pvcreate /dev/sdb1` (instead of /dev/sdb) and everything works
> as expected.  I suspect there is a bug with the combination of linux
> 2.4.6 (devfsd) and lvm 0.9.1beta7 causing a non-functional partition
> to be created when you use the raw disk partition.

Are you able to reporduce this?

> 
> 
> /Allan
> -- 
> Allan M. Wind			email: allanwind@mediaone.net
> P.O. Box 2022			finger: awind@digit-safe.dyndns.org (GPG/PGP)
> Woburn, MA 01888-0022
> USA



-- 

Regards,
Heinz    -- The LVM Guy --

*** Software bugs are stupid.
    Nevertheless it needs not so stupid people to solve them ***

=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-

Heinz Mauelshagen                                 Sistina Software Inc.
Senior Consultant/Developer                       Am Sonnenhang 11
                                                  56242 Marienrachdorf
                                                  Germany
Mauelshagen@Sistina.com                           +49 2626 141200
                                                       FAX 924446
=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-
