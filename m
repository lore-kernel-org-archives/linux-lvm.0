From: "Heinz J . Mauelshagen" <mauelshagen@sistina.com>
Subject: Re: [linux-lvm] vgscan errors
Message-Id: <20020305223226.A19035@sistina.com>
References: <3C83AD42.20301@theiqgroup.com>
    <20020305002428.B13751@sistina.com> <3C85289C.8060606@theiqgroup.com>
MIME-Version: 1.0
In-Reply-To: <3C85289C.8060606@theiqgroup.com>; from
    kcorbin@theiqgroup.com on Tue, Mar 05, 2002 at 02:20:44PM -0600
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
Date: Tue Mar  5 15:34:02 2002
List-Id: <linux-lvm.redhat.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: linux-lvm@sistina.com

On Tue, Mar 05, 2002 at 02:20:44PM -0600, Kelly Corbin wrote:
> Well, after rooting around, it looks like my partition table was screwed 
> up.  However, when try to create the vg and lv again (after re-fdisking 
> the disk) it fails at the lv creation.  Vgcreate works with no problem; 
> I can reboot and re-activate the vg I just created.  When I run 
> lvcreate, I get the following error:
> 
> #lvcreate -l23722 -nfirst_lv first_vg
> lvcreate -- ERROR 0 writing volume group backup file 
> /etc/lvmtab.d/first_vg.tmp in vg_cfgbackup.c [line 268]
> lvcreate --  WARNING: you don't have an automatic backup of "first_vg"
> lvcreate -- logical volume "/dev/first_vg/first_lv successfully created.
> 
> vgdisplay then shows the correct number of free/used extents (1 free, 
> the rest used), but a vgscan now will fail miserably (before or after 
> reboot) with the same error (ERROR 2)
> 
> This is a new disk that I'm trying to setup for the first time.
> 
> Ideas?

It is probably too little free space in the root fs.
Because you've got somany extents the size of the metadata backup is bigger
as well.

Check your root fs free space, please.

> 
> Thanks.
> 
> 
> Heinz J . Mauelshagen wrote:
> 
> > Error 2 is ENOENT (no entry).
> > Could be a space problem in case / run full.
> > 
> > Regards,
> > Heinz    -- The LVM Guy --
> > 
> 
> 
> 
> -- 
> --------------------------------------------
> -- Kelly Corbin
> -- Systems Administrator
> --
> -- http://www.theiqgroup.com
> -- The Future of eServices...
> --
> -- The IQ Group, Inc.
> -- 6740 Antioch Suite 110
> -- Merriam, KS 66204
> -- (913)-722-6700 x105
> -- Fax (913)722-7264
> --------------------------------------------
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
