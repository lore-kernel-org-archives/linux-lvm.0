Received: from mx1.redhat.com (mx1.redhat.com [172.16.48.31])
	by int-mx1.corp.redhat.com (8.12.11.20060308/8.12.11) with ESMTP id
	k8IIAOhD010018
	for <linux-lvm@redhat.com>; Mon, 18 Sep 2006 14:10:24 -0400
Received: from nibiru.epicideas.net (nibiru.mogmail.net [213.208.82.181] (may
	be forged))
	by mx1.redhat.com (8.12.11.20060308/8.12.11) with ESMTP id
	k8IIAMKJ006134
	for <linux-lvm@redhat.com>; Mon, 18 Sep 2006 14:10:23 -0400
Received: from [192.168.0.2] (unknown [192.168.0.2])
	by nibiru.epicideas.net (Postfix) with ESMTP id DD750680C7
	for <linux-lvm@redhat.com>; Mon, 18 Sep 2006 19:10:16 +0100 (BST)
From: Nick <lists@mogmail.net>
Date: Mon, 18 Sep 2006 19:10:16 +0100
Message-Id: <1158603016.7182.12.camel@localhost.localdomain>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Subject: [linux-lvm] HDD Failure
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

Hello List,

I have a 3x 120GB HDD that are all lumped into one LVM volume. Recently,
one died so I removed it using.

# vgreduce --removemissing Vol1

This worked fine but now I can't mount the volume group:

root@nibiru:~# cat /etc/fstab | grep Vol
/dev/mapper/Vol1-share /share          ext3    defaults        0       2
root@nibiru:~# mount /share
mount: special device /dev/mapper/Vol1-share does not exist
root@nibiru:~#

I've no idea why it says it doesn't exist as I thought all I did was
remove missing PE's from a VG - not remove the actual VG!

Can anyone help me get my data back? Thanks for any advice.

Nick
