Received: from mx1.redhat.com (ext-mx06.extmail.prod.ext.phx2.redhat.com
	[10.5.110.10])
	by int-mx03.intmail.prod.int.phx2.redhat.com (8.13.8/8.13.8) with ESMTP
	id o5665UU7002570
	for <linux-lvm@redhat.com>; Sun, 6 Jun 2010 02:05:30 -0400
Received: from maude.comedia.it (mail.comedia.it [77.93.254.181])
	by mx1.redhat.com (8.13.8/8.13.8) with ESMTP id o5665Kp6022634
	for <linux-lvm@redhat.com>; Sun, 6 Jun 2010 02:05:21 -0400
Received: from localhost (localhost [127.0.0.1])
	by maude.comedia.it (Postfix) with ESMTP id 50F1986FFC
	for <linux-lvm@redhat.com>; Sun,  6 Jun 2010 08:05:19 +0200 (CEST)
Received: from maude.comedia.it ([127.0.0.1])
	by localhost (maude.comedia.it [127.0.0.1]) (amavisd-new, port 10025)
	with LMTP id KlQ2qnNnAlN8 for <linux-lvm@redhat.com>;
	Sun,  6 Jun 2010 08:05:13 +0200 (CEST)
Date: Sun, 6 Jun 2010 08:05:13 +0200
From: Luca Berra <bluca@comedia.it>
Message-ID: <20100606060513.GA22839@maude.comedia.it>
References: <1275795202.3993.30@raydesk1.bettercgi.com>
	<4C0B1D3F.8090904@alteeve.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <4C0B1D3F.8090904@alteeve.com>
Subject: Re: [linux-lvm] Imaged a drive, now kernel panics
Reply-To: LVM general discussion and development <linux-lvm@redhat.com>
List-Id: LVM general discussion and development <linux-lvm.redhat.com>
List-Unsubscribe: <https://www.redhat.com/mailman/options/linux-lvm>,
	<mailto:linux-lvm-request@redhat.com?subject=unsubscribe>
List-Archive: <https://www.redhat.com/archives/linux-lvm>
List-Post: <mailto:linux-lvm@redhat.com>
List-Help: <mailto:linux-lvm-request@redhat.com?subject=help>
List-Subscribe: <https://www.redhat.com/mailman/listinfo/linux-lvm>,
	<mailto:linux-lvm-request@redhat.com?subject=subscribe>
List-Id: <linux-lvm.redhat.com>
Content-Type: text/plain; charset="us-ascii"; format="flowed"
Content-Transfer-Encoding: 7bit
To: linux-lvm@redhat.com

On Sat, Jun 05, 2010 at 11:59:59PM -0400, Digimer wrote:
> On 10-06-05 11:33 PM, Ray Morris wrote:
>>   You mentioned that the old drive is IDE.  If so,
>> You may be running into a couple problems I've had.
>> I take it the new drive is SATA, SAS, or SCSI?
>> Did you edit /etc/fstab to change hda to sda, hdb
>> to sdb, etc., before running mkinitrd?
>
> Yup, simple SATA.
>
>> The existing kernel may not have the needed drivers
>> compiled in, the drivers for the particular chipset
>> and whatever SCSI drivers or modules are needed.
>> Assuming that rescue kernel matches the kernel on
>> the failed drive, mkinitrd _should_ take care of that
>> if /etc/fstab is correct. Might it might look at
>> mtab?
>
> I just went through /etc grep'ing for and replace hda for sda. Also, the 
> system has CentOS 4.4 and my rescue disk is CentOS 4.8...

i think you need to add a
scsi-hostadapter module_for_your_controller
line to /etc/modprobe.conf to have mkinitrd understand that.

>> Be sure to bind /proc, /sys, /dev, and /selinux
>> into the chroot. We want to be able to see /dev/sda
>> it order to set up to boot from it. Along the same lines,
>> double check that any other partitions, primarily /boot,
>> are mounted in the chroot.
>
> Sorry, how do I bind those fs into chroot?
mount --bind /proc /chroot/proc
...


-- 
Luca Berra -- bluca@comedia.it
         Communication Media & Services S.r.l.
  /"\
  \ /     ASCII RIBBON CAMPAIGN
   X        AGAINST HTML MAIL
  / \
