Subject: Re: [linux-lvm] LVM2 setup notes and questions
Message-ID: <20020807083823.GB1468@fib011235813.fsnet.co.uk>
References: <1028495668.1455.44.camel@cygnusx-1.okcforum.org>
Mime-Version: 1.0
Content-Disposition: inline
In-Reply-To: <1028495668.1455.44.camel@cygnusx-1.okcforum.org>
From: Joe Thornber <joe@fib011235813.fsnet.co.uk>
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
Date: Wed Aug  7 03:38:02 2002
List-Id: <linux-lvm.redhat.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: linux-lvm@sistina.com

Nathan,

Thanks for your mail, this sort of information is really helpful.

On Sun, Aug 04, 2002 at 04:14:27PM -0500, Nathan G. Grennan wrote:
>   Just got finished making device-mapper 0.96.03 work with RedHat Limbo
> beta2, LVM tools 2.1.95.10, kernel 2.4.19-r7 from gentoo, and raw two
> drives as one physical volume and one logical volume. Ran into a few
> gotchas, but I was able to workaround them all.
> 
>   The first problem was with make apply-patches not finding the patches
> because I told it I was using 2.4.19 during configure instead of
> 2.4.19-rc1. I fixed this by changing the version line in the Makefile.

We'll update the script to deal with extra version fields.

> The second problem was simple rejects during running make apply-patches.
> They were caused by small differences in the gentoo kernel.

Nothing we can do about this, we only develop against the vanilla 2.4
kernel.  There are too many distros for us to make patch sets for them
all.

> of it. The first was vgscan and vgchange being linked to readline and
> the readline libraries being in /usr/lib, but rc.sysinit was trying to
> run them before /usr was mounted. At first I didn't read closely and
> staticly linked libdevmapper thinking it would make the whole program
> staticly linked. That didn't help, so I checked ./configure --help again
> and find the option to disable readline.

I think maybe we should disable readline support by default, very few
people use it.

> Then I had a problem with "setlocale failed". I did a Google
> search and found mention that other programs worked when LANG was LANG=C
> instead of LANG=en_US so I added a workaround to the rc.sysinit. 

I think this is more of a distro problem than an LVM2 prob.

> The next problem I ran into was a common one of vgscan trying to scan
> cdrom drives at hda and hdc. After reading the man page for lvm.conf and
> doing a little Google searching I figure out the correct format to
> filter both. I think the man page could use some additional examples to
> show the format for more than one filter.

Did you find the examples in LVM/doc/example.conf ?

> The final problem I ran into
> once the volume group was being activated was the device name change
> from /dev/vg/data to /dev/device-mapper/vg-data

There should automatically be a symbolic link from /dev/vg/data to
/dev/device-mapper/vg-data.  Can you confirm that this isn't happening
on your system please ?

>   The reason I converted from LVM1 to LVM2 is so that I could recover
> data if one of the drives failed. Since I only don't plan to snapshot or
> move I don't forsee many problems.

>   Now I have some questions. What are the steps involved in recovering
> should either of my drives fail?

I'll let Alasdair answer this one since he wrote that code.

> How do I convert the metadata from LVM1
> format to LVM2 format?

Format2 hasn't been released yet, it's currently undergoing a lot of
testing, we want to be confident it is correct before trusting peoples
data to it.  The upgrade procedure will be in the form a little shell
script which backs up your vgs in the normal text format, and then
restores from this text format to new format2 metadata areas.

> If I wanted to add a partition on a third drive would it be as simple as
> adding it to the physical volume group and then used parted resize the
> filesystem?

The partition will count as a PV, so just use vgextend, eg,

vgextend vg0 /dev/hdc2

> Is there a tool in the LVM2 packages that will do the same
> thing that parted does for ext3?

Not sure what you mean here, if you are asking if LVM2 will
automatically resize filesystems the answer is no.  We're just
concentrating on volume management, not filesystem management.

> Any bugs known in device-mapper 0.96.03
> that would make it a good idea to upgrade to the CVS version?

I can't think of any major bug that would force you to upgrade.

We tend to work off an internal bitkeeper repository and occasionally
sync up with CVS or the public bitkeeper.  So you shouldn't be shy
about using the CVS version since it is very stable.

If you are a bitkeeper user the latest stable 2.4 version can be
pulled from:

bk://device-mapper.bkbits.net/2.4-stable

This gets updated more frequently than cvs.  You can see the changeset log here:

http://device-mapper.bkbits.net:8080/2.4-stable


> Any other things any of you think I should know about LVM2?

/dev/device-mapper is being renamed to /dev/mapper (kernel hackers
don't like typing).  So if you do pick up patches that implement this
change (ie. from bitkeeper), please remember to rebuild libdevmapper.

- Joe
