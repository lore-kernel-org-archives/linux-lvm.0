From: "Kai Iskratsch" <kai@stella.at>
Subject: AW: [linux-lvm] removing a failed disk from VG
Message-ID: <GCEFLNAMMNKGEECOBAMNGEGNCEAA.kai@stella.at>
MIME-Version: 1.0
Content-Type: multipart/mixed;
	boundary="----=_NextPart_000_0004_01C2C6C5.E40E3AF0"
In-Reply-To: <20030128114724.A17531@sistina.com>
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
Date: Tue Jan 28 05:08:02 2003
List-Id: <linux-lvm.redhat.com>
To: linux-lvm@sistina.com

This is a multi-part message in MIME format.

------=_NextPart_000_0004_01C2C6C5.E40E3AF0
Content-Type: text/plain;
	charset="us-ascii"
Content-Transfer-Encoding: 7bit

would the first method of this also work for me.
I should get an identical harddisk from the vendor since i have still
warranty on it.

I tried allready the second one, and I was lucky to succsessfully get the
data out of 2 from my 3 LVs since they didn't use the broken disk.
The last one which used the broken Harddisk will not mount without a fs
scan, since this is not an option with a readonly FS I still couldn't even
try to get any data from it.

regards

Kai


> -----Ursprungliche Nachricht-----
> Von: linux-lvm-admin@sistina.com [mailto:linux-lvm-admin@sistina.com]Im
> Auftrag von Heinz J . Mauelshagen
> Gesendet: Dienstag, 28. Janner 2003 11:47
> An: linux-lvm@sistina.com
> Betreff: Re: [linux-lvm] removing a failed disk from VG
>
>
> On Mon, Jan 27, 2003 at 09:28:08PM +0100, Alois Schneider wrote:
> > I had a VG scsi_vg consisting of 4 PV's (sda1, sdb1, hdb1,hdc1).
> > Now /dev/sdb1 failed and was no longer recogniced by th SCSI-
> > controller. I had to remove it.
> >
>
> Alois,
>
> then you probably lost data with the gone disk. Backup time :-(
> Please make sure that you've got backups of /etc/lvmconf/* and
> /etc/lvmtab*
> before you proceed.
>
> There's 2 options:
>
> a. you get a replacement drive (which can be a loop device)
>    of the same size (4G), run pvcreate on it, restore the metadata onto
>    it (vgcfgrestore) and run "vgscan ; vgchange -ay"
>
> b. you implement LVM2/device-mapper and run "vgscan ; vgchange -P
> -ay", which
>    will activate your VG without the missing drive. This solution enables
>    you to retrieve the data still accessable _but_ won't let you change
>    your volume group configuration. We are working on an
> enhancement supporting
>    such changes.
>
> Regards,
> Heinz    -- The LVM Guy --
>
>
> > vgscan now fails with the following error:
> >
> > vgscan -- ERROR "vg_read_with_pv_and_lv(): current PV" can't get data
> > of volume group "scsi_vg" from physical volume(s)
> > vgscan -- reading all physical volumes (this may take a while...)
> > vgscan -- "/etc/lvmtab" and "/etc/lvmtab.d" successfully created
> > vgscan -- WARNING: This program does not do a VGDA backup of your
> > volume group
> >
> > vgchange -ay gives
> > -- no volume group found
> >
> > The remaining PV's seem to be ok and the failed disk was only 4Gb
> > large.
> >
> > Here is the output of pvdisplay:
> >
> > --- Physical volume ---
> > PV Name               /dev/sda1
> > VG Name               scsi_vg
> > PV Size               4.04 GB [8466192 secs] / NOT usable 1.88 MB
> > [LVM: 125 KB]
> > PV#                   1
> > PV Status             available
> > Allocatable           yes (but full)
> > Cur LV                1
> > PE Size (KByte)       4096
> > Total PE              1033
> > Free PE               0
> > Allocated PE          1033
> > PV UUID               pJsMFv-ci9Q-orNK-3cRr-2aTl-w1N9-TEHDI1
> >
> >
> > --- Physical volume ---
> > PV Name               /dev/hdb1
> > VG Name               scsi_vg
> > PV Size               76.69 GB [160826652 secs] / NOT usable 4.25 MB
> > [LVM: 200 KB]
> > PV#                   3
> > PV Status             available
> > Allocatable           yes (but full)
> > Cur LV                2
> > PE Size (KByte)       4096
> > Total PE              19631
> > Free PE               0
> > Allocated PE          19631
> > PV UUID               u5I40y-Op34-nnVV-aInj-Jekc-VJT7-s2q8OK
> >
> >
> > --- Physical volume ---
> > PV Name               /dev/hdc1
> > VG Name               scsi_vg
> > PV Size               19.01 GB [39873267 secs] / NOT usable 4.18 MB
> > [LVM: 143 KB]
> > PV#                   5
> > PV Status             available
> > Allocatable           yes
> > Cur LV                1
> > PE Size (KByte)       4096
> > Total PE              4866
> > Free PE               2040
> > Allocated PE          2826
> > PV UUID               3PCGsY-hUr6-QEUt-MkoJ-fKlX-24vG-pS0HJY
> >
> > What can I do? How can I remove the no longer existing PV sdb1 from
> > scsi_vg?
> >
> > Any help will be appreciated.
> > Regards
> > Alois
> >
> >
> > _______________________________________________
> > linux-lvm mailing list
> > linux-lvm@sistina.com
> > http://lists.sistina.com/mailman/listinfo/linux-lvm
> > read the LVM HOW-TO at http://tldp.org/HOWTO/LVM-HOWTO/
>
> *** Software bugs are stupid.
>     Nevertheless it needs not so stupid people to solve them ***
>
> =-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-
> =-=-=-=-=-=-
>
> Heinz Mauelshagen                                 Sistina Software Inc.
> Senior Consultant/Developer                       Am Sonnenhang 11
>                                                   56242 Marienrachdorf
>                                                   Germany
> Mauelshagen@Sistina.com                           +49 2626 141200
>                                                        FAX 924446
> =-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-
> =-=-=-=-=-=-
>
> _______________________________________________
> linux-lvm mailing list
> linux-lvm@sistina.com
> http://lists.sistina.com/mailman/listinfo/linux-lvm
> read the LVM HOW-TO at http://tldp.org/HOWTO/LVM-HOWTO/
>

------=_NextPart_000_0004_01C2C6C5.E40E3AF0
Content-Type: message/rfc822
Content-Transfer-Encoding: 7bit
Content-Disposition: attachment

Reply-To: <linux-lvm@sistina.com>
From: "Heinz J . Mauelshagen" <mauelshagen@sistina.com>
Sender: <linux-lvm-admin@sistina.com>
To: <linux-lvm@sistina.com>
References: <000101c2c19c$83a6f090$0300a8c0@quaiky>
Subject: Re: [linux-lvm] Broken Harddisk in LVM
Date: Wed, 22 Jan 2003 12:14:46 +0100
Message-ID: <20030122121446.A25896@sistina.com>
MIME-Version: 1.0
Content-Type: text/plain;
	charset="us-ascii"
Content-Transfer-Encoding: 7bit
X-Priority: 3 (Normal)
X-MSMail-Priority: Normal
X-Mailer: Mutt 1.0.1i
In-Reply-To: <000101c2c19c$83a6f090$0300a8c0@quaiky>; from kai@stella.at on Tue, Jan 21, 2003 at 11:29:08PM +0100
X-Sender: mauelshagen@sistina.com
X-Spam-Status: No, hits=-4.4 required=7.0 tests=IN_REP_TO version=2.20
X-Spam-Level: 
X-BeenThere: linux-lvm@sistina.com
X-Mailman-Version: 2.0.11
X-Reply-To: mauelshagen@sistina.com
List-Help: <mailto:linux-lvm-request@sistina.com?subject=help>
List-Subscribe: <http://lists.sistina.com/mailman/listinfo/linux-lvm>,<mailto:linux-lvm-request@sistina.com?subject=subscribe>
List-Unsubscribe: <http://lists.sistina.com/mailman/listinfo/linux-lvm>,<mailto:linux-lvm-request@sistina.com?subject=unsubscribe>
X-Original-Date: Wed, 22 Jan 2003 12:14:46 +0100
Importance: Normal
X-MimeOLE: Produced By Microsoft MimeOLE V6.00.2600.0000


Install device-mapper + LVM2 tools _additionally_ in a seperate
location and run "vgscan ; vgchange -a y -P".

That might still leave you with unusable LVs in case their beginning
is gone with the failed disk.

If you decide to do that get back to us in case you've got installation
related questions.

Regards,
Heinz    -- The LVM Guy --

On Tue, Jan 21, 2003 at 11:29:08PM +0100, Kai Iskratsch wrote:
> One hard disk of my lvm System is completely broken, so that even the
> controller cannot find it.
> Is there a possibility to get the lvm running again without the data of
> this disk.
>
> Kai Iskratsch
>
>
>
> _______________________________________________
> linux-lvm mailing list
> linux-lvm@sistina.com
> http://lists.sistina.com/mailman/listinfo/linux-lvm
> read the LVM HOW-TO at http://tldp.org/HOWTO/LVM-HOWTO/

*** Software bugs are stupid.
    Nevertheless it needs not so stupid people to solve them ***

=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-
=-

Heinz Mauelshagen                                 Sistina Software Inc.
Senior Consultant/Developer                       Am Sonnenhang 11
                                                  56242 Marienrachdorf
                                                  Germany
Mauelshagen@Sistina.com                           +49 2626 141200
                                                       FAX 924446
=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-
=-

_______________________________________________
linux-lvm mailing list
linux-lvm@sistina.com
http://lists.sistina.com/mailman/listinfo/linux-lvm
read the LVM HOW-TO at http://tldp.org/HOWTO/LVM-HOWTO/

------=_NextPart_000_0004_01C2C6C5.E40E3AF0--
