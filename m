From: "Heinz J . Mauelshagen" <mauelshagen@sistina.com>
Subject: Re: [linux-lvm] Logical Volume disappears
Message-Id: <20020207200316.A13859@sistina.com>
References: <BC9564600E40C541983FCD6BEAF814FE03C94E6B@xch-knt-15.nw.nos.boeing.com>
MIME-Version: 1.0
In-Reply-To: <BC9564600E40C541983FCD6BEAF814FE03C94E6B@xch-knt-15.nw.nos.boeing.com>;
    from gordon.w.wolfe@boeing.com on Thu, Feb 07, 2002 at 10:20:28AM -0800
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
Date: Thu Feb  7 13:04:01 2002
List-Id: <linux-lvm.redhat.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: linux-lvm@sistina.com

In case /dev/vgcd/ still exists, "rm -rf" it and retry.

On Thu, Feb 07, 2002 at 10:20:28AM -0800, Wolfe, Gordon W wrote:
> > I'm having a very strange problem.  Perhaps you guys can help me.
> >  
> > 
> > I needed to make a public repository for the contents of five CD's, so I
> > set up a Linux server using SuSE 2.2.16 on S/390 under z/VM.  For five
> > CD's, I figured two volumes ought to hold the contents.  An rpm query
> > shows lvm-0.8-157, which is what came with the SuSe distribution.
> > 
> > I added two 3390-3 full-pack volumes to Linux and did a dasdfmt on them.
> > I went into YAST and created a logical volume group "vgcd" and a logical
> > volume "lvcd" using these two volumes.
> > I did a mke2fs on the logical volume /dev/vgcd/lvcd
> > I was able to mount /dev/vgcd/lvcd as /mnt and was able to do a "df' and
> > see them and copy some files to them
> > 
> > So far, so good.  Everything looking just fine.
> > 
> > Now, the wierd part:
> > I manually umounted /dev/vgcd/lvcd, shut down and rebooted Linux.
> > After the reboot, the device /dev/vgcd/lvcd does not exist.
> > vgscan says "vgscan -- no volume groups found"
> > pvscan says "pvscan -- no valid physical volumes found"
> > vgck says "vgck -- no volume groups found"
> > pvdisplay /dev/vgcd/lvcd says "invalid physical volume name
> > "/dev/vgcd/lvcd"
> > ls /dev/lvcd says "No such file or directory"
> > If I go back into YAST to do it all over, it says I can't create volume
> > group "vgcd" because it already exists.  But it doesn't show up in the
> > list of volume groups.
> > 
> > 
> > Can any of you point me in the right direction to see what the problem is?
> > 
> > 
> "Never trust any computer you can lift."
> Gordon Wolfe, Ph.D. (425)865-5940
> VM Technical Services, The Boeing Company
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
