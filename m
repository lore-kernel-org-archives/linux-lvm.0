Received: from mx1.redhat.com (mx1.redhat.com [172.16.48.31])
	by int-mx1.corp.redhat.com (8.11.6/8.11.6) with ESMTP id j1GHWpO18168
	for <linux-lvm@redhat.com>; Wed, 16 Feb 2005 12:32:51 -0500
Received: from smtp07.web.de (smtp07.web.de [217.72.192.225])
	by mx1.redhat.com (8.12.11/8.12.11) with ESMTP id j1GHWpR1009757
	for <linux-lvm@redhat.com>; Wed, 16 Feb 2005 12:32:51 -0500
Received: from [213.238.38.148] (helo=[192.168.0.2])
	by smtp07.web.de with asmtp (TLSv1:RC4-MD5:128) (WEB.DE 4.103 #192)
	id 1D1T2X-0000kz-00
	for linux-lvm@redhat.com; Wed, 16 Feb 2005 18:32:41 +0100
Message-ID: <421383A6.2090508@web.de>
Date: Wed, 16 Feb 2005 18:32:22 +0100
From: Torben Viets <Viets@web.de>
MIME-Version: 1.0
References: <420F83CB.5040008@web.de>	<20050213165116.GP14093@agk.surrey.redhat.com>
	<420F9292.3090103@web.de>
In-Reply-To: <420F9292.3090103@web.de>
Content-Transfer-Encoding: 7bit
Sender: Viets@web.de
Subject: [linux-lvm] Suggestion for LVM
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
Content-Type: text/plain; charset="us-ascii"; format="flowed"
To: LVM general discussion and development <linux-lvm@redhat.com>

Hello,

first I want to say I like your project and thank everyone, who is 
involved in this project, you made good work.

But I have one problem with the LVM, I post it hear for some days 
("LVM-Snapshot + dm_crypt"), the problem was that I can't made a 
snapshot of a dm-crypted LVM, then it creates the snapshot, but nothing 
works. And if I encrypt it on the device /dev/mapper/mp3 then I can't 
use the Snapshot function because lvcreate can't locate the volume group 
/dev/mapper, what logical.

Now my suggestion for a new LVM version is, couldn'tyou made it possible 
that lvcreate get an alternative path for the snapshot volume, now a 
example how i thought it could work.

pvcreate /dev/md0 //creating a physical volume
vgcreate /dev/data //create a volumegroup
lvcreate -L 8G -nmp3-crypt /dev/data //creating a volume group, 
everything on this will be crypted
cryptsetup create mp3 /dev/data/mp3-crypt //creating a encrpted device, 
I use cryptsetup because I don't know how dm_setup works :D
mkfs.xfs -f /dev/mapper/mp3
mount /dev/mapper/mp3 /mnt/mp3
cp -r *  /mnt/mp3

if I now make a
lvcreate -s -nsnap /dev/mapper/mp3
then I get a error Message (volume group mapper doesn't exit)
now my idea was that I give lvcreate on which vg the snapscho schould 
create for example
lvcreate -s -nsnap /dev/mapper/mp3 --snap-vg /dev/data/mp3-snap

is this possible to patch or is there a good reason why this doesn't 
work, I try to make it my self but my programming skills are not good 
enough to do this. Could some please made it, or is this senseless.

I hope you understand my problem.

greetings
Torben Viets
