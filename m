Message-ID: <3BBC7C22.1119BF0@promofinarsa.es>
Date: Thu, 04 Oct 2001 17:11:30 +0200
From: Jesus Manuel NAVARRO LOPEZ <jesus_navarro@promofinarsa.es>
MIME-Version: 1.0
Subject: Re: [linux-lvm] lvm 1.0 and kernel 2.2.19.Is rawio patch necessary ??
References: <3BBC550E.442F190C@ti.com>
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

Hi, Christian:

christian e wrote:
>=20
> Hi,all
>=20
> I downloaded lvm 1.0 and kernel 2.2.19.Couldn't find a rawio for 2.2.19
> so I thought it wasn't necessary.Is it ? The rawio patch for 2.2.19 is
> not here:
>=20
> ftp://ftp.kernel.org/pub/linux/kernel/people/sct/raw-io/
> or in the PATHCES dir..
>=20

Well, I'm in same position than you, but having problems.
I also asked about the necesity of raw-io patches (specifically for
2.2.19) but till the moment no answer.

> I did a ./configure and then a make in the patches dir.Applied that
> patch without problems.After compiling the kernel and booting up again I

Well, I patched kernel with raw-io for 2.2.18, and then with the lvm
patch provided by ./configure then make at PATCHES, but my kernel didn't
compile (well, the kernel did, but the make modules failed).

So, from your experience I'm going to try to compile *without* the
raw-io patch and see what happens.  Anyway, since I know that at least
your compilation was ended with success, would you be kind enough to
e-mail me your configuration file (/usr/src/linux/.config) to look for
differencies?

And, if you know about the reason or necesity (or lack of) the raw-io
patch stuff, please post it to the list, so others like will know.
TIA
--=20
SALUD,
Jes=EF=BF=BDs
***
jesus_navarro@promofinarsa.es
***
