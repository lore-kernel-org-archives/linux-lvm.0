From: Gingia <gingiabios@email.it>
Subject: Re: [linux-lvm] vgcfgrestore and bootstrap
References: <200309231754.20420.gingiabios@email.it> <20030924103749.C2618@sistina.com>
In-Reply-To: <20030924103749.C2618@sistina.com>
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Message-Id: <200309241414.47229.gingiabios@email.it>
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
Date: Wed Sep 24 07:23:01 2003
List-Id: <linux-lvm.redhat.com>
Content-Type: text/plain; charset="iso-8859-1"
To: linux-lvm@sistina.com

Alle 10:37, mercoled=EC 24 settembre 2003, Heinz J . Mauelshagen ha scrit=
to:
> Gingia,
>
> the normal procedure is "vgscan ; vgchange -ay ; mount -a"
> rather than vgcfgrestore before vgchange.
=2E..
> Have you tried "vgscan ; vgchange -ay ; mount -a" before ?
> (keep in mind, that vgscan needs space below /etc/ to store metadata
> copies)

I controlled the script of bootstrap  to see if there is the apropiated e=
ntry,=20
and it seems is ok, i also re-started the server .
I  tried "vgscan" and i have the output:
invalidate :dirty buffer=20
invalidate :busy buffer =20
(any time)
vgscan -- "/etc/lvmtab" and  "7etc/lvmtab.d" successfully created=20
vgscan -- WARNING: this programm doe not do a VGDA backup of your group

after i do :
vgchange -ay=20
and the output was:
vgchange -- no volume group found=20

so i made the restore:
vgcfgrestore .........
the ouptput was=20
vgcfgrestore -- VGDA for "Volume1" successfully restored to phisical volu=
me=20
"/dev/i2o/hda3"=20
vgcfgrestore  -- you may not have an actual backup of restored group "vol=
ume1"

then i can do  vgchange -ay  and go on=20

This is all , was it the matter?

Thank you
