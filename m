Received: from agk.surrey.redhat.com (agk.surrey.redhat.com [172.16.10.74])
	by pobox.surrey.redhat.com (8.12.8/8.12.8) with ESMTP id iBBMatH6032263
	for <linux-lvm@redhat.com>; Sat, 11 Dec 2004 22:36:55 GMT
Received: from agk by agk.surrey.redhat.com with local (Exim 4.34)
	id 1CdFrD-0006rP-17
	for linux-lvm@redhat.com; Sat, 11 Dec 2004 22:36:55 +0000
Date: Sat, 11 Dec 2004 22:36:55 +0000
From: Alasdair G Kergon <agk@redhat.com>
Subject: Re: [linux-lvm] duplicate pv.
Message-ID: <20041211223654.GI11338@agk.surrey.redhat.com>
References: <20041211114213.76916.qmail@web52508.mail.yahoo.com>
Mime-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20041211114213.76916.qmail@web52508.mail.yahoo.com>
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
Content-Transfer-Encoding: 7bit
To: LVM general discussion and development <linux-lvm@redhat.com>

On Sat, Dec 11, 2004 at 03:42:13AM -0800, johon Doe wrote:
> Hi, I have a 2.6.9 kernel and I have problems to
> create an vg device over a raid1 array.

What LVM2 version?
Please try with 2.00.29 or .30.
Make sure md_component_detection is *not* set to 0 in lvm.conf.

Alasdair
-- 
agk@redhat.com
