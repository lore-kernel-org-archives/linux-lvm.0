From: "William Blunn" <bill+f.9sfuw6uo@tao-group.com>
Subject: Re: [linux-lvm] RAID & LVM
Message-ID: <BDEMIPDEGABMNEFIHCPDAEFLDJAA.bill+f.9sfuw6uo@tao-group.com>
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
In-Reply-To: <2411209499ABD41180270090274DD8BC0337F1EA@zafnt2>
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
Date: Tue Jun 25 11:19:02 2002
List-Id: <linux-lvm.redhat.com>
Content-Type: text/plain; charset="us-ascii"
To: linux-lvm@sistina.com

> I know it seems to be a very old question, but I can't find in=20
> the previous messages, the answer for that..
>=20
> Is it possible to use RAID and LVM together? If positive, is=20
> there a HOW-TO telling something about it?

Yes it works well.

Use the standard RAID stuff to make a raid device, say /dev/md0, then creat=
e a PV (LVM Physical Volume) on that, then make a VG (LVM volume group) out=
 of that PV, then create LVs (LVM Logical Volumes) in the VG.

Then (unless you have some other use for them), create filesystems in the L=
Vs.

I use LVM over RAID1 on ATA disks using Ultra-ATA mode 4 (66 MB/s) or highe=
r.

> LVM will support mirroring someday?

Not AFAIK.

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
