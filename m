From: "Heinz J . Mauelshagen" <mauelshagen@sistina.com>
Subject: Re: [linux-lvm] undocumented strange LVM behaviour
Message-ID: <20021127230241.A3406@sistina.com>
References: <E18GYnN-0005nz-00@mail.kellnerweg.de> <E18H7Ca-0006IL-00@mail.kellnerweg.de>
Mime-Version: 1.0
In-Reply-To: <E18H7Ca-0006IL-00@mail.kellnerweg.de>; from daniel@kellnerweg.de on Wed, Nov 27, 2002 at 07:43:46PM +0100
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
Date: Wed Nov 27 16:10:02 2002
List-Id: <linux-lvm.redhat.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: linux-lvm@sistina.com

On Wed, Nov 27, 2002 at 07:43:46PM +0100, Daniel Zeiss wrote:
> vgcfgrestore be an option to restore my lvm?

No, this looks like a strange /proc/partitions problem (LVM tries to retrieve
device pathes from there and obviously fails on that).

Does "cat /proc/partitions" show any strangenesses ?

Regards,
Heinz    -- The LVM Guy --

> 
> 
> Daniel Zeiss wrote:
> 
>  > Hello,
>  >
>  > my lvm (2 partitions on 2 discs /dev/hde4 /devhdg2) on a Debian Woody
>  > Linux (2.4.18-686) shows some strange behaviour:
>  >
>  > After rebooting my computer, vgscan found an inactive "vg01" to be my
>  > volume group but vgchange -a y said:
>  >
>  > vgchange -- ERROR: can't get name(s) of physical volumes
>  > vgchange -- Please check, if /proc is mounted
>  >
>  > my /proc is mounted and in /proc/lvm /global is says:
>  >
>  > Total:  0 VGs   0 PVs   0 LVs  (LVs open)
>  > Global: 152 bytes malloced  IOP version 10   0:05:06 active
>  >
>  > I do _not_ use devfs, /dev is complete and working.
>  >
>  > My lvm are just my home dirs, so uncomming them in /etc/fstabs and
>  > rebooting brings my system up with kde now problem and root can log in
>  > and work (which it shouldnt do with kde, just testing).
>  >
>  > My / is on /dev/hde3, so it isnt a disc failure.
>  >
>  > the output of
>  >
>  > vgchange -a y -d
>  >
>  > is attached.
>  >
>  > What can I do to get my LVM up running _without_ dataloss?
>  >
>  > Thank you
>  >
>  > Daniel
>  >
>  >
> 
> 
> _______________________________________________
> linux-lvm mailing list
> linux-lvm@sistina.com
> http://lists.sistina.com/mailman/listinfo/linux-lvm
> read the LVM HOW-TO at http://tldp.org/HOWTO/LVM-HOWTO/

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
