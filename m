Date: Tue, 16 Oct 2001 10:57:39 +0200
From: "Heinz J . Mauelshagen" <mauelshagen@sistina.com>
Subject: Re: [linux-lvm] lvcreate: no such device or address
Message-ID: <20011016105739.B4318@sistina.com>
References: <3BCB0216.66DC0628@storix.com>
Mime-Version: 1.0
In-Reply-To: <3BCB0216.66DC0628@storix.com>; from anthony@storix.com on Mon, Oct 15, 2001 at 08:34:46AM -0700
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

Anthony,

with which Linux+LVM version does this happen (recent one from www.sistina.com
is recommended)?
Did you patch your kernel with LVM as discribed in INSTALL and PATCHES/README
in the LVM source distribution?
Does it happen with or without devfs?

On Mon, Oct 15, 2001 at 08:34:46AM -0700, Anthony Johnson wrote:
> Sorry to repeat, but I've had no response and am dead in the water. Anyone 
> had a similar problem or have advice on how to reolve this?
> 
> # lvcreate -d -l1 -n testlv1 uservg
> ...
> <1> lv_create_node -- LEAVING with ret: 0
> <1> lvm_error -- CALLED with: 6
> <1> lvm_error -- LEAVING with: "No such device or address"
> lvcreate -- ERROR "No such device or address" opening "/dev/uservg/testlv1"
> 
> After running this command, the node /dev/uservg/testlv1 was created in the 
> directory but vgdisplay -v still shows there are no LVs in uservg. Tried 
> this on different VGs, using different PE sizes, lvnames, etc with same results.
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
