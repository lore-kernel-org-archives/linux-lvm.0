Return-Path: <bluca@comedia.it>
Date: Mon, 19 Mar 2001 13:52:14 +0100
From: Luca Berra <bluca@comedia.it>
Subject: Re: [linux-lvm] lvm-0.9.1beta6 & kernel-2.4.2?
Message-ID: <20010319135214.B20137@colombina.comedia.it>
References: <A4A5E4C468B5D11190220001FA6835DD04DD889A@EPIXCH003>
Mime-Version: 1.0
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable
In-Reply-To: <A4A5E4C468B5D11190220001FA6835DD04DD889A@EPIXCH003>; from JSO@EUROPAY.COM on Mon, Mar 19, 2001 at 12:03:25PM +0100
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
To: "'linux-lvm@sistina.com'" <linux-lvm@sistina.com>

On Mon, Mar 19, 2001 at 12:03:25PM +0100, SOETE Jo=EF=BF=BDl wrote:
> Hello all,
>=20
> Continuing my investigation to build an all lvm boot disk, I implement
> lvm-0.9.1beta6 on kernel-2.4.2.
>=20
> Then I run lvmcreate_initrd but script hang on mount -o loop ... ?

smae thing here, i upgradet to the last -ac series and all is well

or you can usa a ramdrive for lvmcreate_initrd

l.

--=20
Luca Berra -- bluca@comedia.it
        Communication Media & Services S.r.l.
 /"\
 \ /     ASCII RIBBON CAMPAIGN
  X        AGAINST HTML MAIL
 / \
