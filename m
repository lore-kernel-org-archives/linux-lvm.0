Received: from mx1.redhat.com (ext-mx03.extmail.prod.ext.phx2.redhat.com
	[10.5.110.27])
	by int-mx09.intmail.prod.int.phx2.redhat.com (8.14.4/8.14.4) with ESMTP
	id u3QMhwQZ017628
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256
	verify=NO)
	for <linux-lvm@redhat.com>; Tue, 26 Apr 2016 18:43:59 -0400
Received: from smtp1.dds.nl (smtpgw.dds.nl [91.142.252.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mx1.redhat.com (Postfix) with ESMTPS id 1994781105
	for <linux-lvm@redhat.com>; Tue, 26 Apr 2016 22:43:58 +0000 (UTC)
Received: from webmail.dds.nl (app1.dds.nl [81.21.136.61])
	by smtp1.dds.nl (Postfix) with ESMTP id 444B97F045
	for <linux-lvm@redhat.com>; Wed, 27 Apr 2016 00:35:15 +0200 (CEST)
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Date: Tue, 26 Apr 2016 22:35:15 +0000
From: Xen <list@xenhideout.nl>
Message-ID: <1878ee4357f761c330210f82e80ead3d@dds.nl>
Subject: [linux-lvm] swap on lvm cache
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
Content-Type: text/plain; charset="us-ascii"; format="flowed"
To: LVM general discussion and development <linux-lvm@redhat.com>

Just a weird question here.

Since swap should ordinarily be encrypted if you encrypt any part of 
your data at all, I have opted at this point to either put it inside a 
volume that might end up getting cached, or to disable that cache and 
put the swap in its place.

What I am saying is that in my current scheme there is going to be a 
small cache drive and one part of the cache drive is going to serve 
unencrypted data and the other part is going to serve encrypted data.

Supposing that, the swap would be in the encrypted part. But using cache 
(lvmcache) on swap is completely ludicrous right?

Swap content might change so fast and so often that with regular 
parameters (that would need to be identical for the entire encrypted 
container) it would never make it to the cache.

More, accessing swap means loading it into RAM and then clearing the 
swap part. Therefore, theoretically perhaps unless the promotion values 
are 0, there would never be any benefit because swap is always write 
once read once.

Then again, that means there is no pain in adding swap to it either, 
because it will never get cached.

Maybe it could be considered an innocent or innocuous element. Doesn't 
hurt you, doesn't provide any benefit. In Dutch we say "Baat het niet, 
dan schaadt het niet."

Alternatively you could put the swap on the SSD (in this case) and not 
have any cache for the other part of the drive. What do you think? It 
makes no sense and it makes no difference, right.

Regards, Bart.
