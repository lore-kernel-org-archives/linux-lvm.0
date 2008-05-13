Received: from mx3.redhat.com (mx3.redhat.com [172.16.48.32])
	by int-mx1.corp.redhat.com (8.13.1/8.13.1) with ESMTP id m4D81AJX018098
	for <linux-lvm@redhat.com>; Tue, 13 May 2008 04:01:10 -0400
Received: from cluster-f.mailcontrol.com (cluster-f.mailcontrol.com
	[85.119.2.190])
	by mx3.redhat.com (8.13.8/8.13.8) with ESMTP id m4D80hJJ030417
	for <linux-lvm@redhat.com>; Tue, 13 May 2008 04:00:44 -0400
Received: from mx.zetex.com (mx.zetex.com [194.129.23.24] (may be forged))
	by rly21f.srv.mailcontrol.com (MailControl) with ESMTP id
	m4D80WHE030217
	for <linux-lvm@redhat.com>; Tue, 13 May 2008 09:00:32 +0100
Received: from zen.zetex.local (zen.zetex.com [192.168.230.14])
	by mx.zetex.com (8.9.3/8.9.3) with ESMTP id HAA14431
	for <linux-lvm@redhat.com>; Tue, 13 May 2008 07:28:12 +0100
Content-class: urn:content-classes:message
MIME-Version: 1.0
Subject: RE: [linux-lvm] lvm partition on ramdisk
Date: Tue, 13 May 2008 09:00:30 +0100
Message-ID: <A374F37068535C46BFCF8D48CF29AA7F013666D8@zen.zetex.com>
From: "Karl Wagner" <kwagner@zetex.com>
Content-Transfer-Encoding: 8bit
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
Content-Type: text/plain; charset="us-ascii"
To: LVM general discussion and development <linux-lvm@redhat.com>

If this is what you are looking to do, there are two more approaches you
could consider. I have used both to varying degrees of success.

The first is to just keep the first part of the disk in cache. Ie. Set
up the device as you want, then run the following either as a cron job
or inside a 'while true' loop in the background:
	cat /dev/yourdevice | dd bs=1048576 count=$N of=/dev/null
(replacing $N with the number of MB you want from the beginning of the
drive to remain in the block device cache)
This will simply periodicaly read $N MB from the beginning of your
device, which keeps it in the buffer. I did this on a drive exported
over ATA-over-ethernet to my windows machine as it's boot drive, and had
sub-millisecond access times, very fast boot and app loading times...
Although I was keeping the entire C: drive (6GB) in the buffer on my
home server with 8GB ram :)

The second way I have used (and replaced with the above for simplicity)
is to set up an mdraid1 between the ramdisk and an equally sized
partition, using the write-mostly and write-behind options, then use
dmsetup (or LVM, I went for the direct approach) to concatenate it with
the rest of the disk.

My first way works brilliantly for me, as it is so simple yet so safe. I
have even had a power cut in the past and no data was lost (although of
course it forced windows to do checkdisk on boot, but it would have
anyway).

Hope this is helpful
Mouse

-----Original Message-----
From: linux-lvm-bounces@redhat.com [mailto:linux-lvm-bounces@redhat.com]
On Behalf Of Stuart D. Gathman
Sent: 13 May 2008 02:29
To: LVM general discussion and development
Subject: Re: [linux-lvm] lvm partition on ramdisk

On Mon, 12 May 2008, Larry Dickson wrote:

> However, let me follow up your (and Stuart's) point. Are you saying
that an
> unmounted LVM volume will mess up the boot, even if the volume in
question
> is not mapped to boot or /? I was proceeding under the assumption that
LVM
> would be happy to sew the pieces together again later, even if the
data in
> them is trashed.

As long as the VG is not needed in initrd (e.g. a test VG), you should
be ok.  You will simply have to go through the procedure of removing the
"failed" PV and adding it back after a reboot.  As long as your root fs
(and /usr and other stuff needed at startup) are not on the test VG, you
should be fine.  The problem is that the VG will not activate
automatically
with a missing PV.  Even with --partial, it will activate the VG
as readonly metadata.  Yes, AIX handles this better, IMO.  But Linux LVM
is
getting there.

For your application, you should make a separate "testvg" VG for your
test
that does not have your system.  At boot, activate the VG with
--partial, 
then use "pvcreate -u " to set the UUID on the ramdisk to match the UUID
originally on the ramdisk, followed by vgcfgrestore.

-- 
	      Stuart D. Gathman <stuart@bmsi.com>
    Business Management Systems Inc.  Phone: 703 591-0911 Fax: 703
591-6154
"Confutatis maledictis, flammis acribus addictis" - background song for
a Microsoft sponsored "Where do you want to go from here?" commercial.


_______________________________________________
linux-lvm mailing list
linux-lvm@redhat.com
https://www.redhat.com/mailman/listinfo/linux-lvm
read the LVM HOW-TO at http://tldp.org/HOWTO/LVM-HOWTO/


 This has been checked by www.blackspider.com 


_________________________________________________________

Zetex Semiconductors - Solutions for an analog world.

http://www.zetex.com
http://www.zetex.cn

E-MAILS are susceptible to interference.  You should not assume that
the contents originated from the sender or the Zetex Group or that they 
have been accurately reproduced from their original form.
Zetex accepts no responsibility for information, errors or omissions in
this e-mail nor for its use or misuse nor for any act committed or
omitted in connection with this communication.
If in doubt, please verify the authenticity with the sender.
_________________________________________________________

 
