Received: from mx2.redhat.com (mx2.redhat.com [10.255.15.25])
	by int-mx2.corp.redhat.com (8.13.1/8.13.1) with ESMTP id l81HJb1r004864
	for <linux-lvm@redhat.com>; Sat, 1 Sep 2007 13:19:37 -0400
Received: from py-out-1112.google.com (py-out-1112.google.com [64.233.166.180])
	by mx2.redhat.com (8.13.1/8.13.1) with ESMTP id l81HJZKb011688
	for <linux-lvm@redhat.com>; Sat, 1 Sep 2007 13:19:36 -0400
Received: by py-out-1112.google.com with SMTP id p76so4095694pyb
	for <linux-lvm@redhat.com>; Sat, 01 Sep 2007 10:19:35 -0700 (PDT)
Message-ID: <d00698fb0709011019x688e5363q931f16444685ea97@mail.gmail.com>
Date: Sat, 1 Sep 2007 19:19:35 +0200
From: noah <noah123@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline
Subject: [linux-lvm] pvmove hung on 2.6.22 (ubuntu gutsy)
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
To: linux-lvm@redhat.com

Pvmove hung and now all commands that access the filesystem hang too,
possibly in uninterruptible sleep.
Is this a bug or did I do something forbidden, somehow? ;)

The most irritating thing right now is that the keys used for dm-crypt
for the new PVs weren't moved out of the box before the crash
happened.. I didn't even consider pvmove to fail since it's worked
flawlessly for me before, but now it apparently did. Guess I'm beyond
fucked here.


My original setup was the following:
/dev/sda + missing -> md0 (raid 1)
dmcrypt on md0 -> aesmd0
aesmd0 is part of a VG aes

The rootfilesystem and a bunch of others are all LVMs in VG aes.


Prior to running pvmove I did the following:
/dev/sdb + missing -> md3 (raid 1)
dmcrypt on md3 -> aesmd3
/dev/sdd + missing -> md4 (raid 1)
dmcrypt on md4 -> aesmd4
aesmd3 + aesmd4 -> md5 (raid 0)

pvcreate /dev/md5
vgextend aes /dev/md5

Then I did pvmove -v -i 60 /dev/aesmd0 to move over extents from
aesmd0 to /dev/md5.
It started spitting out some logs and seemed to progress just fine.
Meanwhile I did 'mdadm /dev/md3 -a /dev/sdc' to complete the degraded
RAID1 mirror.
pvmove still seemed to progress well but 10 minutes later I
experienced hangs anything that deals with the filesystem.

The system is running Ubuntu Gutsy Gibbon on an AMD64 X2 CPU with 2GB
memory, no swap.
Vmware server was also running on the machine when this happened in
case it's interesting.
The terminal sessions I had to this machine when it hung continued to
work as long as they didn't try to access the filesystem where as the
sessions to my vmware guests were all hung.

Since I was working in screen I've recovered some parts of the output,
mainly the lvm2 commands and stuff regarding md.
It's available here: http://pastebin.com/m34412938

  -- noah
