Received: from mx1.redhat.com (mx1.redhat.com [172.16.48.31])
	by int-mx1.corp.redhat.com (8.11.6/8.11.6) with SMTP id i21AHb804428
	for <linux-lvm@redhat.com>; Mon, 1 Mar 2004 05:17:37 -0500
Received: from mail.ipax.tk (postfix@ipax.tk [213.158.115.2])
	by mx1.redhat.com (8.11.6/8.11.6) with SMTP id i21AHab00522
	for <linux-lvm@redhat.com>; Mon, 1 Mar 2004 05:17:36 -0500
Received: from ipax.tk (raoul.bhatia.at [80.109.78.225])
	by mail.ipax.tk (Postfix) with ESMTP id B8F6286805
	for <linux-lvm@redhat.com>; Mon,  1 Mar 2004 11:17:05 +0100 (CET)
Message-ID: <40430DBE.5020105@ipax.tk>
From: raoul bhatia <r.bhatia@ipax.tk>
MIME-Version: 1.0
Subject: Re: [linux-lvm] mdraid, pvcreate and vgcreate problem
References: <40427F2B.7000507@ipax.tk>
In-Reply-To: <40427F2B.7000507@ipax.tk>
Content-Transfer-Encoding: 7bit
Sender: linux-lvm-admin@redhat.com
Errors-To: linux-lvm-admin@redhat.com
Reply-To: linux-lvm@redhat.com
List-Help: <mailto:linux-lvm-request@redhat.com?subject=help>
List-Post: <mailto:linux-lvm@redhat.com>
List-Subscribe: <https://www.redhat.com/mailman/listinfo/linux-lvm>,
	<mailto:linux-lvm-request@redhat.com?subject=subscribe>
List-Id: LVM general discussion and development <linux-lvm.redhat.com>
List-Unsubscribe: <https://www.redhat.com/mailman/listinfo/linux-lvm>,
	<mailto:linux-lvm-request@redhat.com?subject=unsubscribe>
List-Archive: <https://www.redhat.com/archives/linux-lvm/>
Date: Mon Mar  1 05:16:00 2004
List-Id: <linux-lvm.redhat.com>
Content-Type: text/plain; charset="us-ascii"; format="flowed"
To: linux-lvm@redhat.com

ok, i found the problem. i'm mixed using devfsd, and somehow, i forgot
that you have to use /dev/md/1 instead of /dev/md1 when working with
lvm. so i have to say sorry for my last email!

best regards,
raoul bhatia

raoul bhatia wrote:

> hi!
> 
> i've ran into some problems with mdraid and lvm. as i guess that log 
> messages will give you more information than i might do, i will begin:
> 
> i've got an identical setup on another server, which works flawlessly. 
> as i don't know, where these problems might originate from, i hope that 
> you can help me!
> 
> best regards,
> raoul bhatia
> 
> yellow:~# cat /proc/mdstat
> Personalities : [linear] [raid0] [raid1] [raid5]
> read_ahead 1024 sectors
> md3 : active raid1 ide/host0/bus1/target0/lun0/part3[1] 
> ide/host0/bus0/target0/lun0/part3[0]
>       489856 blocks [2/2] [UU]
> 
> md0 : active raid1 ide/host0/bus1/target0/lun0/part5[1] 
> ide/host0/bus0/target0/lun0/part5[0]
>       979840 blocks [2/2] [UU]
> 
> md1 : active raid1 ide/host0/bus1/target0/lun0/part6[1] 
> ide/host0/bus0/target0/lun0/part6[0]
>       37069888 blocks [2/2] [UU]
> 
> unused devices: <none>
> 
> yellow:~# pvcreate -v /dev/md1
> pvcreate -- locking logical volume manager
> pvcreate -- checking physical volume name "/dev/md1"
> pvcreate -- getting physical volume size
> pvcreate -- checking maximum physical volume size
> pvcreate -- checking partition type
> pvcreate -- creating new physical volume
> pvcreate -- setting up physical volume for /dev/md1 with 74139776 sectors
> pvcreate -- writing physical volume data to disk "/dev/md1"
> pvcreate -- physical volume "/dev/md1" successfully created
> pvcreate -- unlocking logical volume manager
> 
> yellow:~# pvdisplay /dev/md1
> pvdisplay -- "/dev/md1" is a new physical volume of 35.35 GB
> 
> yellow:~# pvdata -v /dev/md1
> --- NEW Physical volume ---
> PV Name               /dev/md1
> VG Name
> PV Size               35.35 GB [74139776 secs]
> PV#                   0
> PV Status             NOT available
> Allocatable           NO
> Cur LV                0
> PE Size (KByte)       0
> Total PE              0
> Free PE               0
> Allocated PE          0
> PV UUID               FzRQMD-gyz0-xB06-iP2s-Pog2-4MtC-lYSuab
> 
> yellow:~# vgcreate -v vg0 /dev/md1
> vgcreate -- checking volume group name
> vgcreate -- checking volume group directory existence
> vgcreate -- locking logical volume manager
> vgcreate -- checking volume group "vg0" existence
> vgcreate -- counting all existing volume groups
> vgcreate -- reading all physical volume data from disks
> vgcreate -- checking if all given physical volumes in command line are new
> vgcreate -- checking physical volumes name "/dev/md1"
> vgcreate -- no valid physical volumes in command line
-- 
____________________________________________________________________
raoul bhatia                              email.    r.bhatia@ipax.tk
- ipax.tk -                               web.    http://www.ipax.tk
chief technician, support                 irc.      #ipax (quakenet)
____________________________________________________________________
