Received: from mx1.redhat.com (mx1.redhat.com [172.16.48.31])
	by int-mx1.corp.redhat.com (8.13.1/8.13.1) with ESMTP id l7MB74Xd019069
	for <linux-lvm@redhat.com>; Wed, 22 Aug 2007 07:07:04 -0400
Received: from mail2.syneticon.net (mail.syneticon.net [213.239.212.131])
	by mx1.redhat.com (8.13.1/8.13.1) with ESMTP id l7MB7182002625
	for <linux-lvm@redhat.com>; Wed, 22 Aug 2007 07:07:02 -0400
Received: from postfix1.syneticon.net (postfix1.syneticon.net [192.168.112.6])
	by mail2.syneticon.net (Postfix) with ESMTP id 95883490E4
	for <linux-lvm@redhat.com>; Wed, 22 Aug 2007 13:06:53 +0200 (CEST)
Received: from localhost (filter1.syneticon.net [192.168.113.3])
	by postfix1.syneticon.net (Postfix) with ESMTP id 1AAD093CF
	for <linux-lvm@redhat.com>; Wed, 22 Aug 2007 13:06:53 +0200 (CEST)
Received: from postfix1.syneticon.net ([192.168.113.4])
	by localhost (mx03.syneticon.net [192.168.113.3]) (amavisd-new,
	port 10025) with ESMTP id Y15ME90Dh9j9 for <linux-lvm@redhat.com>;
	Wed, 22 Aug 2007 13:06:50 +0200 (CEST)
Received: from [192.168.10.145] (xdsl-87-78-249-217.netcologne.de
	[87.78.249.217]) by postfix1.syneticon.net (Postfix) with ESMTP
	for <linux-lvm@redhat.com>; Wed, 22 Aug 2007 13:06:50 +0200 (CEST)
Message-ID: <46CC18C9.400@wpkg.org>
Date: Wed, 22 Aug 2007 13:06:49 +0200
From: Tomasz Chmielewski <mangoo@wpkg.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Subject: [linux-lvm] performance of dm-crypt devices?
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

I just set up an encrypted LUKS device using the information on 
http://www.saout.de/tikiwiki/tiki-index.php?page=EncryptedDeviceUsingLUKS

There was a suggestion there, which prompted me to check the performance:

   If you wish, use /sbin/hdparm to benchmark. However my benchmarks on
   an AMD Athlon 3200 indicate no great difference between an encrypted
   and a normal unencrypted partition.


First, I set read-ahead to the same value on both devices (original LVM 
device, and the crypted one):

# blockdev --setra 16384 /dev/mapper/crypttest
# blockdev --setra 16384 /dev/mapper/san1-test


Next, hdparm test:

# hdparm -t mapper/crypttest mapper/san1-test

mapper/crypttest:
  Timing buffered disk reads:  116 MB in  3.01 seconds =  38.54 MB/sec
HDIO_DRIVE_CMD(null) (wait for flush complete) failed: Inappropriate 
ioctl for device

/dev/san1/file1-swap:
  Timing buffered disk reads:  304 MB in  3.12 seconds =  97.46 MB/sec
HDIO_DRIVE_CMD(null) (wait for flush complete) failed: Inappropriate 
ioctl for device


So, this quick test suggests that with a crypted device, I get about 40% 
performance of the original LVM volume?


My setup is hardware RAID-10, and a dual core 3 GHz Xeon.

Is it normal? I would say yes, as both cores use 100% CPU when I do 
intensive reads from an encrypted volume.
However, this seems to contradict with "However my benchmarks on an AMD 
Athlon 3200 indicate no great difference between an encrypted and a 
normal unencrypted partition".


I used aes-cbc-essiv:sha256 cipher.

Perhaps, I should use something lighter?



-- 
Tomasz Chmielewski
http://wpkg.org
