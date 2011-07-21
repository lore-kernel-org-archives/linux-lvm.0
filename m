Received: from mx1.redhat.com (ext-mx12.extmail.prod.ext.phx2.redhat.com
	[10.5.110.17])
	by int-mx09.intmail.prod.int.phx2.redhat.com (8.14.4/8.14.4) with ESMTP
	id p6LGjoVY001174
	for <linux-lvm@redhat.com>; Thu, 21 Jul 2011 12:45:50 -0400
Received: from ps536.phatservers.com (ps536.phatservers.com [216.17.105.202])
	by mx1.redhat.com (8.14.4/8.14.4) with ESMTP id p6LGjn34009659
	for <linux-lvm@redhat.com>; Thu, 21 Jul 2011 12:45:50 -0400
Received: from r74-192-17-33.bcstcmta01.clsttx.tl.dh.suddenlink.net
	([74.192.17.33] helo=[10.0.2.107])
	by ps536.phatservers.com with esmtpa (Exim 4.66)
	(envelope-from <support@bettercgi.com>) id 1QjwNg-0005wM-9x
	for linux-lvm@redhat.com; Thu, 21 Jul 2011 09:45:48 -0700
References: <2BF070A7A2375D46BA1B6087F8D5DCB67E864BF902@seldmbx01.corpusers.net>
In-Reply-To: <2BF070A7A2375D46BA1B6087F8D5DCB67E864BF902@seldmbx01.corpusers.net>
MIME-Version: 1.0
From: "adultsitesoftware@gmail.com" <support@bettercgi.com>
Date: Thu, 21 Jul 2011 11:45:41 -0500
Message-ID: <b0fec5b3-201a-4072-bff3-1959ae76dc5a@email.android.com>
Content-Transfer-Encoding: 8bit
Subject: Re: [linux-lvm] How to resize a logical volume with snapshots?
Reply-To: LVM general discussion and development <linux-lvm@redhat.com>
List-Id: LVM general discussion and development <linux-lvm.redhat.com>
List-Unsubscribe: <https://www.redhat.com/mailman/options/linux-lvm>,
	<mailto:linux-lvm-request@redhat.com?subject=unsubscribe>
List-Archive: <https://www.redhat.com/archives/linux-lvm>
List-Post: <mailto:linux-lvm@redhat.com>
List-Help: <mailto:linux-lvm-request@redhat.com?subject=help>
List-Subscribe: <https://www.redhat.com/mailman/listinfo/linux-lvm>,
	<mailto:linux-lvm-request@redhat.com?subject=subscribe>
List-Id: <linux-lvm.redhat.com>
Content-Type: text/plain; charset="us-ascii"
To: LVM general discussion and development <linux-lvm@redhat.com>




>Hi,
>
>Does anyone have an idea how to resize a logical volume with snapshots
>attached without destroying the snapshots?
>>From my understanding the snapshot need to be able to contain all
>changed blocks so additional blocks in a resize need to be copied into
>the snapshot volume. Or am I wrong?

Yes, you are. Adding extents doesn't write anything to them. 
-- 
Sent from my Android phone with K-9 Mail. Please excuse my brevity.
