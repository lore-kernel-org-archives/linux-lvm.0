Message-ID: <3BBD9F67.2E227B69@promofinarsa.es>
Date: Fri, 05 Oct 2001 13:54:15 +0200
From: Jesus Manuel NAVARRO LOPEZ <jesus_navarro@promofinarsa.es>
MIME-Version: 1.0
Subject: Re: [linux-lvm] Clarification
References: <00ba01c14d93$70ec7340$836788cf@industry>
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

Hi Jason:

"Jason A. Lixfeld" wrote:
>=20
> I'm just looking for clarification:
>=20
> ext2resize will actually resize ext3 aswell?  With no extra flags?  It
> will just know that the LVM is ext3 and not ext2?
>=20

I would say you better check it on ext2resize and ext3 man pages.  By
default I wouldn't expect ext2 tools to work with ext3 (anyway, you just
can test it on a non-production environment).
--=20
SALUD,
Jes=EF=BF=BDs
***
jesus_navarro@promofinarsa.es
***
