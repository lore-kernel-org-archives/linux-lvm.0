Received: from fentible.pjc.net (vpn-4-2.stuttgart.redhat.com [10.32.4.2])
	by pobox.surrey.redhat.com (8.12.8/8.12.8) with ESMTP id j9V8KBvl008240
	for <linux-lvm@redhat.com>; Mon, 31 Oct 2005 08:20:11 GMT
Received: from jeltz.pjc.net ([192.168.1.2])
	by fentible.pjc.net with esmtp (Exim 4.50) id 1EWUtn-0002M4-44
	for linux-lvm@redhat.com; Mon, 31 Oct 2005 08:20:11 +0000
Message-ID: <4365D3BA.5060208@redhat.com>
Date: Mon, 31 Oct 2005 08:20:10 +0000
From: Patrick Caulfield <pcaulfie@redhat.com>
MIME-Version: 1.0
Subject: Re: [linux-lvm] LVM 2.01.15  Internal lvm error, check syslog
References: <20051023224004.76D5A3ACF8@webd.globtel.pl>
In-Reply-To: <20051023224004.76D5A3ACF8@webd.globtel.pl>
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
Content-Type: text/plain; charset="us-ascii"
To: LVM general discussion and development <linux-lvm@redhat.com>

szym@globtel.pl wrote:
> ccHI,
> 
> I try to use clustered lvm, change locking_type to 2, 
> use library /lib/liblvm2clusterlock.so lunch clvmd 
> but something is wrong
> Every time i put 'vgchange -ay' on gfs node i see
> Error locking on node node1: Internal lvm error, check syslog
> Error locking on node node2: Internal lvm error, check syslog
> Error locking on node node3: Internal lvm error, check syslog
> 
> 

Is there anything in syslog ??

If not you might have to enable some logging in /etc/lvm/lvm.conf
-- 

patrick
