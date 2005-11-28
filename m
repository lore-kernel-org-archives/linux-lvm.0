Received: from mx3.redhat.com (mx3.redhat.com [172.16.48.32])
	by int-mx1.corp.redhat.com (8.11.6/8.11.6) with ESMTP id jASHUlV16282
	for <linux-lvm@redhat.com>; Mon, 28 Nov 2005 12:30:47 -0500
Received: from cichlid.com (dsl3-63-249-91-37.cruzio.com [63.249.91.37])
	by mx3.redhat.com (8.13.1/8.13.1) with ESMTP id jASHUZcs018042
	for <linux-lvm@redhat.com>; Mon, 28 Nov 2005 12:30:39 -0500
Received: from cichlid.com (cichlid.com [127.0.0.1])
	by cichlid.com (8.13.1/8.12.5) with ESMTP id jASHUGJ7014754
	for <linux-lvm@redhat.com>; Mon, 28 Nov 2005 09:30:23 -0800
Date: Mon, 28 Nov 2005 09:30:12 -0800
From: Andrew Burgess <aab@cichlid.com>
Message-Id: <200511281730.jASHUCBT014529@cichlid.com>
References: <1_05112715011928541@cichlid.com>
Subject: [linux-lvm] Re: No space on device message, Not true
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
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: linux-lvm@redhat.com

>I have it mounted as /users and am exporting it. On another SLES9 
>machine I am mounting it. This all works fine. However when I try to 
>create multiple files on it I get  messages like
>/users1 # cp -r /usr/local/ .
>cp: writing `./local/bin/hssdb': No space left on device
>cp: closing `./local/bin/hssdb': No space left on device
>cp: closing `./local/lib64/libufp.a': No space left on device

>There is scads of space
>/users1 # df .
>Filesystem           1K-blocks      Used Available Use% Mounted on
>s712-5:/users1       11703708896     36960 11703671936   1% /users1

>And this only happens on the nodes that NFS mount the file system. On 
>the local node everything works fine.

Is it a 4GB filesystem max limitition of NFS? Just a guess.
