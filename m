Received: from agk.surrey.redhat.com (agk.surrey.redhat.com [172.16.10.74])
	by pobox.surrey.redhat.com (8.12.8/8.12.8) with ESMTP id i95MGuS9001252
	for <linux-lvm@redhat.com>; Tue, 5 Oct 2004 23:16:56 +0100
Received: from agk by agk.surrey.redhat.com with local (Exim 4.34)
	id 1CExc8-0004Lk-23
	for linux-lvm@redhat.com; Tue, 05 Oct 2004 23:16:56 +0100
Date: Tue, 5 Oct 2004 23:16:55 +0100
From: Alasdair G Kergon <agk@redhat.com>
Subject: Re: [linux-lvm] lvcreate error
Message-ID: <20041005221655.GL6404@agk.surrey.redhat.com>
References: <1097014162.3577.16.camel@rich>
Mime-Version: 1.0
Content-Disposition: inline
In-Reply-To: <1097014162.3577.16.camel@rich>
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

On Tue, Oct 05, 2004 at 03:09:22PM -0700, rich turner wrote:
> i have created a bunch of logical volumes on a single system with the
> following commands:
> #lvcreate -C n -l 512 -n backuplv -p rw --persistent y --major 253
> --minor 255 -r 0 vg0

...

> when i try to create the next one it fails with the following error:
> #lvcreate -C n -l 640 -n usrlv -p rw --persistent y --major 253 --minor
> 242 -r 0 vg0
> Physical extent 0 of /dev/hdb2 referenced by more thatn one logical
> volume. Couldn't fill extent allocation bitmaps vg0.
 
Please report what version of LVM2 you're using ('lvm version') and
what architecture and what kernel.

If it's version 2.00.17 or later, please tar/zip /etc/lvm directory
and email it to me (not the list).  (Before that version, I'm not 
interested.)  Also enable debugging-to-log-file for the command that 
fails and send me the complete output (compressed).
  e.g. lvm.conf:  in log section:      
    file="/tmp/lvm2.log"
    level=7

Also (of course) try to reproduce with latest release (2.00.25).

Alasdair
-- 
agk@redhat.com
