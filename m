Return-Path: <jdiehl@sandia.gov>
Message-ID: <B51F0C636E578A4E832D3958690CD73E0130BFC4@es04snlnt>
From: "Diehl, Jeffrey" <jdiehl@sandia.gov>
Subject: RE: [linux-lvm] Renumbered drives hosed VG.
Date: Wed, 15 Aug 2001 15:47:22 -0600
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
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
To: "'linux-lvm@sistina.com'" <linux-lvm@sistina.com>

Well, if I do a vgscan, it should find all of the VG's, right?  The log
below indicates that this isn't happening.  All I want to do is create a
large volume, move the data from the Database VG onto that new volume, then
incorporate the space used by Database into the new volume and resize my
filesystem.  This should not take 2 days!

Any help would be most appreciated.



Script started on Wed Aug 15 08:29:02 2001

[root@filmore jdiehl]# vgscan
vgscan -- reading all physical volumes (this may take a while...)
vgscan -- found active volume group "Database"
vgscan -- "/etc/lvmtab" and "/etc/lvmtab.d" successfully created
vgscan -- WARNING: you may not have an actual VGDA backup of your volume
group


[root@filmore jdiehl]# vgcreate Database2 -s 8M /dev/sdc6
vgcreate -- "/dev/sdc6" is no new physical volume
vgcreate -- physical volume "/dev/sdc6" already belongs to volume group
"Database2"

[root@filmore jdiehl]# 
[root@filmore jdiehl]# exit

Mike Diehl,
Network Monitoring Tool Devl.
Sandia National Laboratories.
(505) 284-3137
jdiehl@sandia.gov


> -----Original Message-----
> From: Heinz J . Mauelshagen [mailto:mauelshagen@sistina.com]
> Sent: August 15, 2001 2:57 AM
> To: linux-lvm@sistina.com
> Subject: Re: [linux-lvm] Renumbered drives hosed VG.
> 
> 
> On Tue, Aug 14, 2001 at 02:52:17PM -0600, Diehl, Jeffrey wrote:
> > Hi all,
> > 
> > I recently upgraded from a modular kernel to a monolithic 
> kernel, which
> > renumbered all of my drives.  sda became sdb, sdb became 
> sdc and adc became
> > sda, etc.  Now one of my VG's is hosed.  How do I recover from this?
> 
> A vgscan run should excatly address this.
> Did it take place after the changes and *before* "vgchange -ay"?
> 
> > 
> > Thanx,
> > Mike Diehl,
> > Network Monitoring Tool Devl.
> > 284-3137
> > jdiehl@sandia.gov
> > 
> > 
> > _______________________________________________
> > linux-lvm mailing list
> > linux-lvm@sistina.com
> > http://lists.sistina.com/mailman/listinfo/linux-lvm
> > read the LVM HOW-TO at http://www.sistina.com/lvm/Pages/howto.html
> 
> -- 
> 
> Regards,
> Heinz    -- The LVM Guy --
> 
> *** Software bugs are stupid.
>     Nevertheless it needs not so stupid people to solve them ***
> 
> =-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-
> =-=-=-=-=-=-=-=-
> 
> Heinz Mauelshagen                                 Sistina 
> Software Inc.
> Senior Consultant/Developer                       Am Sonnenhang 11
>                                                   56242 Marienrachdorf
>                                                   Germany
> Mauelshagen@Sistina.com                           +49 2626 141200
>                                                        FAX 924446
> =-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-
> =-=-=-=-=-=-=-=-
> _______________________________________________
> linux-lvm mailing list
> linux-lvm@sistina.com
> http://lists.sistina.com/mailman/listinfo/linux-lvm
> read the LVM HOW-TO at http://www.sistina.com/lvm/Pages/howto.html
> 
