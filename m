Received: from o.ww.redhat.com (vpnuser1.stuttgart.redhat.com [172.16.4.1])
	by pobox.stuttgart.redhat.com (8.12.8/8.12.8) with ESMTP id i1PEg7a5005976
	for <linux-lvm@redhat.com>; Wed, 25 Feb 2004 15:42:07 +0100
From: Heinz Mauelshagen <Mauelshagen@redhat.com>
Subject: Re: [linux-lvm] badblocks on lvm1 lv using device mapper and lvm2 userland tools
Message-ID: <20040225144207.GD11757@redhat.com>
References: <20040222065536.GA10657@tric>
Mime-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20040222065536.GA10657@tric>
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
Date: Wed Feb 25 09:40:10 2004
List-Id: <linux-lvm.redhat.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: linux-lvm@redhat.com

On Sun, Feb 22, 2004 at 07:55:36AM +0100, Volker Gropp wrote:
> Hi,
> 
> is there any way to handle badblocks on a lvm1 lv in an dm lvm2
> environment. EVMS seem to be able to reallovate those, but i dont wanna
> switch.

You don't want to throw away the flaky disk(s) ? ;)

A disk should be sorted out IMO in case it starts showing bad blocks because
that means that it ran out of internal space to remap (presumably it is
decently actual it will have), which is very bad.

> 
> my kernel is 2.4.25, no patches on a debian system using IDE drives.
> 
> Volker Gropp
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
