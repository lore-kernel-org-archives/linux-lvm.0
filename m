Received: from mx3.redhat.com (mx3.redhat.com [172.16.48.32])
	by int-mx1.corp.redhat.com (8.11.6/8.11.6) with ESMTP id j1DGiRO27769
	for <linux-lvm@redhat.com>; Sun, 13 Feb 2005 11:44:27 -0500
Received: from smtp05.web.de (smtp05.web.de [217.72.192.209])
	by mx3.redhat.com (8.12.11/8.12.11) with ESMTP id j1DGiLou017370
	for <linux-lvm@redhat.com>; Sun, 13 Feb 2005 11:44:22 -0500
Received: from [213.238.38.148] (helo=[192.168.0.2])
	by smtp05.web.de with asmtp (TLSv1:RC4-MD5:128) (WEB.DE 4.103 #192)
	id 1D0Mr2-0000Nw-00
	for linux-lvm@redhat.com; Sun, 13 Feb 2005 17:44:16 +0100
Message-ID: <420F83CB.5040008@web.de>
Date: Sun, 13 Feb 2005 17:43:55 +0100
From: Torben Viets <Viets@web.de>
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Sender: Viets@web.de
Subject: [linux-lvm] LVM-Snapshot + dm_crypt
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
To: linux-lvm@redhat.com

Hello,

I've got 3 harddisks with 3* 60GB partitions in a software raid 5 
(/dev/md0), on this device I have installed a volume group (/dev/data/) 
and a logical volume mp3-crypt (the -crypt means that it is encrypt with 
dm_crypt). Now I decrypt the mp3 lv with:
cryptsetup create mp3 /dev/data/mp3-crypt
and then mount it with
mount /dev/mapper/mp3 /mnt/mp3

until now everything works fine, but now I want to create a snapshot of 
/dev/mapper/mp3.
My idea was that I make a volume group backup and then say: save the 
snapshot on the volume group, but I have no idea how I can say lvcreate 
on which volume group it has to save the snapshot.

If I make a
lvcreate -s -nsnap -L1G /dev/data/mp3-crypt
then I have a snapshot but it is encryptet and I can't mount it, even if 
I make a new cryptsetup for this device, every times mount says: "You 
must specifes a file system"

if I make a
lvcreate -s -nsnap -L1G /dev/mapper/mp3 (which ist my unencrypted device)
then I get a: "Volume group "mapper" doesn't exist"

How can I make a snapshot of a dm_crypt device?

Distribution is Debian sarge with kernel-2.6.10

Thanks for your help.

greetings
Viets
