From: =?iso-8859-1?Q?Ragnar_Kj=F8rstad?= <lvm@ragnark.vestdata.no>
Subject: Re: [linux-lvm] Procedure to pvmove PE's on bad media?
Message-Id: <20011226185659.A22039@vestdata.no>
References: <1009367389020268@caramail.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <1009367389020268@caramail.com>; from
    o.di-sciullo@caramail.com on Wed, Dec 26, 2001 at 12:49:49PM +0000
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
Date: Wed Dec 26 11:54:01 2001
List-Id: <linux-lvm.redhat.com>
Content-Type: text/plain; charset="iso-8859-1"
To: linux-lvm@sistina.com

On Wed, Dec 26, 2001 at 12:49:49PM +0000, Octavio Di Sciullo wrote:
> 	I've tried to apply to pvmove (from lvm 0.9.1b7) the patch
> issued on this thread :
> http://lists.sistina.com/pipermail/linux-lvm/2001-September/008767.html
> , but unfortunately, it doesnt work :/. With this "forced"
> pvmove, i get an endless read loop :
>=20
> "read:-1 to_read:512
> read:-1 to_read:512
> read:-1 to_read:512
> read:-1 to_read:512"
> ..... (i let it run for about 4h and the output never
> changed, nor as the drive never ceased to produce scary
> noises)
>=20
> 	Now i dont really know if this the proper behavior of the
> patched pvmove in case it REALLY doesnt manage to read the
> data (i thought this was what the patch was for), or if i
> have a compatibility problem with my 0.9 lvm installed and
> the 0.9.1b7 patched pvmove.... I tried (a bit) to upgrade to
> 0.9.1b7 but i get dependency conflicts.


Did you run it as root?
(isn't -1=3D=3DEPERM, meaning you have no permission?)

The proper output (I think) should be:
read:-5 to_read:512
and with 4MB extent-size you should have 8192 such messages pr bad
extent (max).



--=20
Ragnar Kj=F8rstad
Big Storage
