Return-Path: <josv@osp.nl>
Date: Mon, 19 Mar 2001 13:03:47 +0100
From: josv@osp.nl
Subject: Re: [linux-lvm] lvm-0.9.1beta6 & kernel-2.4.2?
Message-ID: <20010319130347.B12796@gatekeeper.osp.nl>
References: <A4A5E4C468B5D11190220001FA6835DD04DD889A@EPIXCH003>
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
In-Reply-To: <A4A5E4C468B5D11190220001FA6835DD04DD889A@EPIXCH003>
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

Loopback devices are indeed broken on 2.4.2. AFAIK, it was restored
as of 2.4.2-ac3.

++Jos

On Mon, Mar 19, 2001 at 12:03:25PM +0100, SOETE Jo=EF=BF=BDl wrote:
> Hello all,
>=20
> Continuing my investigation to build an all lvm boot disk, I implement
> lvm-0.9.1beta6 on kernel-2.4.2.
>=20
> Then I run lvmcreate_initrd but script hang on mount -o loop ... ?
>=20
> As I do not use frequently loopback devices, I came back to 2.4.1 to test
> with 0.9.1.beta5 first then with 0.9.1beta6. It works all fine .
>=20
> Is something was broken in loopback device into 2.4.2 or do I have to use=
 a
> more recent release of 'mount' (dpkg shows me 2.10o)?
>=20
> Thanks in advance for help?
> 	Joel
>=20
>=20
>=20
> **********************************************************************
> This e-mail and any attachments to it may contain confidential informatio=
n which is strictly intended for the use of the authorised recipient.  If y=
ou have received this e-mail in error, please delete it and notify the send=
er by replying to this e-mail.
> Thank you for your co-operation.
> **********************************************************************
> _______________________________________________
> linux-lvm mailing list
> linux-lvm@sistina.com
> http://lists.sistina.com/mailman/listinfo/linux-lvm
