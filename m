From: "William Blunn" <bill+f.9sfuw6uo@tao-group.com>
Subject: Re: [linux-lvm] lvm and md
Message-ID: <BDEMIPDEGABMNEFIHCPDKEODEJAA.bill+f.9sfuw6uo@tao-group.com>
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
In-Reply-To: <3E6BEB8B.4040802@exavio.com.cn>
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
Date: Mon Mar 10 03:05:02 2003
List-Id: <linux-lvm.redhat.com>
Content-Type: text/plain; charset="us-ascii"
To: linux-lvm@sistina.com

Peter Yao <peter@exavio.com.cn> wrote:
> I am using some hot-plugging disks and their device number may change=20
> after reboot. For example, if i build md with /dev/sda and /dev/sdb,=20
> after reboot md may cannot start because the two disks' device name=20
> change to /dev/sdc and /dev/sdd. If i build md on top of lvm this=20
> problem is avoided. Can you give me some advice for this issue?

I don't think it would be a good idea to put MD on top of LVM for
reasons of performance. Ideally you want as few layers as possible on
top of the disk.

As an alternative to Luca Berra's suggestion to use mdadm,
it might be possible to do what you want using devfs.

I'm not saying it's a better approach, just a possible alternative. The
best approach will depend on your particular situation.

(The mdadm approach looks like a good technical solution to your
situation. However, for example, you may already have devfs installed,
in which case it might be easier to set up and "good enough" to be going
on with.)

I have never used devfs myself, by from what I can tell it gives logical
names to SCSI devices, which are invariant of devices being added to
or removed from a SCSI bus.

So your HDDs would appear as something like:

  /dev/scsi/host0/bus0/target5/lun0/disc
  /dev/scsi/host0/bus0/target6/lun0/disc

You mention that /dev/sda and /dev/sdb are sometimes displaced to
/dev/sdc and /dev/sdd.

What are the two devices which are displacing /dev/sdc and /dev/sdd ?

Regards,

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
