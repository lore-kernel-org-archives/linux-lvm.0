Received: from mx3.redhat.com (mx3.redhat.com [172.16.48.32])
	by int-mx1.corp.redhat.com (8.11.6/8.11.6) with ESMTP id j3IL87O17138
	for <linux-lvm@redhat.com>; Mon, 18 Apr 2005 17:08:07 -0400
Received: from wproxy.gmail.com (wproxy.gmail.com [64.233.184.203])
	by mx3.redhat.com (8.12.11/8.12.11) with ESMTP id j3IL81I5025644
	for <linux-lvm@redhat.com>; Mon, 18 Apr 2005 17:08:01 -0400
Received: by wproxy.gmail.com with SMTP id 68so1596581wri
	for <linux-lvm@redhat.com>; Mon, 18 Apr 2005 14:07:55 -0700 (PDT)
Message-ID: <003c01c5445a$b30df930$0301a8c0@MOE>
From: "Ramzy Darwish" <ramzy.darwish@gmail.com>
References: <004601c542f2$184b3cf0$0801a8c0@MOE>
	<20050418000700.GH9049@agk.surrey.redhat.com>
Subject: Re: [linux-lvm] HELP ME! (Couldn't find device with
	uuid'blah-blah-blah') (More detailed subject) Sorry
Date: Mon, 18 Apr 2005 16:07:57 -0500
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
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
Content-Type: text/plain; format="flowed"; charset="us-ascii"; reply-type="original"
To: LVM general discussion and development <linux-lvm@redhat.com>

Hello,
I fixed my problem, but I am not really sure how :).
I just kept trying stuff and finally after a reboot, it worked. I would like 
to know how to prevent such an event from happening again though.
> lvm version
  LVM version:     2.00.08 (2003-11-14)
  Library version: 1.00.17-ioctl (2004-04-19)
  Driver version:  4.3.0

OS: Gentoo (2004.3)

My disk config is as follows:
3 regular disk partitions on first HDD: (120G IDE ATA133 HDD, Maxtor if that 
matters)
1) ext2 fs with my /boot    => /dev/hda1
2) swap partition              => /dev/hda2
3) xfs partition for /          => /dev/hda3

The rest of /dev/hda is a phsical volume given to the LVM pool as /dev/hda4
Then, before the problem, I had two IDE HDDs (both Maxtor); 1 120G ATA133 
and 1 60G ATA100. Both are completely given over to the LVM. I have one 
Volume Group (VolGrp) that has a number of partitions in it (My machine is a 
media server running the excellent MythTV software (mythtv.org)):

>mount
devfs on /dev type devfs (rw)

none on /proc type proc (rw)
none on /sys type sysfs (rw)
none on /dev/pts type devpts (rw)
none on /dev/shm type tmpfs (rw)
none on /proc/bus/usb type usbfs (rw)

/dev/hda1 on /boot type ext2 (rw,noatime)
/dev/hda3 on / type xfs (rw,noatime)

/dev/VolGrp/usr on /usr type reiserfs (rw)
/dev/VolGrp/home on /home type ext3 (rw)
/dev/VolGrp/roms on /mnt/roms type reiserfs (rw)
/dev/VolGrp/audio on /mnt/audio type xfs (rw)
/dev/VolGrp/backup on /mnt/backup type ext3 (rw)
/dev/VolGrp/video on /mnt/video type jfs (rw)
/dev/VolGrp/dvd on /mnt/video/dvd type jfs (rw)
/dev/VolGrp/videos on /mnt/video/videos type jfs (rw)
/dev/VolGrp/download on /mnt/download type reiserfs (rw)
/dev/VolGrp/win on /mnt/win type ext3 (rw)

(* I have massaged the output a little trying to make it easier to see the 
differences in the setup *)

The problem began when I added two new drives: 1 Maxtor 40GB ATA100 and 1 
Seagate 17G ATA100. Both IDE.
I added the 40G drive with pvcreate/vgextend and doled out its space with 
lvextend commands and that seemed to go fine. I added the 17G drive with the 
same commands, but had not allocated its space yet when I rebooted the 
machine.

When I rebooted the machine, I got the uuid error for the same PV (which was 
for the final Seagate drive) repeatedly and none of my LVs would mount, 
including /usr. This was the biggest problem.

Now, I am planning to set aside a part of that 17G drive for a 'permanent' 
or 'traditional' /usr partition so I can at least run all of this stuff 
easily when I run into problems again.

I hope this is all of the information that you need. Please let me know what 
else I need to tell you.

Thanks for your help.
ramzy



----- Original Message ----- 
From: "Alasdair G Kergon" <agk@redhat.com>
To: "LVM general discussion and development" <linux-lvm@redhat.com>
Sent: Sunday, April 17, 2005 7:07 PM
Subject: Re: [linux-lvm] HELP ME! (Couldn't find device with 
uuid'blah-blah-blah') (More detailed subject) Sorry


> On Sat, Apr 16, 2005 at 09:06:39PM -0500, Ramzy Darwish wrote:
>> "Couldn't find device with uuid 'blah-blah-blah'
>> "Couldn't find all physical volumes for volume group VolGrp"
>
> This is becoming an FAQ.
>
> Start by telling which version of LVM2 (run 'lvm version') and
> what distribution (some distributions have more trouble than
> others with this) and detail your disk config: e.g. do you have raid,
> any disk partitions?
>
> Alasdair
>
> _______________________________________________
> linux-lvm mailing list
> linux-lvm@redhat.com
> https://www.redhat.com/mailman/listinfo/linux-lvm
> read the LVM HOW-TO at http://tldp.org/HOWTO/LVM-HOWTO/ 
