Received: from mx1.redhat.com (mx1.redhat.com [172.16.48.31])
	by int-mx1.corp.redhat.com (8.11.6/8.11.6) with ESMTP id iADLDkr02291
	for <linux-lvm@redhat.com>; Sat, 13 Nov 2004 16:13:46 -0500
Received: from ramoth.dragonhold.org (ramoth.dragonhold.org [80.229.192.20])
	by mx1.redhat.com (8.12.11/8.12.11) with ESMTP id iADLDcxW019471
	for <linux-lvm@redhat.com>; Sat, 13 Nov 2004 16:13:38 -0500
Date: Sat, 13 Nov 2004 21:13:24 +0000
From: Graham Wood <clvm@spam.dragonhold.org>
Subject: Re: [linux-lvm] Re: raid 1 on a single disk
Message-ID: <20041113211324.GA13108@dragonhold.org>
References: <89af10f90411130217467c439@mail.gmail.com>
	<lg4h62-8vg.ln1@news.it.uc3m.es>
	<89af10f90411130241e20e2c2@mail.gmail.com>
Mime-Version: 1.0
Content-Disposition: inline
In-Reply-To: <89af10f90411130241e20e2c2@mail.gmail.com>
Sender: <gwood@dragonhold.org>
Reply-To: LVM general discussion and development <linux-lvm@redhat.com>
List-Id: LVM general discussion and development <linux-lvm.redhat.com>
List-Unsubscribe: <https://www.redhat.com/mailman/listinfo/linux-lvm>,
	<mailto:linux-lvm-request@redhat.com?subject=unsubscribe>
List-Archive: </archives/linux-lvm>
List-Post: <mailto:linux-lvm@redhat.com>
List-Help: <mailto:linux-lvm-request@redhat.com?subject=help>
List-Subscribe: <https://www.redhat.com/mailman/listinfo/linux-lvm>,
	<mailto:linux-lvm-request@redhat.com?subject=subscribe>
List-Id: <linux-lvm.redhat.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: ashwin chaugule <ashwin.chaugule@gmail.com>, LVM general discussion and development <linux-lvm@redhat.com>

On Sat, Nov 13, 2004 at 04:11:08PM +0530, ashwin chaugule wrote:
> yes i know its silly ... im doing what im told to do :p
>
> ok so, i also do know, its performance is going to suck !
> but i was under the impression that RAID 1 works on more that one disks only.
>
> so you mean to say that, the linux RAID / md tools support raid 1 on
> multiple partitiions of the same disk ?
>
> Regards,
> Ashwin
>
>

As people have already said, the software really doesn't care.

Here's a really sick/pointless example to prove it:

dd if=/dev/zero of=/var/tmp/fake1 bs=1M count=16
dd if=/dev/zero of=/var/tmp/fake2 bs=1M count=16
dd if=/dev/zero of=/var/tmp/fake3 bs=1M count=16
dd if=/dev/zero of=/var/tmp/fake4 bs=1M count=16

losetup /dev/loop1 /var/tmp/fake1
losetup /dev/loop2 /var/tmp/fake2
losetup /dev/loop3 /var/tmp/fake3
losetup /dev/loop4 /var/tmp/fake4

mdadm --create -l 5 /dev/md10 -n 4 /dev/loop1 /dev/loop2 /dev/loop3 /dev/loop4

cat /proc/mdstat

md10 : active raid5 loop4[4] loop3[2] loop2[1] loop1[0]
      48960 blocks level 5, 64k chunk, algorithm 2 [4/3] [UUU_]
      [================>....]  recovery = 81.2% (14080/16320) finish=0.0min speed=1083K/sec

raidstop -c /dev/null /dev/md10

mdadm --create -l mirror  /dev/md10 -n 4 /dev/loop1 /dev/loop2 /dev/loop3 /dev/loop4

cat /proc/mdstat

md10 : active raid1 loop4[3] loop3[2] loop2[1] loop1[0]
      16320 blocks [4/4] [UUUU]
      [=============>.......]  resync = 68.7% (12160/16320) finish=0.0min speed=1105K/sec


What this has done is created a 48MB (roughly) raid5 set based on 4 16MB files in /var/tmp.  Obviously this won't be recreated automatically on a reboot (since it's done using files), but it's to show what you can do if you are feeling sick enough.  I've then created it as a mirror to show that works too.

Your command (to setup the mirror) will be something like:

mdadm --create -l mirror -n 4 /dev/hdd1 /dev/hdd2 /dev/hdd3 /dev/hdd4

And since thoswe are real disk partitions, if you set them to type "fd" in fdisk, they will be re-attached on a reboot.

Graham

P.S. I'd be really tempted to talk to the person asking you to do this, and ask them what they hope to achieve...
