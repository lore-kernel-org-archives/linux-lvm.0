From: "John Moser" <jmoser@erc.wisc.edu>
Subject: RE: [linux-lvm] I/O Error removing a file
Message-Id: <CBEHLLOPCKAOIAOINGKAMEHACAAA.jmoser@erc.wisc.edu>
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
In-Reply-To: <20020205105847.B30823@sistina.com>
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
Date: Tue Feb  5 10:38:01 2002
List-Id: <linux-lvm.redhat.com>
Content-Type: text/plain; charset="us-ascii"
To: linux-lvm@sistina.com

Needless to say, I forgot to run fsck one last time. ;)  That removed the
illegal inodes, and the files along with it.  Problem solved.

I guess in the IT field, writing emails to support lists sometimes is all
you need to inspire the proper solution.

-John

-----Original Message-----
From: linux-lvm-admin@sistina.com [mailto:linux-lvm-admin@sistina.com]On
Behalf Of Heinz J . Mauelshagen
Sent: Tuesday, February 05, 2002 3:59 AM
To: linux-lvm@sistina.com
Subject: Re: [linux-lvm] I/O Error removing a file


On Mon, Feb 04, 2002 at 12:48:34PM -0600, John Moser wrote:
> I encountered what I was able to diagnose as a hardware error on one of
the
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
> Is there a way to remove these files so that I can recreate them?  I'm
using
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

=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-
=-

Heinz Mauelshagen                                 Sistina Software Inc.
Senior Consultant/Developer                       Am Sonnenhang 11
                                                  56242 Marienrachdorf
                                                  Germany
Mauelshagen@Sistina.com                           +49 2626 141200
                                                       FAX 924446
=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-
=-

_______________________________________________
linux-lvm mailing list
linux-lvm@sistina.com
http://lists.sistina.com/mailman/listinfo/linux-lvm
read the LVM HOW-TO at http://www.sistina.com/lvm/Pages/howto.html
