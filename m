From: "Heinz J . Mauelshagen" <mauelshagen@sistina.com>
Subject: Re: [linux-lvm] lvm and changing root partitions
Message-Id: <20020122103653.E17020@sistina.com>
References: <200201212303.g0LN3Kj14175@kalevala.nj.nec.com>
MIME-Version: 1.0
In-Reply-To: <200201212303.g0LN3Kj14175@kalevala.nj.nec.com>;
    from alexy@kalevala.nj.nec.com on Mon, Jan 21, 2002 at 06:03:20PM -0500
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
Date: Tue Jan 22 03:40:02 2002
List-Id: <linux-lvm.redhat.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: linux-lvm@sistina.com

On Mon, Jan 21, 2002 at 06:03:20PM -0500, Alexy Khrabrov wrote:
> 
> Dear Heinz --
> 
> I'm delighted with LVM for Linux.  I installed all
> of my SuSE 7.2 systems with root partition on LVM
> also.  I noticed one glitch and a more serious
> technical issue.
> 
> The glitch is, the root partition on LVM does not
> let vgchange -an deactivate everything on
> shutdown.  Although SuSE 7.2 /etc/init.d/boot
> script seems to provision the root partition being
> on LVM, shutdown still compplains that it can't
> deactivate the partition in use.  Is it possible
> at all to deactivate it?

Ho Alexy,
no it is not in case you've got root on a LV, because a VG can't be
deactivated with > 0 LVs still active.

> And is it safe to keep
> doing shutdowns without it fully deactivated?

Yes, it is completely safe, because nothing gets written to the disks
during "vgchange -an". The command tries to remove the LVM metadata from
core where it 'dies' anyway when the kernel disapears.

> 
> Second issue is more important, and it taught me
> about vgcfgbackup.  I lost my initial LVM install
> when I deleted some /dev/hdaN partitions in the
> middle, shifting the physical volume names.  I
> couldn't restore the system after that, even after
> trying al kinds of restoring commands.  So I
> reinstalled a Red Hat with a regular root
> partition, to be able to always boot up regardless
> of LVM, and created LVM from that Red Hat.  The
> original /etc/lvmtab* files where created there.
> 
> Then I installed SuSE onto the LVM, and started to
> boot into the root partition of SuSE.  But I
> couldn't change LVM logical volumes since their
> config was still stored on the older root
> partition.  I copied it physically to the new
> root, recreating /dev/ files with mknod.  It seems
> to work, but I wonder if that's the right way to
> move LVM config from one root partition to
> another?

Well, it is one way to do it.
Running vgscan is another recommended one, because vgscan reads all
PVs and creates the /etc/lvmtab* files/directory which is used as a cache
to run all LVM commands faster. vgscan is available once you have a SuSE
root including the LVM rpm installed. Boot into single user, run vgscan
and /etc/lvmtab* gets created with actual configuration info.

> 
> Regards,
> Alexy
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
