Message-Id: <200404270647.i3R6lv0c012511@smtp.doruk.net.tr>
From: "Vahric MUHTARYAN" <vahric@doruk.net.tr>
Subject: RE: [linux-lvm] About storing Lvm configuration
Date: Tue, 27 Apr 2004 09:44:29 +0300
MIME-Version: 1.0
In-Reply-To: <20040426222842.GA16292@redhat.com>
Content-Transfer-Encoding: quoted-printable
Reply-To: LVM general discussion and development <linux-lvm@redhat.com>
List-Id: LVM general discussion and development <linux-lvm.redhat.com>
List-Unsubscribe: <https://www.redhat.com/mailman/listinfo/linux-lvm>,
	<mailto:linux-lvm-request@redhat.com?subject=unsubscribe>
List-Archive: </archives/linux-lvm>
List-Post: <mailto:linux-lvm@redhat.com>
List-Help: <mailto:linux-lvm-request@redhat.com?subject=help>
List-Subscribe: <https://www.redhat.com/mailman/listinfo/linux-lvm>,
	<mailto:linux-lvm-request@redhat.com?subject=subscribe>
List-Id: <linux-lvm.redhat.com>
Content-Type: text/plain; charset="iso-8859-1"
To: mauelshagen@redhat.com, 'LVM general discussion and development' <linux-lvm@redhat.com>

Okey , I checked it ..=20

Do you talk about this ?!=20

/* disk stored PV, VG, LV and PE size and offset information */
typedef struct {
        uint32_t base;
        uint32_t size;
} lvm_disk_data_t;


=EF=BF=BDt's look like MBR , because MBR write information 0 sector and I k=
now that
MBR have a backup of information end of the partition or disk !?=20

Does LVM take a backup information of begining of each PV ?!=20

Thanks _!=20
Vahric MUHTARYAN=20

-----Original Message-----
From: linux-lvm-bounces@redhat.com [mailto:linux-lvm-bounces@redhat.com] On
Behalf Of Heinz Mauelshagen
Sent: Tuesday, April 27, 2004 1:29 AM
To: LVM general discussion and development
Subject: Re: [linux-lvm] About storing Lvm configuration

On Mon, Apr 26, 2004 at 11:54:33PM +0300, Vahric MUHTARYAN wrote:
> Hi ,=20
>=20
> I red the documents but still I don't know where is lvm configuration
stored
> ?! ( Maybe I past :(  )  =20

At the beginnng of each PV (see lvm.h for details).

> Can I move lvm configured disk from one computer to another computer ?!=20

Yes, you need to move all disks of a VG to the other computer.

>=20
> Thanks
> Vahric=20
>=20
> _______________________________________________
> linux-lvm mailing list
> linux-lvm@redhat.com
> https://www.redhat.com/mailman/listinfo/linux-lvm
> read the LVM HOW-TO at http://tldp.org/HOWTO/LVM-HOWTO/

--=20

Regards,
Heinz    -- The LVM Guy --

*** Software bugs are stupid.
    Nevertheless it needs not so stupid people to solve them ***

=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D=
-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=
=3D-
=3D-

Heinz Mauelshagen                                 Red Hat GmbH
Consulting Development Engineer                   Am Sonnenhang 11
                                                  56242 Marienrachdorf
                                                  Germany
Mauelshagen@RedHat.com                            +49 2626 141200
                                                       FAX 924446
=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D=
-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=
=3D-
=3D-
_______________________________________________
linux-lvm mailing list
linux-lvm@redhat.com
https://www.redhat.com/mailman/listinfo/linux-lvm
read the LVM HOW-TO at http://tldp.org/HOWTO/LVM-HOWTO/
