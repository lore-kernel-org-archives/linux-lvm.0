From: "Heinz J . Mauelshagen" <mauelshagen@sistina.com>
Subject: Re: [linux-lvm] disk failure
Message-ID: <20020902155415.A17591@sistina.com>
References: <5.1.1.6.2.20020901044548.01d61470@pop.tvnet.hu>
Mime-Version: 1.0
In-Reply-To: <5.1.1.6.2.20020901044548.01d61470@pop.tvnet.hu>; from newsmail@satimex.tvnet.hu on Sun, Sep 01, 2002 at 04:50:27AM +0100
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
Date: Mon Sep  2 09:10:02 2002
List-Id: <linux-lvm.redhat.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: linux-lvm@sistina.com

On Sun, Sep 01, 2002 at 04:50:27AM +0100, Newsmail wrote:
> Hello everybody,
> maybe its an already answered problem, I dont know,
> I just have an lvm array of 3 disks. and the last disk of the array just 
> died, as is. I cannot to anything with it, it died, it doesnt even spin up. 
> what should I do with my array to make it work, or at least save the data I 
> have on it?
> I tried vgchange -an -qn to make it active without a quorum, but after I 
> didnt have an idea what to do. how can I remove the faultive, non-existing 
> drive from it? what should I do?

Well, you should backup any data you can still access this way or copy
it to new LVs in a newly created VG.
Either way you need to reinitialize the 2 remaining PVs after that to use them
in some other VG.

Your only other option to regain quorum (with all data of the failed PV lost!)
is to vgcfgrestore the metadata of the failed drive to a replacement one,
and "vgscan ; vgchange -ay".

> thanx in advance,
> regards,
> greg
> 
> ps: I'm using reiserfs.
> 
> 
> 
> _______________________________________________
> linux-lvm mailing list
> linux-lvm@sistina.com
> http://lists.sistina.com/mailman/listinfo/linux-lvm
> read the LVM HOW-TO at http://www.sistina.com/lvm/Pages/howto.html

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
