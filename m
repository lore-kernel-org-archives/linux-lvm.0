From: "Heinz J . Mauelshagen" <mauelshagen@sistina.com>
Subject: Re: [linux-lvm] Error on vgscan & lvremove
Message-ID: <20020524105744.B15896@sistina.com>
References: <004d01c20110$f2b8ff70$6501a8c0@bomoon> <20020522144651.F9107@sistina.com> <009601c20204$81710e30$6501a8c0@bomoon> <20020523190023.A13788@sistina.com> <017301c202d0$c77c2410$6501a8c0@bomoon>
Mime-Version: 1.0
In-Reply-To: <017301c202d0$c77c2410$6501a8c0@bomoon>; from bo@sosnetwork.net on Thu, May 23, 2002 at 08:12:04PM -0700
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
Date: Fri May 24 04:01:02 2002
List-Id: <linux-lvm.redhat.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: linux-lvm@sistina.com

On Thu, May 23, 2002 at 08:12:04PM -0700, bo wrote:
> Heinz,
> 
> > A 'workaround' for non-devfs configurations is
> >
> > ls /dev/*/group | sed 's!/group!!' | xargs rm -r ; vgmknodes
> >
> 
> ??Something wrong on "sed 's!/group!!' ", it did not work.

Works fine here. Maybe your sed doesn't like the delimiter?

Try '/' rather than '!' with sed like "sed 's/\/group//'".

> 
> >
> > link the single executable statically by running
> > "./configure --enable-static_link" (which doesn't use the shared libs).
> >
> 
> It did not work. I rebuilt LINUX kernel & LVM after
> "./configure --enable-static_link".
> I got the same result.

Did you start with a fresh source tree or run "make distclean"
before "./configure --enable-static_link"?

> 
> Another big issues came as follow;
> 
> I tried to go back to LVM1.0.3, but getting a big trouble.
> 
> Q1:  Is it backward compatible from LVM1.1-rc2 to LVM1.0.3 or not?
> 
>         I already built the volume from LVM1.1-rc2 then I went back to
> LVM1.0.3.
>         All of LVM tools are not working as shown in the following console
> output.
> 
> Q2: How could I remove this volume and rebuild? I do not care about the
> data.

No LV status flags have been changed at all in 1.1-rc.
lv_check_consistency() checks for the 2 possible user land states in lv_status
which are either 0 or LV_ACTIVE.

For fast progress it should be ok to remove the lv_status checks from 
lv_check_consistency().

For further investigation of a possible 1.1-rc flaw ITR, could you send
me (mge@sistina.com) the output files created with

for d in All_volRaid0_PVs
do
	dd if=/dev/YOurPV of=`basename $d`.vgda bs=1k count=4
done

packed into a compressed tar archive?

Thanks,
Heinz    -- The LVM Guy --


> 
> During boot or after the boot, I have the following errors;
> 
> [root@localhost /]# vgscan -f
> vgscan -- reading all physical volumes (this may take a while...)
> vgscan -- found inactive volume group "volRaid0"
> vgscan -- ERROR "lv_check_consistency(): LV status" volume group "volRaid0"
> is inconsistent
> vgscan -- ERROR: unable to do a backup of volume group "volRaid0"
> vgscan -- ERROR "lvm_tab_vg_remove(): unlink" removing volume group
> "volRaid0" from "/etc/lvmtab"
> vgscan -- found inactive volume group "volRaid5"
> vgscan -- ERROR "lv_check_consistency(): LV status" volume group "volRaid5"
> is inconsistent
> vgscan -- ERROR: unable to do a backup of volume group "volRaid5"
> vgscan -- ERROR "lvm_tab_vg_remove(): unlink" removing volume group
> "volRaid5" from "/etc/lvmtab"
> vgscan -- found inactive volume group "volDisk"
> vgscan -- ERROR "lv_check_consistency(): LV status" volume group "volDisk"
> is inconsistent
> vgscan -- ERROR: unable to do a backup of volume group "volDisk"
> vgscan -- ERROR "lvm_tab_vg_remove(): unlink" removing volume group
> "volDisk" from "/etc/lvmtab"
> vgscan -- found inactive volume group "volDisk2"
> vgscan -- ERROR "lv_check_consistency(): LV status" volume group "volDisk2"
> is inconsistent
> vgscan -- ERROR: unable to do a backup of volume group "volDisk2"
> vgscan -- ERROR "lvm_tab_vg_remove(): unlink" removing volume group
> "volDisk2" from "/etc/lvmtab"
> vgscan -- "/etc/lvmtab" and "/etc/lvmtab.d" successfully created
> vgscan -- WARNING: This program does not do a VGDA backup of your volume
> groups
> 
> [root@localhost /root]# ls /dev/*/group
> ls: /dev/*/group: No such file or directory
> [root@localhost /root]# vgmknodes
> vgmknodes -- no volume groups found to create nodes for
> 
> 
> Thanks for your help,
> 
> Bo
> 
> 
> 
> 
> _______________________________________________
> linux-lvm mailing list
> linux-lvm@sistina.com
> http://lists.sistina.com/mailman/listinfo/linux-lvm
> read the LVM HOW-TO at http://www.sistina.com/lvm/Pages/howto.html

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
