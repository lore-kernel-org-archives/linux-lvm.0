Return-Path: <ragnark@stine.vestdata.no>
Date: Thu, 28 Jun 2001 02:41:04 +0200
From: =?iso-8859-1?Q?Ragnar_Kj=F8rstad?= <lvm@ragnark.vestdata.no>
Subject: Re: [linux-lvm] LVM metadata corruption?
Message-ID: <20010628024104.D380@vestdata.no>
References: <20010628022307.A380@vestdata.no>
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
In-Reply-To: =?iso-8859-1?Q?=3C20010628022307=2EA380=40vestdata=2Eno=3E=3B_from_Ragna?=
 =?iso-8859-1?Q?r_Kj=F8rstad_on_Thu=2C_Jun_28=2C_2001_at_02:23:07AM_+0200?=
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

On Thu, Jun 28, 2001 at 02:23:07AM +0200, Ragnar Kj=EF=BF=BDrstad wrote:
> Hi
>=20
> We had a LVM problem that we believe was caused by corrupted
> LVM-metadata. Can anyone confirm if this is a likely explanation?

Oh, I forgot to mention LVM-version ++.

Used "lvm-0.9.1_beta7-2.4.5" patch, except one chunk that failed
becaused it is also included in XFS-patch.

Binary utilities, 0.9.1_beta7.


--=20
Ragnar Kjorstad
Big Storage
