Received: from o.ww.redhat.com (vpnuser2.stuttgart.redhat.com [172.16.4.2])
	by pobox.stuttgart.redhat.com (8.12.8/8.12.8) with ESMTP id
	i5K8n9qd020800
	for <linux-lvm@redhat.com>; Sun, 20 Jun 2004 10:49:09 +0200
Date: Sun, 20 Jun 2004 10:49:10 +0200
From: Heinz Mauelshagen <mauelshagen@redhat.com>
Subject: Re: [linux-lvm] lvm2 & e2fsadm (or safe scripted resizing)
Message-ID: <20040620084910.GC3519@redhat.com>
References: <54553.192.168.1.12.1087519164.squirrel@192.168.1.12>
Mime-Version: 1.0
Content-Disposition: inline
In-Reply-To: <54553.192.168.1.12.1087519164.squirrel@192.168.1.12>
Reply-To: mauelshagen@redhat.com,
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
To: LVM general discussion and development <linux-lvm@redhat.com>


(e2)fsadm code for LVM2 is in the development pipe for integration.
Will take a bit of time still... 

On Thu, Jun 17, 2004 at 07:39:24PM -0500, Nick Bartos wrote:
> >From what I can see, there is no e2fsadm util for lvm2.
> 
> I want to script parition resizes, but without that tool I cringe a
> little.  I need to write a script that automates this in a distro, so it
> needs to be completely scripted and very reliably reproduceable.  I am
> using e2fsadm now which works very well since I can just tell it how much
> to shrink/grow the partition, without getting the size first.
> 
> I don't mind doing this manually, but I want to make damn sure that I
> calculate everything right.  I don't want to miss something by a byte here
> or there.
> 
> If someone could contribute a good script or some directions on exactly
> how I get the right numbers, I would appreciate it.  I could just start
> doing it myself, but I am afraid that I would make it work, but then miss
> something where in some case of rounding I would mess up the partition.
> 
> I was also looking at the reiserfs utility, it looks like that works
> nicely as far as I can tell, there wouldn't seem to be any need to
> calculate anything.  Possibly I will consider upgrading the ext3 paritions
> to reiserfs as well.
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
