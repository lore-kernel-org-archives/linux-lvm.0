Date: Tue, 11 Sep 2001 16:18:32 +0200
From: "Heinz J . Mauelshagen" <mauelshagen@sistina.com>
Subject: Re: [linux-lvm] missing vg after reboot
Message-ID: <20010911161832.D20767@sistina.com>
References: <20010910131203.C31313@sistina.com> <20010910154903.33297.qmail@web13902.mail.yahoo.com>
Mime-Version: 1.0
In-Reply-To: <20010910154903.33297.qmail@web13902.mail.yahoo.com>; from m_holschbach@yahoo.com on Mon, Sep 10, 2001 at 08:49:03AM -0700
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

vgcfgrestore only works on a new PV.
Run "pvcreate -ff /dev/YourDevice" *before trying vgcfgrestore on it.

Regards,
Heinz    -- The LVM Guy --

On Mon, Sep 10, 2001 at 08:49:03AM -0700, Michael Holschbach wrote:
> 
> --- "Heinz J . Mauelshagen" <mauelshagen@sistina.com> wrote:
> > 
> > Michael,
> > 
> > the pvdata output below exposes a completely messy PV structure,
> > which makes me think of 2 possible reasons:
> > 
> > a. /dev/hda2 is not the device you used to create a physical volume
> > 
> > b. something accidentially overwrote /dev/hda2 after the PV creation
> > 
> > 
> > If b is true you might still have an actual VGDA backup in
> > /etc/lvmconf/ which
> > you can use to vgcfgrestore(8) it to /dev/hda2 presumed that
> > /dev/hda2 is
> > the right device.
> > 
> I already tried vgcfgrestore. All available backup files lead to the
> same result:
>  
> > > server1:~ # vgcfgrestore -v -n data /dev/hda2
> > > vgcfgrestore -- locking logical volume manager
> > > vgcfgrestore -- restoring volume group "data" from
> > > "/etc/lvmconf/data.conf"
> > > vgcfgrestore -- checking existence of
> > > "/etc/lvmconf/data.conf"
> > > vgcfgrestore -- reading volume group data for "data"
> > > from "/etc/lvmconf/data.con
> > > f"
> > > vgcfgrestore -- reading physical volume data for
> > > "data" from "/etc/lvmconf/data.
> > > conf"
> > > vgcfgrestore -- reading logical volume data for "data"
> > > from "/etc/lvmconf/data.c
> > > onf"
> > > vgcfgrestore -- checking volume group consistency of
> > > "data"
> > > vgcfgrestore -- checking volume group consistency of
> > > "data"
> > > vgcfgrestore -- reading physical volume "/dev/hda2"
> > > vgcfgrestore -- ERROR "pv_read(): PV identifier
> > > invalid" reading physical volume
> > >  "/dev/hda2"
> > > 
> My idea was to reset the values of /dev/hda2 according to the following
> settings:
> 
> > > server1:~ # vgcfgrestore -v -ll -n data /dev/hda2
> ...
> > > --- Physical volume ---
> > > PV Name               /dev/hda2
> > > VG Name               data
> > > PV Size               27.62 GB / NOT usable 2.48 MB
> > > [LVM: 148 KB]
> > > PV#                   2
> > > PV Status             available
> > > Allocatable           yes
> > > Cur LV                6
> > > PE Size (KByte)       4096
> > > Total PE              7069
> > > Free PE               669
> > > Allocated PE          6400
> > > PV UUID              
> > > e7sX5R-XnTm-keX6-jShf-tTlw-DUP3-mzp4zW
> > > 
> 
> These values seem plausible for me. Can i use them to manually edit the
> PV /dev/hda2 to rescue some data? 
> 
> 
> MfG Michael
> 
> __________________________________________________
> Do You Yahoo!?
> Get email alerts & NEW webcam video instant messaging with Yahoo! Messenger
> http://im.yahoo.com
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
