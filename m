From: "Heinz J . Mauelshagen" <mauelshagen@sistina.com>
Subject: Re: [linux-lvm] Can no longer mount lvm striped volume
Message-Id: <20020506123032.B26606@sistina.com>
References: <20020502121825.B3956@hpti.com>
    <Pine.SGI.4.33.0205021333290.5694922-100000@erc2000.erc.wisc.edu>
    <20020502124850.B4053@hpti.com>
MIME-Version: 1.0
In-Reply-To: <20020502124850.B4053@hpti.com>; from ctierney@hpti.com on
    Thu, May 02, 2002 at 12:48:50PM -0600
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
Date: Mon May  6 05:30:02 2002
List-Id: <linux-lvm.redhat.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: linux-lvm@sistina.com

Craig,

you said, "vgscan -f" didn't enable you to "vgchange -ay" the VG in question
but the explicit "vgchange -ay VGName" helped?

Very strange indeed.

Could you send the output of "dd if=$PV of=$(basename $PV).vgda bs=1k count=4k"
(replace the PV variable by your PV device pathes in turn) plus /etc/lvmtab*
contained in a bzip2ed tar archive to me directly <mge@sistina.com> for
further analisys.

Thanks,
Heinz    -- The LVM Guy --

On Thu, May 02, 2002 at 12:48:50PM -0600, Craig Tierney wrote:
> As Homer would say 'Doh!'.
> 
> I am still having some other problems, but this error
> was fixed by mounting the logical volume and not the
> volume group.
> 
> Wrong:  mount -t ext3 /dev/sdd_vol2 /export/sdd_vol2
> Correct: mount -t ext3 /dev/sdd_vol2/lv1 /export/sdd_vol2
> 
> I was still having problems with the scan message, but
> after I fixed that I didn't run the mounting scripts I
> mounted by hand and messed up.
> 
> Craig
> 
> 
> On Thu, May 02, 2002 at 01:34:40PM -0500, John Moser wrote:
> > 
> > > [root@x06 /root]# mount -t ext3 /dev/sdd_vol2/ /export/sdd_vol2
> > > mount: /dev/sdd_vol2/ is not a block device
> > >
> > > IO nodes have gone down in the past due to
> > > power interruptions, but I have never had
> > > this catastrophic of a problem.  I have 16 volume
> > > groups, and 3 or 4 appear to be affected.
> > 
> > Have you tried a simple:
> > 
> > vgchange -a y
> > 
> > ?  Similar situation happened to me before, and I just needed to activate
> > the volume group.
> > 
> > -John
> > 
> > 
> > _______________________________________________
> > linux-lvm mailing list
> > linux-lvm@sistina.com
> > http://lists.sistina.com/mailman/listinfo/linux-lvm
> > read the LVM HOW-TO at http://www.sistina.com/lvm/Pages/howto.html
> 
> -- 
> Craig Tierney (ctierney@hpti.com)
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
