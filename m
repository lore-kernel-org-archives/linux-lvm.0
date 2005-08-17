Received: from mx3.redhat.com (mx3.redhat.com [172.16.48.32])
	by int-mx1.corp.redhat.com (8.11.6/8.11.6) with ESMTP id j7HGufV31756
	for <linux-lvm@redhat.com>; Wed, 17 Aug 2005 12:56:41 -0400
Received: from zproxy.gmail.com (zproxy.gmail.com [64.233.162.203])
	by mx3.redhat.com (8.13.1/8.13.1) with ESMTP id j7HGuZBN016959
	for <linux-lvm@redhat.com>; Wed, 17 Aug 2005 12:56:36 -0400
Received: by zproxy.gmail.com with SMTP id z31so278886nzd
	for <linux-lvm@redhat.com>; Wed, 17 Aug 2005 09:56:30 -0700 (PDT)
Message-ID: <12984bb00508170956627f12f6@mail.gmail.com>
Date: Wed, 17 Aug 2005 10:56:29 -0600
From: "Donald Murray, P.Eng." <donaldm314@gmail.com>
Subject: Re: [linux-lvm] lvcreate --snapshot ---> file descriptor 7 left open?
In-Reply-To: <DF6FD933C3914D409E8CA14EE01A026C02F14AA8@e8sbh.ditscom.dsh.de>
Mime-Version: 1.0
Content-Disposition: inline
References: <DF6FD933C3914D409E8CA14EE01A026C02F14AA8@e8sbh.ditscom.dsh.de>
Content-Transfer-Encoding: quoted-printable
Reply-To: LVM general discussion and development <linux-lvm@redhat.com>
List-Id: LVM general discussion and development <linux-lvm.redhat.com>
List-Unsubscribe: <https://www.redhat.com/mailman/listinfo/linux-lvm>,
	<mailto:linux-lvm-request@redhat.com?subject=unsubscribe>
List-Archive: <https://www.redhat.com/archives/linux-lvm>
List-Post: <mailto:linux-lvm@redhat.com>
List-Help: <mailto:linux-lvm-request@redhat.com?subject=help>
List-Subscribe: <https://www.redhat.com/mailman/listinfo/linux-lvm>,
	<mailto:linux-lvm-request@redhat.com?subject=subscribe>
List-Id: <linux-lvm.redhat.com>
Content-Type: text/plain; charset="iso-8859-1"
To: LVM general discussion and development <linux-lvm@redhat.com>

We currently use LVM2 snapshots to backup a MySQL database. To quiesce
our database we issue a 'flush tables with read lock', then snapshot,
then release
the lock.=20

This approach yields consistent snapshots of our database.=20

We do our snapshot in a Perl script. This allows us to create and hold
a connection to the database during the entire flush, snapshot, unlock
process. I don't think you'll be able to do that directly in ksh. The 'flush
tables with read lock' only persists as long as the connection is active.


On 8/17/05, Lutz.Reinegger@t-systems.com <Lutz.Reinegger@t-systems.com> wro=
te:
> Hey there,
>=20
> currently I am testing a small backup script (ksh) which is supposed to c=
reate snapshots
> of my MySQL database file systems using the Linux LVM2 snapshot feature.
>=20
> Here is the command I am using:
> "/usr/sbin/lvcreate -L 10240M --snapshot -p r -n mysqlsnap /dev/datavg/my=
sqllv"
>=20
> It works fine so far ($? =3D 0), however I am seeing some kind of strange=
 messages:
> "
> File descriptor 7 left open
>   Logical volume "mysqlsnap" created
> "
>=20
> A month ago J=EF=BF=BDrgen reported similar messages using "lvdisplay":
> https://www.redhat.com/archives/linux-lvm/2005-July/msg00069.html
> Alasdair then pointed out that this message is (only?) a warning message:
> https://www.redhat.com/archives/linux-lvm/2005-July/msg00070.html
>=20
> Here 's my question:
> Do I have to be worried about the consistency of my snapshots in any way
> because of this message?
>=20
> Operating system  : RedHat Enterprise Linux 4 for IA32 + latest patches.
> Kernel version    : 2.6.9-11.ELsmp
>=20
> lvm> version
>   LVM version     : 2.01.08 (2005-03-22)
>   Library version : 1.01.01 (2005-03-29)
>   Driver version  : 4.4.0
> lvm>
>=20
> Kind regards
> Lutz Reinegger
>=20
> _______________________________________________
> linux-lvm mailing list
> linux-lvm@redhat.com
> https://www.redhat.com/mailman/listinfo/linux-lvm
> read the LVM HOW-TO at http://tldp.org/HOWTO/LVM-HOWTO/
>
