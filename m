From: "William Blunn" <bill+f.9sfuw6uo@tao-group.com>
Subject: Re: [linux-lvm] raid1+lvm without initrd
Message-ID: <BDEMIPDEGABMNEFIHCPDGENPDPAA.bill+f.9sfuw6uo@tao-group.com>
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
In-Reply-To: <20020921020632.O68896-100000@true.fiberpimp.net>
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
Date: Mon Sep 23 04:49:02 2002
List-Id: <linux-lvm.redhat.com>
Content-Type: text/plain; charset="us-ascii"
To: linux-lvm@sistina.com

> A few of the regulars on this list seem to have a setup like this working.
>=20
> I have 2 disks mirrored with linux software raid-1. on top of this I have
> created 3 lv's: root, var, and swap. So far I have not been able to figure
> out the boot=3D,root=3D parameters that'll coax lilo into booting this.
>=20
> A few of the regulars on this list seem to have something like this
> working. Would someone post a working lilo configuration for a raid1+lvm
> noninitrd setup?
>=20
> references to setups like this working:
> http://lists.sistina.com/pipermail/linux-lvm/2002-September/012245.html
> http://lists.sistina.com/pipermail/lvm-devel/2001-October/000686.html

People often ask me questions to which my answer begins "One or more of
the premises on which your question is based is false, therefore your
question does not make any sense. Peeling back a layer and looking at
what you are really trying to achieve, you might find that your best
solution would be this: ... ".

Don't put your root filesystem in an LVM.

The small benefit of having it resizable is far outweighed by the setup
cost and the maintenance difficulties you will get when things go wrong.

Anything which is big and which might cause you to want to have a bigger
root filesystem shouldn't be in there, and should be in one of your
other filesystems instead.

If you don't have a suitable filesystem for the new big thing, you can
just create one --- you have an LVM!

Bill
--=20
William H. Blunn - <bill+s.9sfuw6uo@tao-group.com> - Developer Support
Tao
62/63 Suttons Business Park, Earley, READING, RG6 1AZ, United Kingdom
Tel: +44 118 901 2999 - Fax: +44 118 901 2963 - http://tao-group.com/

The contents of this e-mail and any attachments are confidential and may
be legally privileged. If you have received this e-mail and you are not
a named addressee, please inform us as soon as possible on
+44 118 901 2999 and then delete the e-mail from your system. If you are
not a named addressee you must not copy, use, disclose, distribute,
print or rely on this e-mail. Any views expressed in this e-mail or any
attachments may not necessarily reflect those of Tao's management.
Although we routinely screen for viruses, addressees should scan this
e-mail and any attachments for viruses. Tao makes no representation or
warranty as to the absence of viruses in this e-mail or any attachments.
Please note that for the protection of our business, we may monitor and
read e-mails sent to and from our server(s).

Visit our website at http://tao-group.com/
