From: =?iso-8859-1?Q?Ragnar_Kj=F8rstad?= <lvm@ragnark.vestdata.no>
Subject: Re: [linux-lvm] LVM in Dual Path SAN Environment
Message-ID: <20020912135047.H30625@vestdata.no>
References: <3D7F0F54.86F71021@az1.de>
Mime-Version: 1.0
Content-Disposition: inline
In-Reply-To: <3D7F0F54.86F71021@az1.de>; from schindler@az1.de on Wed, Sep 11, 2002 at 11:39:32AM +0200
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
Date: Thu Sep 12 06:51:52 2002
List-Id: <linux-lvm.redhat.com>
Content-Type: text/plain; charset="iso-8859-1"
To: linux-lvm@sistina.com

On Wed, Sep 11, 2002 at 11:39:32AM +0200, Andreas G. Schindler wrote:
> A Question to the LVM Guy(s):
>=20
> We would like to use Linux LVM to overcome the fact, Linux doesn't=20
> currently support Dual-Path access to SAN (Fibre-Channel) units.

If you use md this should work just fine. There has been a number of
patches lately that hasn't been included in the main kernel yet, so you
may want to patch a little.=20


--=20
Ragnar Kj=F8rstad
