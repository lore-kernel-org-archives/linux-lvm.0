Received: from mx3.redhat.com (mx3.redhat.com [172.16.48.32])
	by int-mx1.corp.redhat.com (8.13.1/8.13.1) with ESMTP id m54BjwWB021669
	for <linux-lvm@redhat.com>; Wed, 4 Jun 2008 07:45:58 -0400
Received: from mx03.syneticon.net (mx03.syneticon.net [87.79.32.166])
	by mx3.redhat.com (8.13.8/8.13.8) with ESMTP id m54Bjjhr023141
	for <linux-lvm@redhat.com>; Wed, 4 Jun 2008 07:45:45 -0400
Received: from localhost (filter1.syneticon.net [192.168.113.3])
	by mx03.syneticon.net (Postfix) with ESMTP id 1352F946A
	for <linux-lvm@redhat.com>; Wed,  4 Jun 2008 13:45:45 +0200 (CEST)
Received: from mx03.syneticon.net ([192.168.113.4])
	by localhost (mx03.syneticon.net [192.168.113.3]) (amavisd-new,
	port 10025) with ESMTP id tFz-v16QEV1t for <linux-lvm@redhat.com>;
	Wed,  4 Jun 2008 13:45:44 +0200 (CEST)
Received: from [192.168.10.145] (koln-4d0b66b7.pool.mediaWays.net
	[77.11.102.183]) by mx03.syneticon.net (Postfix) with ESMTP
	for <linux-lvm@redhat.com>; Wed,  4 Jun 2008 13:45:44 +0200 (CEST)
Message-ID: <48468067.2080406@wpkg.org>
Date: Wed, 04 Jun 2008 13:45:43 +0200
From: Tomasz Chmielewski <mangoo@wpkg.org>
MIME-Version: 1.0
Subject: Re: [linux-lvm] Restoring method Snapshot to Orginal Volume
References: <OF7B312B80.8E5D67C6-ONC125745E.0029E521-C125745E.0029F5B6@lippi.fr>
In-Reply-To: <OF7B312B80.8E5D67C6-ONC125745E.0029E521-C125745E.0029F5B6@lippi.fr>
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

Antony MARTINEAU schrieb:

(...)

> ideally
> dd if=/dev/vg0/lv1.snap of=/dev/vg0/lv1 should be perfect but it is 
> impossible because when restoring snapshot on the original volume, the 
> snapshot continue to increase until to become fully and inactive

Increase your snapshot size then.


> Is there a solution to deactive the cow (copy and write)for during the 
> restoration about snapshot to original volume ?

See the "ANNOUNCE: an experimental implementation of snapshot merging" 
thread.


-- 
Tomasz Chmielewski
http://wpkg.org
