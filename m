Return-Path: <russell@coker.com.au>
From: Russell Coker <bofh@coker.com.au>
Subject: Re: [linux-lvm] Debian packaging
Date: Thu, 21 Dec 2000 08:53:29 +1100
References: <XFMail.20001219212422.fionn@unix-ag.org>
In-Reply-To: <XFMail.20001219212422.fionn@unix-ag.org>
MIME-Version: 1.0
Message-Id: <0012210853290U.08762@lyta>
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
Content-Type: text/plain; charset="us-ascii"
To: linux-lvm@sistina.com, Fionn Behrens <Fionn.Behrens@unix-ag.org>

> > Think PATH - this is really easy, and shells already support it.  No =
more
> > work to be done, and it's not ugly.  The IOP version will probably ne=
ver
> > change within a boot (unless LVM is a module and it gets upgraded wit=
hout
> > upgrading the kernel - unlikely).
>
> Shouldnt the debian alternatives mechanism (see "man 8
> update-alternatives") be most appropriate for this task?

Update-alternatives doesn't work when the file-system in question is moun=
ted=20
read-only.  Also it's not really designed to be run at every boot.

PATH is a bad idea IMHO.  It is set in too many places and has too many=20
possibilities to be stuffed up.

--=20
http://www.coker.com.au/bonnie++/     Bonnie++ hard drive benchmark
http://www.coker.com.au/postal/       Postal SMTP/POP benchmark
http://www.coker.com.au/projects.html Projects I am working on
http://www.coker.com.au/~russell/     My home page
