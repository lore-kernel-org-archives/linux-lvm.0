Return-Path: <josv@osp.nl>
Date: Wed, 14 Mar 2001 13:56:01 +0100
From: Jos Visser <josv@osp.nl>
Subject: Re: [linux-lvm] linux lvm iop version?
Message-ID: <20010314135601.O599@jadzia.josv.com>
References: <A4A5E4C468B5D11190220001FA6835DD04DD8884@EPIXCH003>
Mime-Version: 1.0
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable
In-Reply-To: <A4A5E4C468B5D11190220001FA6835DD04DD8884@EPIXCH003>; from JSO@EUROPAY.COM on Wed, Mar 14, 2001 at 02:09:59PM +0100
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
Cc: =?iso-8859-1?Q?SOETE_Jo=EBl?= <JSO@EUROPAY.COM>

There have been patches to LILO flying around the mailing list that
would enable LILO to boot the kernel from a logical volume. This would
obviate the need for a separate /boot native partition.=20

IOP is the protocol between the userland and kernel components of the
LVM. When we (or actually, Heinz c.s.) add features to LVM, the IOP
might change so as to enable these new features to be controlled through
the LVM's commands. To guard against older tools talking to a newer
kernel module (or vice versa), the tools check the IOP version that the
kernel expects. If they do not match with the IOP version to tools have
been developed for, they abort their processing.

++Jos

And thus it came to pass that SOETE Jo=EF=BF=BDl wrote:
(on Wed, Mar 14, 2001 at 02:09:59PM +0100 to be exact)

> Hello all,
>=20
> In my present position, I am in use to manage HP-UX server with LVM.
> Also I would like to implement a woody Debian on "full" LVM spare disk.
>=20
> But it seems that it is not absolutely possible because we need at least a
> small slice (partition) for /boot fs. Am I right?
>=20
> Then I have a look into 'lvmcreate_initrd' and found the option '-i'
> specifying LVM IOP version.
> I do not found any explanation on what IOP is.
> Is someone can advise me about this (is it for special material? what are
> its advantage?...) or where can I found those information (I already have=
 a
> look into LVM HOWTO maintained by AJ Lewis but there is not mention of IO=
P)?
>=20
> Thanks in advance for information,
> 	Joel
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

--=20
Each betrayal begins with trust.
