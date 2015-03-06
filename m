Received: from mx1.redhat.com (ext-mx11.extmail.prod.ext.phx2.redhat.com
	[10.5.110.16])
	by int-mx10.intmail.prod.int.phx2.redhat.com (8.14.4/8.14.4) with ESMTP
	id t26GTtCH013577
	for <linux-lvm@redhat.com>; Fri, 6 Mar 2015 11:29:55 -0500
Received: from mail-ig0-f182.google.com (mail-ig0-f182.google.com
	[209.85.213.182])
	by mx1.redhat.com (8.14.4/8.14.4) with ESMTP id t26GTrVI020713
	(version=TLSv1/SSLv3 cipher=AES128-GCM-SHA256 bits=128 verify=FAIL)
	for <linux-lvm@redhat.com>; Fri, 6 Mar 2015 11:29:53 -0500
Received: by igkb16 with SMTP id b16so5101090igk.1
	for <linux-lvm@redhat.com>; Fri, 06 Mar 2015 08:29:52 -0800 (PST)
Received: from [191.9.212.191] (rrcs-70-62-41-24.central.biz.rr.com.
	[70.62.41.24])
	by mx.google.com with ESMTPSA id w31sm7218430ioi.32.2015.03.06.08.29.51
	for <linux-lvm@redhat.com>
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Fri, 06 Mar 2015 08:29:51 -0800 (PST)
Message-ID: <54F9D5F9.1030609@gmail.com>
Date: Fri, 06 Mar 2015 11:29:45 -0500
From: Austin S Hemmelgarn <ahferroin7@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Subject: [linux-lvm] Question (and feature suggestions) regarding lvmcache
	and lvmthin
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
To: linux-lvm@redhat.com

I've got a couple of cached LV's on my system where the origin is a 
RAID{1,10,5} LV, and have noticed that there doesn't appear to be any 
way (at least that I can find) of resyncing/scrubbing the origin LV 
without detaching it from the cache pool, which is significantly 
inconvenient as I scrub the origin LV's weekly.  I was wondering if 
there was any advice on how to do this without needing to detach it from 
the pool

On a somewhat related note, It would be a nice feature for both cached 
LV's and thinpool LV's to be able to just run 'lvchange --syncaction 
check' on the pool/cached LV and have it scrub each of the constituent 
LV's if applicable (ie, if you have a thinpool LV where the data and 
metadata LV's are RAID{1,10,5,6}, then running 'lvchange --syncaction 
check' on the thinpool would trigger a read-only resync for the data and 
metadata LV's).

Please cc me on replies, as I'm not subscribed to the list.
