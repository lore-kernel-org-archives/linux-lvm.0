Received: from agk.surrey.redhat.com (agk.surrey.redhat.com [172.16.10.74])
	by pobox.surrey.redhat.com (8.12.8/8.12.8) with ESMTP id iA5JJWbM009597
	for <linux-lvm@redhat.com>; Fri, 5 Nov 2004 19:19:32 GMT
Received: from agk by agk.surrey.redhat.com with local (Exim 4.34)
	id 1CQ9cS-0000g4-Cn
	for linux-lvm@redhat.com; Fri, 05 Nov 2004 19:19:32 +0000
Date: Fri, 5 Nov 2004 19:19:32 +0000
From: Alasdair G Kergon <agk@redhat.com>
Subject: Re: [linux-lvm] unable to create physical volume
Message-ID: <20041105191932.GB2036@agk.surrey.redhat.com>
References: <1099678572.3681.88.camel@rich>
Mime-Version: 1.0
Content-Disposition: inline
In-Reply-To: <1099678572.3681.88.camel@rich>
Reply-To: LVM general discussion and development <linux-lvm@redhat.com>
List-Id: LVM general discussion and development <linux-lvm.redhat.com>
List-Unsubscribe: <https://www.redhat.com/mailman/listinfo/linux-lvm>,
	<mailto:linux-lvm-request@redhat.com?subject=unsubscribe>
List-Archive: </archives/linux-lvm>
List-Post: <mailto:linux-lvm@redhat.com>
List-Help: <mailto:linux-lvm-request@redhat.com?subject=help>
List-Subscribe: <https://www.redhat.com/mailman/listinfo/linux-lvm>,
	<mailto:linux-lvm-request@redhat.com?subject=subscribe>
List-Id: <linux-lvm.redhat.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: LVM general discussion and development <linux-lvm@redhat.com>

On Fri, Nov 05, 2004 at 10:16:13AM -0800, rich turner wrote:
> [root@redhat proc]# pvcreate /dev/etherd/e0.1
>   /dev/etherd/e0.1: Couldn't find device.
 
Does 'cat /proc/devices' have a special entry for them?

If so, then you'll need to update the 'types' line in the
config file to include them.

Alasdair
-- 
agk@redhat.com
