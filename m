From: "Heinz J . Mauelshagen" <mauelshagen@sistina.com>
Subject: Re: [linux-lvm] LV only detected when using "lvscan -D" on amd64 kernel
Message-ID: <20031027120104.K848@sistina.com>
References: <3F994F88.8030908@elitedvb.net> <20031025091006.I848@sistina.com> <3F9C0AC9.6050805@elitedvb.net>
Mime-Version: 1.0
In-Reply-To: <3F9C0AC9.6050805@elitedvb.net>; from tmbinc@elitedvb.net on Sun, Oct 26, 2003 at 06:56:25PM +0100
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
Date: Mon Oct 27 05:00:02 2003
List-Id: <linux-lvm.redhat.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: linux-lvm@sistina.com

On Sun, Oct 26, 2003 at 06:56:25PM +0100, Felix Domke wrote:
> Heinz J . Mauelshagen wrote:
> 
> >Felix,
> >
> >this definitely looks like a 64bit ioctl related problem.
> >I don't have the equipment to test here so help (is external access to
> >your machine possible ?) is needed.
> >  
> >
> Hi,
> 
> i could setup external access to the machine, but be aware that it 
> consists of a chroot'ed 64bit hacked-together debian, so compiling 
> something with 64bit isn't any fun at all. The 32bit userspace however 
> is fine.
> 
> I tried to compile the lvmtools as 64bit, but the result didn't change. 
> are there any points where i can put some debug printfs/printks in the 
> sources to work out where it fails? I never looked at the LVM internals, 
> so i don't know what happens where. Does the kernel space reads and 
> parses the metadata? Or does the userspace parses it and passes it to 
> the kernel?

User space parses and passes it via ioctls to the kernel.
Please look at lvm.h for the ioctls defined and the structures involved.
Grep the LVM1 library source in tools/lib/ for "ioctl" to get you started.

> 
> Felix
> 
> 
> _______________________________________________
> linux-lvm mailing list
> linux-lvm@sistina.com
> http://lists.sistina.com/mailman/listinfo/linux-lvm
> read the LVM HOW-TO at http://tldp.org/HOWTO/LVM-HOWTO/

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
