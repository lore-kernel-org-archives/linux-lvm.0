Received: from agk.surrey.redhat.com (agk.surrey.redhat.com [172.16.10.74])
	by pobox.surrey.redhat.com (8.12.8/8.12.8) with ESMTP id jBLE9qws025549
	for <linux-lvm@redhat.com>; Wed, 21 Dec 2005 14:09:52 GMT
Received: from agk by agk.surrey.redhat.com with local (Exim 4.34)
	id 1Ep4f9-0005eZ-W7
	for linux-lvm@redhat.com; Wed, 21 Dec 2005 14:09:51 +0000
Date: Wed, 21 Dec 2005 14:09:51 +0000
From: Alasdair G Kergon <agk@redhat.com>
Subject: Re: [linux-lvm] Recovery of data in LVM from a corrupt disk
Message-ID: <20051221140951.GD25866@agk.surrey.redhat.com>
References: <AED6CFAFF9F260323C3E5890@d216-220-25-20.dynip.modwest.com>
	<20051221011236.10857.qmail@web80907.mail.scd.yahoo.com>
	<20051221113610.GX10278@strugglers.net>
Mime-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20051221113610.GX10278@strugglers.net>
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

On Wed, Dec 21, 2005 at 11:36:10AM +0000, Andy Smith wrote:
> Perhaps you could boot off a rescue cd or knoppix or something, edit
> the lvm.conf to tell it to only consider /dev/hdc or wherever you
> have the old disk connected, do the vgscan to pick up the old vg,
> and then vgrename to try and rename it.
 
And you can set the LVM_SYSTEM_DIR environment variable to tell
lvm2 to read its lvm.conf file from a different directory to
avoid editing the system one.

Alasdair
-- 
agk@redhat.com
