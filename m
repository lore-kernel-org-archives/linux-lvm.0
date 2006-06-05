Received: from f20 (vpn-4-1.stuttgart.redhat.com [10.32.4.1])
	by int-mx1.corp.redhat.com (8.12.11.20060308/8.12.11) with ESMTP id
	k55MVugh016972
	for <linux-lvm@redhat.com>; Mon, 5 Jun 2006 18:31:56 -0400
Received: from f20.ww.redhat.com (localhost.localdomain [127.0.0.1])
	by f20 (8.13.6/8.13.6) with ESMTP id k55MVsvo002996
	for <linux-lvm@redhat.com>; Tue, 6 Jun 2006 00:31:55 +0200
Received: (from mauelsha@localhost)
	by f20.ww.redhat.com (8.13.6/8.13.6/Submit) id k55MVsnl002995
	for linux-lvm@redhat.com; Tue, 6 Jun 2006 00:31:54 +0200
Date: Tue, 6 Jun 2006 00:31:53 +0200
From: Heinz Mauelshagen <mauelshagen@redhat.com>
Subject: Re: [linux-lvm] Is it better to use partitions or entire disk for LVM?
Message-ID: <20060605223153.GA21795@redhat.com>
References: <1cbd6f830606040746j5af7c102y75d13748e4d2c627@mail.gmail.com>
Mime-Version: 1.0
Content-Disposition: inline
In-Reply-To: <1cbd6f830606040746j5af7c102y75d13748e4d2c627@mail.gmail.com>
Reply-To: mauelshagen@redhat.com,
	LVM general discussion and development <linux-lvm@redhat.com>
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
To: LVM general discussion and development <linux-lvm@redhat.com>

On Sun, Jun 04, 2006 at 10:46:45AM -0400, Mag Gam wrote:
> Is it better to create 1 partition on a disk, and use that into the LVM, or
> have a blank disk, and use that in the LVM (if possible)?

As long as we still need to live with partition tables, the advantage
of having 1 partition to create a PV on it is, that all related tools
(e.g. parted) *show* that there's an LVM partition.

Without a partition table on the device, it is easier to overlook that
the device is being used by LVM.

Of course LVM tools such as 'pvscan' or 'pvs' will show that fact.

Having said that, it is up to you to go without the technically superfluous
partition table on an LVM-only device or not.

> 
> TIA

> _______________________________________________
> linux-lvm mailing list
> linux-lvm@redhat.com
> https://www.redhat.com/mailman/listinfo/linux-lvm
> read the LVM HOW-TO at http://tldp.org/HOWTO/LVM-HOWTO/

-- 

Regards,
Heinz    -- The LVM Guy --

*** Software bugs are stupid.
    Nevertheless it needs not so stupid people to solve them ***

=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-

Heinz Mauelshagen                                 Red Hat GmbH
Consulting Development Engineer                   Am Sonnenhang 11
Storage Development                               56242 Marienrachdorf
                                                  Germany
Mauelshagen@RedHat.com                            PHONE +49  171 7803392
                                                  FAX   +49 2626 924446
=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-
