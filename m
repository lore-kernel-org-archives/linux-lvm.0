Received: from mx1.redhat.com (mx1.redhat.com [172.16.48.31])
	by int-mx1.corp.redhat.com (8.11.6/8.11.6) with SMTP id i243gH830276
	for <linux-lvm@redhat.com>; Wed, 3 Mar 2004 22:42:17 -0500
Received: from mail.goldenhope.com.cn ([220.249.10.10])
	by mx1.redhat.com (8.11.6/8.11.6) with SMTP id i243gFb08183
	for <linux-lvm@redhat.com>; Wed, 3 Mar 2004 22:42:16 -0500
Received: from lepton.goldenhope.com.cn (lepton.goldenhope.com.cn [192.168.1.138])
	by mail.goldenhope.com.cn (Postfix) with ESMTP id 83CEE37A66
	for <linux-lvm@redhat.com>; Thu,  4 Mar 2004 11:41:55 +0800 (HKT)
From: lepton <lepton@mail.goldenhope.com.cn>
Subject: Re: [linux-lvm] Why can't I extend a LV after many times extends?
Message-ID: <20040304034157.GA19917@lepton.goldenhope.com.cn>
References: <20040303174600.18834.10882.Mailman@listman.back-rdu.redhat.com> <20040304014657.GA19419@lepton.goldenhope.com.cn>
Mime-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20040304014657.GA19419@lepton.goldenhope.com.cn>
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
Date: Wed Mar  3 22:40:12 2004
List-Id: <linux-lvm.redhat.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: linux-lvm@redhat.com

There are two ways to do things:

one is:
 
  lvcreate -n test testvg -l100000   /dev/sda1:0-31 /dev/sdb1:0-31
  /dev/sdc1:0-31 /dev/sda1:32-63 /dev/sdb1:32-63 /dev/sdc1:32-63 ....

another is:
  
  lvcreate -n test testvg -l32 /dev/sda1
  lvextend /dev/testvg/test -l+32 /dev/sdb1
  lvextend .....

I found the second way can't work when the size of lv is big enough
(about 26G) it complains about metadata size is too big.

But I thinks the disk usage should be the same. why is metadata size
diffrent?
