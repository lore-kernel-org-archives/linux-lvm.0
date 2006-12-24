Received: from mx2.redhat.com (mx2.redhat.com [10.255.15.25])
	by int-mx2.corp.redhat.com (8.13.1/8.13.1) with ESMTP id kBO9eia5015781
	for <linux-lvm@redhat.com>; Sun, 24 Dec 2006 04:40:44 -0500
Received: from mta05.sannet.ne.jp (mta05.sannet.ne.jp [134.180.49.75])
	by mx2.redhat.com (8.12.11.20060308/8.12.11) with ESMTP id
	kBO9ehw5012528
	for <linux-lvm@redhat.com>; Sun, 24 Dec 2006 04:40:43 -0500
Received: from [192.168.0.77] (eaa1-ppp746.west.sannet.ne.jp [211.133.178.238])
	by mta05.sannet.ne.jp (Postfix) with ESMTP id 9DDD228C3
	for <linux-lvm@redhat.com>; Sun, 24 Dec 2006 18:40:42 +0900 (JST)
Mime-Version: 1.0 (Apple Message framework v752.2)
Content-Transfer-Encoding: 7bit
Message-Id: <ED3062F2-3141-4767-AB70-3E9096A54E1C@sannet.ne.jp>
From: Joel Rees <joel_rees@sannet.ne.jp>
Date: Sun, 24 Dec 2006 18:40:41 +0900
Subject: [linux-lvm] recovering volumes
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
Content-Type: text/plain; charset="us-ascii"; delsp="yes"; format="flowed"
To: linux-lvm@redhat.com

Using Fedora Core 5 I had a volume group on /dev/hda3 and added a  
logical volume on /dev/hde3. Didn't read the how to, didn't know it's  
a no-no. Decided to play with Ubuntu, and thought I'd set up logical  
volumes for it on /dev/hde2. Apparently, I wiped out the headers on / 
dev/hde3 and then the entire logical group for FC5 refused to mount.  
In attempting to recover the headers I've apparently wiped out the  
headers for the whole volume group -- pvcreate using a recovery  
option or something that I failed to follow with some generate  
command, if I remember right. Also, I set up a volume group on /dev/ 
hde2 and loaded FC6 into that since I was feeling burned by Ubuntu at  
the time.

Any guesses at how badly I'm screwed? or pointers to more information  
than can be found on the how-to pages?

Not really life-or-death data lost, but I had been using it to back  
up the digital camera and there were about a months worth of my kids  
experiments that I don't have a backup of. Also, it would be a useful  
exercise for me, in terms of gaining confidence in lvm, if there were  
some way to recover the headers just from the stuff in /etc/lvm .
