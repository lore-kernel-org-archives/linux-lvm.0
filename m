From: "William Blunn" <bill+f.20020524@tao-group.com>
Subject: Re: [linux-lvm] about lvextend
Message-ID: <NBBBKNGPDGBANKFPOHCNKEDDGIAA.bill+f.20020524@tao-group.com>
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
In-Reply-To: <OF07A3509C.D6F63E8C-ON48256BC8.0028C10C@legend.com.cn>
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
Date: Wed May 29 03:06:02 2002
List-Id: <linux-lvm.redhat.com>
Content-Type: text/plain; charset="us-ascii"
To: linux-lvm@sistina.com

> I am puzzled about the function of lvextend.
> i know it's used to extend a logical volume,
> but in fact,i still need to use e2fsadm to increase the file system size =
to
> match.
> and e2fsadm can extend a logical volume too.
> so if i only use e2fsadm i can extend a logical volume,it's no useful to
> use lvextend.
> Is it right?

e2fsadm is just a wrapper for either:

  lvextend + ext2resize (increasing FS size)

or

  ext2resize + lvreduce (reducing FS size)

If all you want to do is to resize an ext2 filesystem, then there is no
need to invoke lvextend yourself; you can just use e2fsadm to do it for
you.

However e2fsadm only works with ext2 filesystems.

If you are using another filesystem (e.g. Reiserfs), then you would need
to invoke the LV resizing tool (lvextend or lvreduce) and the
filesystems resizing tool (e.g. resize_reiserfs) separately --- and in
the right order.

Bill
--=20
William H. Blunn - <bill+s.mq8r0gra@tao-group.com> - Developer Support
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
