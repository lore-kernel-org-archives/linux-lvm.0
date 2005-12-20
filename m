Received: from mx1.redhat.com (mx1.redhat.com [172.16.48.31])
	by int-mx1.corp.redhat.com (8.11.6/8.11.6) with ESMTP id jBK1gP132623
	for <linux-lvm@redhat.com>; Mon, 19 Dec 2005 20:42:25 -0500
Received: from spamtest2.viacore.net ([64.162.99.240])
	by mx1.redhat.com (8.12.11/8.12.11) with ESMTP id jBK1gJjI007066
	for <linux-lvm@redhat.com>; Mon, 19 Dec 2005 20:42:19 -0500
Received: from spamtest1.spamtest.viacore.net (spamtest1.spamtest.viacore.net
	[192.168.201.101])
	by spamtest2.viacore.net (Postfix) with SMTP id AE1A08143A
	for <linux-lvm@redhat.com>; Mon, 19 Dec 2005 16:32:54 -0800 (PST)
Received: from [10.15.1.15] (loather.viacore.net [10.15.1.15])
	by spamtest1.spamtest.viacore.net (Postfix) with ESMTP id 6743F281146
	for <linux-lvm@redhat.com>; Mon, 19 Dec 2005 16:34:20 -0800 (PST)
Message-ID: <43A75529.10809@tsss.org>
Date: Mon, 19 Dec 2005 16:49:45 -0800
From: kelsey hudson <khudson@tsss.org>
MIME-Version: 1.0
Subject: Re: [linux-lvm] meaning of -L for snapshots ?
References: <Pine.LNX.4.63.0512191419400.23209@s1.ckr-solutions.com>
In-Reply-To: <Pine.LNX.4.63.0512191419400.23209@s1.ckr-solutions.com>
Content-Transfer-Encoding: 7bit
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



Olivier Kaloudoff wrote:

>     Who can explain the usage of -L10M for my snapshot ?

LVM snapshots have a limitation to how much data can change before the 
snapshot becomes invalid. So, by using -L10M, you're saying to keep the 
snapshot around until 10M of data has changed, then the snapshot becomes 
invalid.

Because of the way LVM snapshots work, they require extra space on a 
volume. So, the size of your snapshot volume dictates how long it will 
remain valid. A good rule of thumb is between 10% and 20% of your 
primary volume's size. That way, 10 to 20% of the filesystem's contents 
can change and your snapshot will remain valid.

Hope this clears some things up for you.

-Kelsey
