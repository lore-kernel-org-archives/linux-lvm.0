Received: from mx1.redhat.com (mx1.redhat.com [172.16.48.31])
	by int-mx1.corp.redhat.com (8.11.6/8.11.6) with ESMTP id j1DHlQO05113
	for <linux-lvm@redhat.com>; Sun, 13 Feb 2005 12:47:26 -0500
Received: from smtp05.web.de (smtp05.web.de [217.72.192.209])
	by mx1.redhat.com (8.12.11/8.12.11) with ESMTP id j1DHlOBf028117
	for <linux-lvm@redhat.com>; Sun, 13 Feb 2005 12:47:24 -0500
Received: from [213.238.38.148] (helo=[192.168.0.2])
	by smtp05.web.de with asmtp (TLSv1:RC4-MD5:128) (WEB.DE 4.103 #192)
	id 1D0Nq3-0006Ly-00
	for linux-lvm@redhat.com; Sun, 13 Feb 2005 18:47:19 +0100
Message-ID: <420F9292.3090103@web.de>
Date: Sun, 13 Feb 2005 18:46:58 +0100
From: Torben Viets <Viets@web.de>
MIME-Version: 1.0
Subject: Re: [linux-lvm] LVM-Snapshot + dm_crypt
References: <420F83CB.5040008@web.de>
	<20050213165116.GP14093@agk.surrey.redhat.com>
In-Reply-To: <20050213165116.GP14093@agk.surrey.redhat.com>
Content-Transfer-Encoding: 7bit
Sender: Viets@web.de
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

thanks for your answer, you mean that I have to do the following:

mkraid /dev/md0
cryptsetup create raid5-crypt /dev/md0
pvcreate /dev/mapper/raid5-crypt
vgcreate data /dev/mapper/raid5-crypt
lvcreate -L8G -nmp3 data
mkfs.xfs -f /dev/data/mp3
mount /dev/data/mp3 /mnt/mp3
cp * /mnt/mp3
lvcreate -L500M -s -nsnap-mp3 data

Or did I have miss understood you.

greetings
Torben Viets
