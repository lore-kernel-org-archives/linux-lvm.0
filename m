content-class: urn:content-classes:message
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Subject: RE: [linux-lvm] lvm and md
Message-ID: <8075D5C3061B9441944E137377645118012E8F@cinshrexc03.shermfin.com>
From: "Rechenberg, Andrew" <ARechenberg@shermanfinancialgroup.com>
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
Date: Mon Mar 10 06:57:01 2003
List-Id: <linux-lvm.redhat.com>
Content-Type: text/plain; charset="us-ascii"
To: linux-lvm@sistina.com

Someone please correct me if I'm wrong, but I believe mdadm can start
the arrays based on the RAID superblock UUID.  So even if the device
name changes it still knows which partition belongs to which md device.


Mdadm is an alternative software RAID management utility.  It is very
nice.  Check it out at http://www.cse.unsw.edu.au/~neilb/source/mdadm/

Hope this helps,
Andy.

-----Original Message-----
From: Jon Bendtsen [mailto:jon+lvm@silicide.dk]=20
Sent: Monday, March 10, 2003 4:50 AM
To: linux-lvm@sistina.com
Subject: Re: [linux-lvm] lvm and md


Peter Yao wrote:
>=20
> Jon Bendtsen wrote:
> > Peter Yao wrote:
> >
> >>Should we build lvm volumns on top of soft raid(md) or build md on=20
> >>top of lvm volumns? I prefer to build md on top of lvm volumns=20
> >>because lvm can hide the hardware details from md. Just want to know

> >>how do you think about this. Or any URLs? Thanks.
> >
> >
> > why would you need to hide the hardware details from md ?
> I am using some hot-plugging disks and their device number may change=20
> after reboot. For example, if i build md with /dev/sda and /dev/sdb,=20
> after reboot md may cannot start because the two disks' device name=20
> change to /dev/sdc and /dev/sdd. If i build md on top of lvm this=20
> problem is avoided. Can you give me some advice for this issue?

sure. Dont change device names ;-D

Perhaps you can use labels ? and label the partitions ?

Another thing is that i dont think the kernel uses /etc/raidtab i think
it looks at the partitions and then starts the md. You=20
can set the partition type to raid autodetect. Then it might work even
if you change the partition names.


JonB

_______________________________________________
linux-lvm mailing list
linux-lvm@sistina.com
http://lists.sistina.com/mailman/listinfo/linux-lvm
read the LVM HOW-TO at http://tldp.org/HOWTO/LVM-HOWTO/
