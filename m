From: "Heinz J . Mauelshagen" <mauelshagen@sistina.com>
Subject: Re: [linux-lvm] I/O Error removing a file
Message-Id: <20020205105847.B30823@sistina.com>
References: <20020124021457.GA15661@balu.kawo2.rwth-aachen.de>
    <CBEHLLOPCKAOIAOINGKAEEHACAAA.jmoser@erc.wisc.edu>
MIME-Version: 1.0
In-Reply-To: <CBEHLLOPCKAOIAOINGKAEEHACAAA.jmoser@erc.wisc.edu>;
    from jmoser@erc.wisc.edu on Mon, Feb 04, 2002 at 12:48:34PM -0600
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
Date: Tue Feb  5 03:59:01 2002
List-Id: <linux-lvm.redhat.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: linux-lvm@sistina.com

On Mon, Feb 04, 2002 at 12:48:34PM -0600, John Moser wrote:
> I encountered what I was able to diagnose as a hardware error on one of the
> hard drives in my system.  In order to make sure my data was safe, I added
> an additional drive, and performed a pvmove of the data onto the healthy
> drive (moving all the PE's off the bad disk).  That all went fairly well
> (except for taking forever).
> 
> However, I still have a few files which are giving me troubles.
> 
> root@vpn:/home/vpnwork# rm -R TestData2k
> rm: cannot remove `TestData2k': Input/output error

John,

so you don't have PEs allocated on the failed drive any longer?
If so, this looks like you still have another hardware flaw (cables?)
or a bug in 2.5.
What does "fsck -f" say about your filesystem?

> 
> Is there a way to remove these files so that I can recreate them?  I'm using
> LVM version 1.0.1-rc4, on a Linux kernel 2.5.0.
> 
> Thanks,
> -John Moser
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
