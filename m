Message-ID: <3BD80807.4725174F@carolina.rr.com>
From: Jason Edgecombe <jedgecombe@carolina.rr.com>
MIME-Version: 1.0
Subject: Re: [linux-lvm] Segment Failure ,while doing lvcreate
References: <20011025114525.88548.qmail@web16301.mail.tpe.yahoo.com>
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
Date: Thu Oct 25 07:38:07 2001
List-Id: <linux-lvm.redhat.com>
Content-Type: text/plain; charset="iso-8859-1"
To: linux-lvm@sistina.com

hi,

  recompile lvm tools with the -O0 flag (no optimization).
this is because of redhat's 7.x borken gcc compiler

I believe that this fix is in the archive.

Jason Edgecombe

David Chang wrote:
>=20
> Hi all:
> My LVM version is 1.0.1-rc4 with RH 7.1,kernel 2.4.2-2
> pvcreate is ok
> vgcreate is ok
> but while doing lvcreate -L 20G puv_vg,then got error
> messages "Segmentation fault(core dump).
>=20
> how to fix it ?
>=20
> -----------------------------------------------------------------
> < =A8C=A4=D1=B3=A3 Yahoo!=A9_=BC=AF >  www.yahoo.com.tw
>=20
> _______________________________________________
> linux-lvm mailing list
> linux-lvm@sistina.com
> http://lists.sistina.com/mailman/listinfo/linux-lvm
> read the LVM HOW-TO at http://www.sistina.com/lvm/Pages/howto.html
