Message-ID: <134902074.1002552720175.JavaMail.root@boots>
Date: 08 Oct 2001 10:51:42 -0000
From: "Karl" <rmvzj001@sneakemail.com>
Subject: Re: [linux-lvm] LVM seems to be causing SCSI errors.
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
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
To: linux-lvm@sistina.com

> IIRC you said, that your test LVs spanned physical drives.
> Another known problem is flaky SCSI subsystem behaviour when LVM causes
> more load in configurations like this.
>
> Can you trigger the problem, if you've got just one LV being allocated
> on one PV?

The problem is still there when the LVM is only on a single SCSI volume.
In fact, changing the volume from one drive to the other shows SCSI
errors on the new drive and the old drive used on a non LVM file system
stops having errors.

> What did the file system consistency check I mentioned in my other mail say?

When I ran an fsck on the file system with the errors (I did not re-do
this experiment recently) it found bad blocks on the files system, but
no inconsistencies on the file system itself.


-----------------------------------------------------
Protect yourself from spam, use http://sneakemail.com
