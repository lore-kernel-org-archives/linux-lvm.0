Received: from agk.surrey.redhat.com (agk.surrey.redhat.com [172.16.10.74])
	by pobox.surrey.redhat.com (8.12.8/8.12.8) with ESMTP id i8BKgerI026738
	for <linux-lvm@redhat.com>; Sat, 11 Sep 2004 21:42:40 +0100
Received: from agk by agk.surrey.redhat.com with local (Exim 4.34)
	id 1C6Ehk-0001uE-RD
	for linux-lvm@redhat.com; Sat, 11 Sep 2004 21:42:40 +0100
Date: Sat, 11 Sep 2004 21:42:40 +0100
From: Alasdair G Kergon <agk@redhat.com>
Subject: Re: [linux-lvm] LVM2 Device Permissions
Message-ID: <20040911204240.GG1094@agk.surrey.redhat.com>
References: <Pine.LNX.4.61.0409101016330.8512@zeus.rsc.raytheon.com>
Mime-Version: 1.0
Content-Disposition: inline
In-Reply-To: <Pine.LNX.4.61.0409101016330.8512@zeus.rsc.raytheon.com>
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

On Fri, Sep 10, 2004 at 10:27:37AM -0700, Steve Witt wrote:
> The LVM volumes have permissions of (/dev/mapper) :
 
> brw-------  1 root root 254,  2 Sep  9 02:20 server_vg-home1_lv
 
The mknods are meant to respect umask (can set in lvm.conf),
but maybe it needs enhancing for different umasks/ownership 
for different files.  [For now, just change things after
they've been created e.g. wrap the tools]

Alasdair
-- 
agk@redhat.com
