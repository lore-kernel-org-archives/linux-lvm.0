Received: from o.ww.redhat.com (vpn50-9.rdu.redhat.com [172.16.50.9])
	by pobox.stuttgart.redhat.com (8.12.8/8.12.8) with ESMTP id
	i2FCqxIE030706
	for <linux-lvm@redhat.com>; Mon, 15 Mar 2004 13:53:00 +0100
Date: Mon, 15 Mar 2004 13:52:58 +0100
From: Heinz Mauelshagen <hjm@redhat.com>
Subject: Re: [linux-lvm] Some LVM 2 questions.
Message-ID: <20040315125258.GC17078@redhat.com>
References: <000101c40748$d1b5f860$1530a8c0@aphrodite>
Mime-Version: 1.0
Content-Disposition: inline
In-Reply-To: <000101c40748$d1b5f860$1530a8c0@aphrodite>
Reply-To: hjm@redhat.com,
	LVM general discussion and development <linux-lvm@redhat.com>
List-Id: LVM general discussion and development <linux-lvm.redhat.com>
List-Unsubscribe: <https://www.redhat.com/mailman/listinfo/linux-lvm>,
	<mailto:linux-lvm-request@redhat.com?subject=unsubscribe>
List-Archive: </archives/linux-lvm>
List-Post: <mailto:linux-lvm@redhat.com>
List-Help: <mailto:linux-lvm-request@redhat.com?subject=help>
List-Subscribe: <https://www.redhat.com/mailman/listinfo/linux-lvm>,
	<mailto:linux-lvm-request@redhat.com?subject=subscribe>
List-Id: <linux-lvm.redhat.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: linux-lvm@redhat.com

On Thu, Mar 11, 2004 at 09:11:20AM -0000, Rupert Hair wrote:
> I have noticed that a friend's LVM 2 vgdisplay does not show a MAX LV Size
> value.  Should I take this to mean that LVM 2 does not impose a MAX LV Size
> or that it it so large that it will not be an isssue?

LVM1 is limited by its internal mapping table size of ~2^16 entries.

LVM2 doesn't have such iinternal constraint any more.

> 
> I currently have a LVM 1.0.8 system that is nearing its MAX LV Size.  I
> would like to know if I can migrate it to LVM 2 so that I can expand beyond
> my MAX LV Size?  

Yes, you could but would be limited to 2TB in Linux 2.4
which is gone in Linux 2.6.

> 
> I have four drives containing one linear VG and one LV on top of that
> formatted as ext3.  Can I set LVM (1 or 2) to make a backup of the file
> allocation tables (I'm not sure if that's the right term) of my ext3 system
> onto all my drives so that if the first disk in my LV died I would not loose
> all my data (just what was contained on that disk).

No, LVM has no concept of filesystem metadata because it works at the block
rather than the filesystem level.

You either want filesystem backups, which you need anyway or
block device redundancy (eg, mirroring in software or hardware).

> 
> Thanks,
> 
> Rupert
> 
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
                                                  56242 Marienrachdorf
                                                  Germany
Mauelshagen@RedHat.com                            +49 2626 141200
                                                       FAX 924446
=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-
