From: "William Blunn" <bill+f.9sfuw6uo@tao-group.com>
Subject: Re: [linux-lvm] ext2resize error
Message-ID: <BDEMIPDEGABMNEFIHCPDIEGDDNAA.bill+f.9sfuw6uo@tao-group.com>
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
In-Reply-To: <OF05C6CA97.9049849B-ON86256C0D.0071EC23@TEXASMUTUAL.COM>
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
Date: Wed Aug  7 05:12:01 2002
List-Id: <linux-lvm.redhat.com>
Content-Type: text/plain; charset="us-ascii"
To: linux-lvm@sistina.com

> I have a Mandrake Linux 8.1 system with a 2.4.8 kernel.  My=20
> logical volumes
> include /usr, /var and /home (not / or /boot).  I originally set up all
> lv(s) as ext3, which seemed to preclude the ext2_online patch.  My
> /dev/sys/usr lv shows 2.44 gig in lvdisplay.  My one PV shows 3616 free
> PEs.  df shows /usr to be 2,015,824 (k) and 96% utilized.  I run telinit 1
> then umount -a.  /usr unmounts.  I then run ext2resize /dev/sys/usr.  It
> returns "Your filesystem is too occupied to resize it to 16000 bytes."

The e2fsprogs package (the package which contains e2fsck etc.) has containe=
d resize2fs ever since version 1.19 (13 July 2000).

resize2fs, being part of the e2fsprogs, is therefore the official ext2 resi=
zer.

ext2resize and resize2fs are completely different in implementation althoug=
h they (notionally) do the same job.

resize2fs was originally written to be part of a commercial product, but th=
e contract allowed for it to be made open after a period of time.

In the meantime, the open community were desperate for an open ext2fs resiz=
er, so ext2resize was written.

However resize2fs is the better tool.

I have personally found that ext2resize fails for filesystems over 64GiB in=
 size.

Since an official tool has been available for over two years, I can't see h=
ow ext2resize would have received much attention in that time.

My advice would be to cut your losses and switch to the official, maintaine=
d, tool, resize2fs.

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

Visit our website at http://tao-group.com/
