From: "William Blunn" <bill+f.9sfuw6uo@tao-group.com>
Subject: Re: [linux-lvm] lvm and md
Message-ID: <BDEMIPDEGABMNEFIHCPDMEOFEJAA.bill+f.9sfuw6uo@tao-group.com>
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
In-Reply-To: <BDEMIPDEGABMNEFIHCPDKEODEJAA.bill+f.9sfuw6uo@tao-group.com>
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
Date: Mon Mar 10 03:29:02 2003
List-Id: <linux-lvm.redhat.com>
Content-Type: text/plain; charset="us-ascii"
To: linux-lvm@sistina.com

> I don't think it would be a good idea to put MD on top of LVM for
> reasons of performance. Ideally you want as few layers as possible on
> top of the disk.

Putting MD on top of LVM puts in one extra layer.

This layer will have to be traversed for every single access to the
disk.

Actually having a layer is unnecessary.

All that is necessary is to connect the MD to the right disk device
at the beginning when the MD is being started.

The MD is then connected to the disk with no intervening layers.

> As an alternative to Luca Berra's suggestion to use mdadm,
> it might be possible to do what you want using devfs.

Both of these suggestions address the problem of getting the MD
connected to the right disk at the beginning, without adding an
intervening layer.

Bill

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
