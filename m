From: "Heinz J . Mauelshagen" <mauelshagen@sistina.com>
Subject: Re: [linux-lvm] LV only detected when using "lvscan -D" on amd64 kernel
Message-ID: <20031028103644.N848@sistina.com>
References: <3F994F88.8030908@elitedvb.net> <20031025091006.I848@sistina.com> <3F9C0AC9.6050805@elitedvb.net> <20031027120104.K848@sistina.com> <3F9D327C.6020102@elitedvb.net> <20031027160955.M848@sistina.com> <3F9D3C4B.6050809@elitedvb.net>
Mime-Version: 1.0
In-Reply-To: <3F9D3C4B.6050809@elitedvb.net>; from tmbinc@elitedvb.net on Mon, Oct 27, 2003 at 04:39:55PM +0100
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
Date: Tue Oct 28 03:36:01 2003
List-Id: <linux-lvm.redhat.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: linux-lvm@sistina.com

On Mon, Oct 27, 2003 at 04:39:55PM +0100, Felix Domke wrote:
> Hi,
> 
> oh well, i just used 64bit versions of vgscan and vgchange, and it works 
> then. must be definitely a 32/64bit problem. (i didn't realized that i 
> had of course to re-run vgscan and vgchange before :/ ).
> 

You better do ;)
So the solution is to work in a 64bit clean kernel/tool environment.

> 
> as i don't understand the 32bit->64bit ioctl wrapping (with pointers) i 
> don't know how it is supposed to work with 32bit userspace tools. If you 
> still want to have access to the machine, contact me.

Thanks for the offer.
We'll probably have Itaniums pretty soon.

> 
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
