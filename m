content-class: urn:content-classes:message
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Subject: RE: [linux-lvm] LVM for a Database
Message-ID: <8075D5C3061B9441944E137377645118012DB3@cinshrexc03.shermfin.com>
From: "Rechenberg, Andrew" <arechenberg@shermfin.com>
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
Date: Tue Nov 26 16:19:03 2002
List-Id: <linux-lvm.redhat.com>
Content-Type: text/plain; charset="us-ascii"
To: linux-lvm@sistina.com

You're going to get better performance if you have /dev/sd[b-e] and then
span across those devices or use LVM striping.  That is RAID10.

I have a Dell 6600 with two PowerVault 220S with the second
configuration (12 RAID1 arrays, /dev/sd[c-n]) and then use Linux
software RAID0 to stripe across those 12 RAID1 arrays.  It gives fairly
good performance.

I don't have LVM on top of the RAID0, but I will be doing just that in
the near future and I can post the results here if you wish.

Regards,
Andy.

-----Original Message-----
From: Joseph Kezar [mailto:jkezar@doc.state.vt.us]=20
Sent: Tuesday, November 26, 2002 3:29 PM =20
To: linux-lvm@sistina.com
Subject: [linux-lvm] LVM for a Database


We are in the process of building a database on a 4 processor 1.8GHz,
4GB RAM Dell 6650.

I am trying to figure out the most efficient way to use LVM for our raw
data storage.  We have a RAID array with 8x36GB drives in it.  Should I
do a raid 1+0(mirror 4 disks, and span them to get one logical volume)?

If so this leaves me a /dev/sdb.  Or would I get better performance if I
mirror 1 + 5, 2 + 6, 3 + 7, 4+ 8 to give me /dev/sd[b-e].
Is it possible to figure out where the center of our spindles are?  So I
can arrange for the heads to spend little time seeking?

Any perfomance hints would be greatly appreciated.

thanks
Joe K.
