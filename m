Date: Thu, 23 Aug 2001 10:08:13 +0200
From: "Heinz J . Mauelshagen" <mauelshagen@sistina.com>
Subject: Re: [linux-lvm] segfault running vgscan
Message-ID: <20010823100813.A13671@sistina.com>
References: <20010823011053.45493.qmail@web20310.mail.yahoo.com>
Mime-Version: 1.0
In-Reply-To: <20010823011053.45493.qmail@web20310.mail.yahoo.com>; from bwlang@yahoo.com on Wed, Aug 22, 2001 at 06:10:53PM -0700
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
List-Id: <linux-lvm.redhat.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: linux-lvm@sistina.com

Brad,

does it still segfault if you create a volume group before?

On Wed, Aug 22, 2001 at 06:10:53PM -0700, Brad Langhorst wrote:
> I've carefully followed the instructions in INSTALL
> and the build seems to go fine.
> This is the first install of lvm so there are no vgs
> or pvs or anything yet.
> 
> I patched the kernel  (2.4.9)
> installed the kernel
> make in LVM
> make install
> reboot
> run vgscan -d  
> 
> this just generates a segfault and dumps core
> 
> 
> any idea what i'm doing wrong?
> nothing recent with vgscan and segfault in the
> archive...
> LVM version 1.0.1-rc1(17/08/2001) 
> is reported in  dmesg.
> 
> thanks!
> 
> 
> brad
> 
> __________________________________________________
> Do You Yahoo!?
> Make international calls for as low as $.04/minute with Yahoo! Messenger
> http://phonecard.yahoo.com/
> 
> _______________________________________________
> linux-lvm mailing list
> linux-lvm@sistina.com
> http://lists.sistina.com/mailman/listinfo/linux-lvm
> read the LVM HOW-TO at http://www.sistina.com/lvm/Pages/howto.html

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
