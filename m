Received: from agk.surrey.redhat.com (agk.surrey.redhat.com [172.16.10.74])
	by pobox.surrey.redhat.com (8.12.8/8.12.8) with ESMTP id i84IKZJ0001507
	for <linux-lvm@redhat.com>; Sat, 4 Sep 2004 19:20:35 +0100
Received: from agk by agk.surrey.redhat.com with local (Exim 4.34)
	id 1C3f9P-0003Ke-9h
	for linux-lvm@redhat.com; Sat, 04 Sep 2004 19:20:35 +0100
Date: Sat, 4 Sep 2004 19:20:35 +0100
From: Alasdair G Kergon <agk@redhat.com>
Subject: Re: [linux-lvm] How to restore a logical volume
Message-ID: <20040904182035.GW6264@agk.surrey.redhat.com>
References: <20040904124557.4592E3568033@ml1.melster-langhoff.de>
Mime-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20040904124557.4592E3568033@ml1.melster-langhoff.de>
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

On Sat, Sep 04, 2004 at 02:45:57PM +0200, ron@melster.de wrote:
> I _accidently_ removed the logical volume and would like to know the
> command. I considered using lvextend but didn't know if this would
> delete my data which were in lv.
 
vgcfgrestore

Alasdair
-- 
agk@redhat.com
