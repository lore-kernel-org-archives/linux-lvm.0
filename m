Subject: Re: [linux-lvm] Segment Failure ,while doing lvcreate
From: Thomas Svedberg <thsv@bigfoot.com>
In-Reply-To: <20011025114525.88548.qmail@web16301.mail.tpe.yahoo.com>
References: <20011025114525.88548.qmail@web16301.mail.tpe.yahoo.com>
Content-Transfer-Encoding: quoted-printable
Message-Id: <1004013551.2598.52.camel@athlon1.hemma.se>
Mime-Version: 1.0
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
Date: Thu Oct 25 07:38:02 2001
List-Id: <linux-lvm.redhat.com>
Content-Type: text/plain; charset="iso-8859-1"
To: linux-lvm@sistina.com

tor 2001-10-25 klockan 13.45 skrev David Chang:
> Hi all:
> My LVM version is 1.0.1-rc4 with RH 7.1,kernel 2.4.2-2
> pvcreate is ok
> vgcreate is ok=20
> but while doing lvcreate -L 20G puv_vg,then got error
> messages "Segmentation fault(core dump).
>=20
> how to fix it ?

Seems RedHat compiler have problems with optimization turned on, try
compiling with -O0.

--=20
/ Thomas
.......................................................................
 Thomas Svedberg
 Department of Mathematics
 Chalmers University of Technology

 Address: S-412 96 G=F6teborg, SWEDEN
 E-mail : thsv@bigfoot.com, thsv@math.chalmers.se
 Phone  : +46 31 772 5368
 Fax    : +46 31 772 3595
.......................................................................
