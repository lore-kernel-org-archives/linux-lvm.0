From: "Heinz J . Mauelshagen" <mauelshagen@sistina.com>
Subject: Re: [linux-lvm] using 160GB IDE drives under linux with LVM.
Message-Id: <20020208101726.A17077@sistina.com>
References: <wxx3d0d2czp.fsf@nommo.uio.no>
    <20020207220832.GA4116@wookimus.net> <wxxsn8c1vx1.fsf@nommo.uio.no>
MIME-Version: 1.0
In-Reply-To: <wxxsn8c1vx1.fsf@nommo.uio.no>; from terjekv@math.uio.no on
    Fri, Feb 08, 2002 at 04:42:34AM +0100
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
Date: Fri Feb  8 03:20:02 2002
List-Id: <linux-lvm.redhat.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: linux-lvm@sistina.com

On Fri, Feb 08, 2002 at 04:42:34AM +0100, Terje Kvernes wrote:
> "Chad C. Walstrom" <chewie@wookimus.net> writes:
> 
> > On Thu, Feb 07, 2002 at 10:33:46PM +0100, Terje Kvernes wrote:
> > >   fdisk is only able to address 128GiB, that's rather obvious.  if I
> > >   make one partition, 
> > 
> > Why make a partition at all?  Why not just make a physical volume out of
> > the whole disk?
> 
>   like I said, if I pvcreate the device itself, /dev/hdc,
>   /proc/lvm/global then returns the size as 134152192KB.  so it's
>   still off.  :/

That's just "134152192 KB / 1024 MB/KB / 1024 GB/MB = 127.937 GB"
which is close enough to 128 GB ;-)

> 
> -- 
> Terje
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
