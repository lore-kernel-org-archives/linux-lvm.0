From: Jose Luis Domingo Lopez <linux-lvm@24x7linux.com>
Subject: Re: [linux-lvm] i got this error
Message-ID: <20030117191551.GA3610@localhost>
References: <000701c2be1a$4c8be960$820d2a3e@Desiportatil>
Mime-Version: 1.0
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable
In-Reply-To: <000701c2be1a$4c8be960$820d2a3e@Desiportatil>
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
Date: Fri Jan 17 13:15:01 2003
List-Id: <linux-lvm.redhat.com>
Content-Type: text/plain; charset="iso-8859-1"
To: linux-lvm@sistina.com

On Friday, 17 January 2003, at 12:19:27 +0100,
fnt wrote:

>  mount /dev/vg/vol1 /glftpd/site
> mount: /dev/vg/vol1 no es un dispositivo de bloques v=C3=A1lido
> thanx on advice
>=20
For those on the list with no knowledge of the spanish language, a
translation of the error follows:
mount /dev/vg/vol1 /glftpd/site
mount: /dev/vg/vol1 is not a valid block device

Just guessing, but maybe your VG is not active. Try "vgchange -a y vg"
and try again. In any case, the more information you provide, the easier
to give your helpful advice.

Hope it helps.

--=20
Jose Luis Domingo Lopez
Linux Registered User #189436     Debian Linux Sid (Linux 2.4.20-xfs)
