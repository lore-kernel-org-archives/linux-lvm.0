Received: from mx1.redhat.com (ext-mx13.extmail.prod.ext.phx2.redhat.com
	[10.5.110.18])
	by int-mx11.intmail.prod.int.phx2.redhat.com (8.14.4/8.14.4) with ESMTP
	id s2E5q9Kt031793
	for <linux-lvm@redhat.com>; Fri, 14 Mar 2014 01:52:09 -0400
Received: from nm3-vm5.access.bullet.mail.bf1.yahoo.com
	(nm3-vm5.access.bullet.mail.bf1.yahoo.com [216.109.114.100])
	by mx1.redhat.com (8.14.4/8.14.4) with ESMTP id s2E5q7nD023895
	for <linux-lvm@redhat.com>; Fri, 14 Mar 2014 01:52:08 -0400
References: <0c0501cf3e39$0e82e0f0$2b88a2d0$@acm.org>
	<20140312233505.GA1660@redhat.com>
	<0c1301cf3e5c$1218eb10$364ac130$@acm.org>
	<20140313140158.GB5738@redhat.com>
	<0d2301cf3f2e$93e8d970$bbba8c50$@acm.org>
Message-ID: <1394776326.87374.YahooMailNeo@web181504.mail.ne1.yahoo.com>
Date: Thu, 13 Mar 2014 22:52:06 -0700 (PDT)
From: matthew patton <pattonme@yahoo.com>
In-Reply-To: <0d2301cf3f2e$93e8d970$bbba8c50$@acm.org>
MIME-Version: 1.0
Subject: Re: [linux-lvm] thinpool metadata size
Reply-To: matthew patton <pattonme@yahoo.com>,
	LVM general discussion and development <linux-lvm@redhat.com>
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
Content-Transfer-Encoding: 7bit
To: LVM general discussion and development <linux-lvm@redhat.com>


>Interesting, then after I added an extra order of magnitude padding for the
>number of snapshots, it's probably quite over allocated. But still, again
>2.5G isn't very much in the scale of things.

The enterprise boys allocate as much as 30% of usable space to housekeeping so I'd say 2.5GB is a damn trifle.
