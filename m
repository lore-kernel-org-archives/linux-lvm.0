Message-ID: <001401c13a7d$64cd8c80$5921fea9@warl0k>
From: "Glenn Shannon" <warl0k@lvcm.com>
References: <000b01c13a74$653a4720$0300000a@pacbell.net>
Subject: Re: [linux-lvm] missing vg after reboot
Date: Mon, 10 Sep 2001 21:51:17 -0700
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
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
Content-Type: text/plain; charset="iso-8859-1"
To: linux-lvm@sistina.com

And Debian initscripts are taken care of if you "apt-get install lvmtools=
" I
believe.....I would double check that but I am not *gasp* in Linux right =
now
:)

Glenn
----- Original Message -----
From: "Erick Calder" <e@arix.com>
To: <linux-lvm@sistina.com>
Sent: Monday, September 10, 2001 8:46 PM
Subject: RE: [linux-lvm] missing vg after reboot


actually that's also true of RedHat 7.0 and 7.1

- e r i c k

-----Original Message-----
From: linux-lvm-admin@sistina.com [mailto:linux-lvm-admin@sistina.com] On
Behalf Of IT3 Stuart B. Tener, USNR-R
Sent: Monday, September 10, 2001 7:38 PM
To: linux-lvm@sistina.com
Subject: RE: [linux-lvm] missing vg after reboot

List members:

It might be worth adding to the How-To that no initscript modifications a=
re
necessary for Linux Mandrake, as their default rc.sysinit script contains
code in it to do the vg initialization on boot up.


Very Respectfully,

Stuart Blake Tener, IT3, USNR-R, N3GWG
Beverly Hills, California
VTU 1904G (Volunteer Training Unit)
stuart@bh90210.net
west coast: (310)-358-0202 P.O. Box 16043, Beverly Hills, CA 90209-2043
east coast: (215)-338-6005 P.O. Box 45859, Philadelphia, PA 19149-5859

Telecopier: (419)-715-6073 fax to email gateway via www.efax.com (it's
free!)

JOIN THE US NAVY RESERVE, SERVE YOUR COUNTRY, AND BENEFIT FROM IT ALL.

Monday, September 10, 2001 7:34 PM

-----Original Message-----
From: linux-lvm-admin@sistina.com [mailto:linux-lvm-admin@sistina.com]On
Behalf Of Michael Holschbach
Sent: Monday, September 10, 2001 8:49 AM
To: linux-lvm@sistina.com
Subject: Re: [linux-lvm] missing vg after reboot


--- "Heinz J . Mauelshagen" <mauelshagen@sistina.com> wrote:
>
> Michael,
>
> the pvdata output below exposes a completely messy PV structure,
> which makes me think of 2 possible reasons:
>
> a. /dev/hda2 is not the device you used to create a physical volume
>
> b. something accidentially overwrote /dev/hda2 after the PV creation
>
>
> If b is true you might still have an actual VGDA backup in
> /etc/lvmconf/ which
> you can use to vgcfgrestore(8) it to /dev/hda2 presumed that
> /dev/hda2 is
> the right device.
>
I already tried vgcfgrestore. All available backup files lead to the
same result:

> > server1:~ # vgcfgrestore -v -n data /dev/hda2
> > vgcfgrestore -- locking logical volume manager
> > vgcfgrestore -- restoring volume group "data" from
> > "/etc/lvmconf/data.conf"
> > vgcfgrestore -- checking existence of
> > "/etc/lvmconf/data.conf"
> > vgcfgrestore -- reading volume group data for "data"
> > from "/etc/lvmconf/data.con
> > f"
> > vgcfgrestore -- reading physical volume data for
> > "data" from "/etc/lvmconf/data.
> > conf"
> > vgcfgrestore -- reading logical volume data for "data"
> > from "/etc/lvmconf/data.c
> > onf"
> > vgcfgrestore -- checking volume group consistency of
> > "data"
> > vgcfgrestore -- checking volume group consistency of
> > "data"
> > vgcfgrestore -- reading physical volume "/dev/hda2"
> > vgcfgrestore -- ERROR "pv_read(): PV identifier
> > invalid" reading physical volume
> >  "/dev/hda2"
> >
My idea was to reset the values of /dev/hda2 according to the following
settings:

> > server1:~ # vgcfgrestore -v -ll -n data /dev/hda2
...
> > --- Physical volume ---
> > PV Name               /dev/hda2
> > VG Name               data
> > PV Size               27.62 GB / NOT usable 2.48 MB
> > [LVM: 148 KB]
> > PV#                   2
> > PV Status             available
> > Allocatable           yes
> > Cur LV                6
> > PE Size (KByte)       4096
> > Total PE              7069
> > Free PE               669
> > Allocated PE          6400
> > PV UUID
> > e7sX5R-XnTm-keX6-jShf-tTlw-DUP3-mzp4zW
> >

These values seem plausible for me. Can i use them to manually edit the
PV /dev/hda2 to rescue some data?


MfG Michael

__________________________________________________
Do You Yahoo!?
Get email alerts & NEW webcam video instant messaging with Yahoo! Messeng=
er
http://im.yahoo.com

_______________________________________________
linux-lvm mailing list
linux-lvm@sistina.com
http://lists.sistina.com/mailman/listinfo/linux-lvm
read the LVM HOW-TO at http://www.sistina.com/lvm/Pages/howto.html
=FF=FF=FF=FF=FF=FF=FF=FF=FF=FF=FF=FF=FF=FF=FF=FF=FF=FF=FF=FF=FF=FF=FF=FF=FF=
=FF=FF=FF=FF=FF=FF=FF=FF=FF=FF=E5S{=B1=FE[=E6(tm)=A8=A5Sx%S=CBeS{=B1=FE[=E6=
=FE=C8=AC=B6)=DA=FD=CA&?=DBi=FF=FF=E5S
=CBl=FE=C8=AC=B6)=DA=FD=CA&=FEf=A2-f=A7=FEX=AC=B6)=DF=A3=F9bz=EC=FF-=F9=AB=
y=A7m...=E2=D50s-=FD3s=B6=1Bm=A7=FF=FF=C3
=FF=B2+-Sv=FFr?=BF-=F9=BF=3D=A8-=B3=F8h=C2=DA=FF?=D9=A5


_______________________________________________
linux-lvm mailing list
linux-lvm@sistina.com
http://lists.sistina.com/mailman/listinfo/linux-lvm
read the LVM HOW-TO at http://www.sistina.com/lvm/Pages/howto.html
