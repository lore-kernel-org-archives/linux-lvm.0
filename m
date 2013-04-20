Received: from mx1.redhat.com (ext-mx11.extmail.prod.ext.phx2.redhat.com
	[10.5.110.16])
	by int-mx09.intmail.prod.int.phx2.redhat.com (8.14.4/8.14.4) with ESMTP
	id r3K0Rl88028810
	for <linux-lvm@redhat.com>; Fri, 19 Apr 2013 20:27:47 -0400
Received: from Ishtar.hs (ishtar.tlinx.org [173.164.175.65])
	by mx1.redhat.com (8.14.4/8.14.4) with ESMTP id r3K0RkLn017126
	for <linux-lvm@redhat.com>; Fri, 19 Apr 2013 20:27:46 -0400
Received: from [192.168.4.12] (Athenae [192.168.4.12])
	by Ishtar.hs (8.14.5/8.14.4/SuSE Linux 0.8) with ESMTP id
	r3K0RgEN011439
	for <linux-lvm@redhat.com>; Fri, 19 Apr 2013 17:27:45 -0700
Message-ID: <5171E0FE.8090104@tlinx.org>
Date: Fri, 19 Apr 2013 17:27:42 -0700
From: L A Walsh <lvm@tlinx.org>
MIME-Version: 1.0
References: <CAH5g024xgwq43FN11Wr5AgYEJKhWZQyXd3KZhqwoqceWNF5MCQ@mail.gmail.com>	<51712EFE.2000300@redhat.com>
	<28F96FC8-0313-485B-B4D4-1502A59158E9@redhat.com>
In-Reply-To: <28F96FC8-0313-485B-B4D4-1502A59158E9@redhat.com>
Content-Transfer-Encoding: 7bit
Subject: Re: [linux-lvm] (LONG) Delay when writing to LVM after boot
Reply-To: LVM general discussion and development <linux-lvm@redhat.com>
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
To: LVM general discussion and development <linux-lvm@redhat.com>

Brassow Jonathan wrote:
> Performing a block-level write directly to the logical volume could help determine the answer to whether the problem is with the logical volume or the file system.  You have to be willing to destroy your file system ....
----

Since it is lvm, maybe it would be possible to allocate space for a
100GB partition or something? and use that for test w/no file system on it?

Then put a FS on it and see if it does the same thing.

Insn't ext4 extent-based like xfs?

If you do a large write on xfs -- it will try to find a space large enough
for the whole thing.

If your disk's freespace is fragmented maybe ext4 is looking for
the space for the file and has to read in all the free areas the
first time?

Sounds more likely to be a FS prob than lvm.
