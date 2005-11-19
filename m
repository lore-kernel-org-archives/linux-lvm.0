Received: from o.ww.redhat.com (vpn50-8.rdu.redhat.com [172.16.50.8])
	by pobox.stuttgart.redhat.com (8.12.8/8.12.8) with ESMTP id
	jAJAAOYx022632
	for <linux-lvm@redhat.com>; Sat, 19 Nov 2005 11:10:25 +0100
Date: Sat, 19 Nov 2005 11:10:23 +0100
From: Heinz Mauelshagen <mauelshagen@redhat.com>
Subject: Re: [linux-lvm] about snapshot performance
Message-ID: <20051119101023.GC30556@redhat.com>
References: <539807300511190157j5699c837r@mail.gmail.com>
Mime-Version: 1.0
Content-Disposition: inline
In-Reply-To: <539807300511190157j5699c837r@mail.gmail.com>
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

On Sat, Nov 19, 2005 at 05:57:04PM +0800, Lee Rocky wrote:
> I found some reference that discuss about LVM1 volume with snapshot performance
> 
> https://www.redhat.com/archives/linux-lvm/2003-January/msg00173.html
> https://www.redhat.com/archives/linux-lvm/2003-January/msg00239.html
> 
> and I follow the steps with my LVM2
> 
> command
> "sync ; time dd if=/dev/zero of=filename bs=1024k count=2000"
> the result is
> dd write on LV without snapshots = 150MB/s
> dd write on LV with 1 snapshots = 4.42 MB/s
> 
> I got very slow write performace.
> but read has no problem.
> is this result work as expected?

Hrm, this should perform better.

Do you have both origin and snapshot allocated to the same PV ?

It will slow down writes, because on every change to the origin,
an exception takes place and the original content needs to be preserved
(causing additional reads and writes) before the update write is allowed
to go through.

If both go to the same spindle it'll explain what you see.


If this is true, try seperating allocation of the snapshot from
the origin (ie. add PVPath to the snapshot create command).

Of course you need at least 2 PVs in your VG to do that and enough
free space on the second to allocate the snapshot.


> 
> KERNEL 2.6.13
> LVM2 = 2.01.15
> Library : 1.01.05
> Driver version: 4.4.0
> 
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
Cluster and Storage Development                   56242 Marienrachdorf
                                                  Germany
Mauelshagen@RedHat.com                            +49 2626 141200
                                                       FAX 924446
=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-
