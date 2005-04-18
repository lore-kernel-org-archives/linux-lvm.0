Received: from agk.surrey.redhat.com (agk.surrey.redhat.com [172.16.10.74])
	by pobox.surrey.redhat.com (8.12.8/8.12.8) with ESMTP id j3I070kk025178
	for <linux-lvm@redhat.com>; Mon, 18 Apr 2005 01:07:00 +0100
Received: from agk by agk.surrey.redhat.com with local (Exim 4.34)
	id 1DNJn2-0006RG-Eb
	for linux-lvm@redhat.com; Mon, 18 Apr 2005 01:07:00 +0100
Date: Mon, 18 Apr 2005 01:07:00 +0100
From: Alasdair G Kergon <agk@redhat.com>
Subject: Re: [linux-lvm] HELP ME! (Couldn't find device with uuid
	'blah-blah-blah') (More detailed subject) Sorry
Message-ID: <20050418000700.GH9049@agk.surrey.redhat.com>
References: <004601c542f2$184b3cf0$0801a8c0@MOE>
Mime-Version: 1.0
Content-Disposition: inline
In-Reply-To: <004601c542f2$184b3cf0$0801a8c0@MOE>
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

On Sat, Apr 16, 2005 at 09:06:39PM -0500, Ramzy Darwish wrote:
> "Couldn't find device with uuid 'blah-blah-blah'
> "Couldn't find all physical volumes for volume group VolGrp"

This is becoming an FAQ.

Start by telling which version of LVM2 (run 'lvm version') and 
what distribution (some distributions have more trouble than 
others with this) and detail your disk config: e.g. do you have raid,
any disk partitions?

Alasdair
