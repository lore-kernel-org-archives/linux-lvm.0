Received: from o.ww.redhat.com (vpn50-3.rdu.redhat.com [172.16.50.3])
	by int-mx1.corp.redhat.com (8.11.6/8.11.6) with ESMTP id i1EAG5i10740
	for <linux-lvm@redhat.com>; Sat, 14 Feb 2004 05:16:05 -0500
From: Heinz Mauelshagen <mauelshagen@redhat.com>
Subject: Re: [linux-lvm] One more problem..
Message-ID: <20040214101604.GC22753@redhat.com>
References: <402D2752.7020305@demonlord.de>
Mime-Version: 1.0
Content-Disposition: inline
In-Reply-To: <402D2752.7020305@demonlord.de>
Sender: linux-lvm-admin@redhat.com
Errors-To: linux-lvm-admin@redhat.com
Reply-To: linux-lvm@redhat.com
List-Help: <mailto:linux-lvm-request@redhat.com?subject=help>
List-Post: <mailto:linux-lvm@redhat.com>
List-Subscribe: <https://www.redhat.com/mailman/listinfo/linux-lvm>,
	<mailto:linux-lvm-request@redhat.com?subject=subscribe>
List-Id: LVM general discussion and development <linux-lvm.redhat.com>
List-Unsubscribe: <https://www.redhat.com/mailman/listinfo/linux-lvm>,
	<mailto:linux-lvm-request@redhat.com?subject=unsubscribe>
List-Archive: <https://www.redhat.com/archives/linux-lvm/>
Date: Sat Feb 14 05:15:00 2004
List-Id: <linux-lvm.redhat.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: linux-lvm@redhat.com

Christian,

you didn't report the LVM driver/tools version so I guess you it an old bug.
If you can afford rebooting, that should get rid of the problem anyways.

On Fri, Feb 13, 2004 at 08:36:50PM +0100, Christian Reiss wrote:
> Greetings,
> 
> one more problem:
> When i run vgreduce (after setting +a +x), i get this:
> 
> 
> # vgreduce share -a -v
> 
> vgreduce -- locking logical volume manager
> vgreduce -- checking volume group name "share"
> vgreduce -- checking volume group "share" existence
> vgreduce -- checking volume group "share" activity
> vgreduce -- reading data of volume group "share" from disk(s)
> vgreduce -- reducing volume group "share" by physical volume "/dev/hdd"
> vgreduce -- reducing VGDA structures of volume group "share"
> vgreduce -- volume group "share" will be reduced by 1 physical volume
> 
> vgreduce -- reducing physical volumes in VGDA in kernel
> vgreduce -- ERROR "parameter error" reducing volume group "share" by 
> physical volume "/dev/hdd" in kernel
> 
> 
> Is it me, or... ? ;)
> 
> -Christian.
> -- 
> Christian Reiss <email@demonlord.de>
> demonserver.de
> 
> Key fingerprint = 2999 B7CD A218 06DF D658  5BE3 18B6 B232 02FF 71B2
> Public Key can be obtained here: http://www.demonlord.de/pgp.txt



-- 

Regards,
Heinz    -- The LVM Guy --

*** Software bugs are stupid.
    Nevertheless it needs not so stupid people to solve them ***

=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-

Heinz Mauelshagen                                 Red Hat, Inc.
Consulting Development Engineer                   Am Sonnenhang 11
                                                  56242 Marienrachdorf
                                                  Germany
Mauelshagen@RedHat.com                            +49 2626 141200
                                                       FAX 924446
=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-
