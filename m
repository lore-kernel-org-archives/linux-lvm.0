Received: from mx1.redhat.com (mx1.redhat.com [172.16.48.31])
	by int-mx1.corp.redhat.com (8.13.1/8.13.1) with ESMTP id l67J6EZO009873
	for <linux-lvm@redhat.com>; Sat, 7 Jul 2007 15:06:14 -0400
Received: from mail.futurelabusa.com (c-67-165-227-32.hsd1.co.comcast.net
	[67.165.227.32])
	by mx1.redhat.com (8.13.1/8.13.1) with ESMTP id l67J6BaE013412
	for <linux-lvm@redhat.com>; Sat, 7 Jul 2007 15:06:11 -0400
Received: from i0.futurelabusa.com (i0.fu-lab.com [192.168.0.101])
	by mail.futurelabusa.com (Postfix) with ESMTP id 5C27477702
	for <linux-lvm@redhat.com>; Sat,  7 Jul 2007 13:06:10 -0600 (MDT)
Date: Sat, 07 Jul 2007 13:06:14 -0600
From: Jim Schatzman <james.schatzman@futurelabusa.com>
Subject: Re: [linux-lvm] Restore LVM after drive error
In-Reply-To: <20070707134753.181690@gmx.net>
References: <20070707134753.181690@gmx.net>
Mime-Version: 1.0
Content-Type: text/plain; charset="iso-8859-1"
Message-Id: <20070707190610.5C27477702@mail.futurelabusa.com>
Content-Transfer-Encoding: quoted-printable
Reply-To: LVM general discussion and development <linux-lvm@redhat.com>
List-Id: LVM general discussion and development <linux-lvm.redhat.com>
List-Unsubscribe: <https://www.redhat.com/mailman/listinfo/linux-lvm>,
	<mailto:linux-lvm-request@redhat.com?subject=unsubscribe>
List-Archive: <https://www.redhat.com/archives/linux-lvm>
List-Post: <mailto:linux-lvm@redhat.com>
List-Help: <mailto:linux-lvm-request@redhat.com?subject=help>
List-Subscribe: <https://www.redhat.com/mailman/listinfo/linux-lvm>,
	<mailto:linux-lvm-request@redhat.com?subject=subscribe>
List-Id: <linux-lvm.redhat.com>
To: LVM general discussion and development <linux-lvm@redhat.com>

Sir-

In my opinion, the docs for pvmove should include the warning "do not use p=
vmove to copy data from a bad disk". Once you start it, it seems that you a=
re hosed. The original pvmove fails, any attempt to resume pvmove also fail=
s, and pvmove --abort also fails. Vgreduce also fails in this situation.

At this point, I recommend that you use one of two possible methods of part=
ial recovery:

1) By hook or by crook, get the filesystems on the vg to mount. You may hav=
e to use dmsetup and "-P" to enable VG to assemble the volume while errorin=
g out on a bad drive.

Unfortunately, it does seem that pvmove scrambles things so that I have not=
 been able recover from this situation. Using "-P" does not seem to work. A=
gain, in my opinion, folks should be warning: DO NOT ATTEMPT TO USE PVMOVE =
TO RECOVER FROM A BAD DISK - YOU WILL NOT LIKE THE RESULT.

Once mounted, copy all the files you can off the old file system. Copy file=
s in small groups. When you get errors, stop immediately and shift to anoth=
er directory. You may have to power off while in operation if the drive see=
ms to be looping and your system log is filling up with error messages.

Since you are getting the "couldn't read all logical volumes" message - thi=
s suggests that Linux is unable to enable one or more of your disk drives. =
 Check the system log and find out why. If it is a "software reset failed",=
 you may want to try powering down the whole thing (computer and drives) ma=
ny times - maybe, eventually, the drives will come up. Once the drives are =
all up, the volume group should work and you should be able to mount the FS=
. Also, try  turning the bad drive(s) over or standing them on end. Sometim=
es that works. "-P" might work on "vgchange -Pay" and/or "lvchange -Pay" to=
 enable you to use the VGs and LVs with a bad drive.

If desperate, try replacing the PC board on the bad drives. See http://myha=
rddrivedied.com/presentations.html for detailed instructions. If you have a=
 spare, identical drive handy, this may help.


2) I haven't tried this - it is theoretical: Acquire a working Linux system=
. Put your bad LVM drives in this system one at a time along with an identi=
cal new drive. Use dd on the raw device to copy from the bad drive to the n=
ew drive. Tell dd to ignore errors. This should mirror the old bad drives o=
nto new good ones, to the extent that the old data could be read. I am not =
sure how to get LVM to recognize the new drive(s), but I am told that you c=
an put the complete collection of old/good and new drives on one system and=
 get LVM to reassemble them. Preferably copy the good files somewhere else.=
 If you are brave, run fsck.


Some general recommendations based on my experiences:

1)  Never put anything you care about in a multi-disk JBOD volume group. On=
e bad drive destroys the entire VG. Unreliable. Especially don't do this fo=
r your system partition. This is unfortunately, and seriously limits the us=
efulness of LVM, in my opinion. If LVM had better error recovery, then I wo=
uld have a better opinion of it.

2)  I have had a number of cheap SATA to very expensive SCSI drives go bell=
y up within one week. Suggest that you burn in your new drives for a week o=
r two prior to relying on them.

3) Use RAID 5 or 6 if you can't stand to lose everything.=20

Again, it is unfortunate, but pvmove does bad things if either the old driv=
e or the new drive fail. Don't use it unless you are confident that it will=
 succeed.  You could run "e2fsck -c" for this purpose, but it would be bett=
er to use badblocks directly.

Jim





At 07:47 AM 7/7/2007, you wrote:
>Hello,
>
>I recived an smart warning for one of my scsi disk that it might faile
>some day, so i added
>another disk to move the lvm data from the failing disk another. But the
>"new" disk faild and
>the system crashed during the pvmove process. Now all lvm commands i
>try say:
> "Couldn't find volume 'pvmove0' for segment 'start_extend' " and
>"Couldn't read all logical volumes for volume group system".
>Where 'system' is my vg. I tried pvmove --abort and vgreduce
>--removemissing but nothing worked.
>(now i know that vgreduce --removemissing dosn't solve the pvmove
>problem). My /-Directory is whithin the system vg, so i could not access
>the backup configuration of the lvm ! Is thre any way to undo the pvmove
>changes and rescue my data ?!
>
>I have searched the inet for solutions but found nothing that worked.
>
>Please Help me !
>
>--=20
>Psssst! Schon vom neuen GMX MultiMessenger geh=EF=BF=BDrt?
>Der kanns mit allen: http://www.gmx.net/de/go/multimessenger
>
>_______________________________________________
>linux-lvm mailing list
>linux-lvm@redhat.com
>https://www.redhat.com/mailman/listinfo/linux-lvm
>read the LVM HOW-TO at http://tldp.org/HOWTO/LVM-HOWTO/
