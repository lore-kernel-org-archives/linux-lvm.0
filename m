Return-Path: <bluca@comedia.it>
Date: Sun, 5 Aug 2001 09:12:01 +0200
From: Luca Berra <bluca@comedia.it>
Subject: Re: [linux-lvm] LVM with multi-path disks?
Message-ID: <20010805091201.A4490@colombina.comedia.it>
References: <3B6B30C4.B4427F3D@cup.hp.com> <20010804174049.B564@colombina.comedia.it> <20010805022800.A26419@vestdata.no>
Mime-Version: 1.0
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable
In-Reply-To: <20010805022800.A26419@vestdata.no>; from lvm@ragnark.vestdata.no on Sun, Aug 05, 2001 at 02:28:01AM +0200
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

On Sun, Aug 05, 2001 at 02:28:01AM +0200, Ragnar Kj=EF=BF=BDrstad wrote:
> On Sat, Aug 04, 2001 at 05:40:49PM +0200, Luca Berra wrote:
> > John, there is an addition for multi-path to the md driver
> > you can fetch it from the redhat source kernel rpm.
> > you can then stack lvm on top of md to achieve your goal
>=20
> E.g. you have a md0 device consisting of sda and sdb - would not lvm
> find three different paths to the same data (sda, sdb, md0) when
> scanning for physical volumes? Will that not cause problems?

there is an (*horrible*) piece of code in pv_read_all_pv.c
that deals with multiple entries for the same PV, so all duplicate
PV are skipped, so the md will be the obly one detected.
what probably happened to John is, that his PV was killed by
this routine (they were duplicate and not md devices)

regards
L.
--=20
Luca Berra -- bluca@comedia.it
        Communication Media & Services S.r.l.
 /"\
 \ /     ASCII RIBBON CAMPAIGN
  X        AGAINST HTML MAIL
 / \
