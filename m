Received: from mx3.redhat.com (mx3.redhat.com [172.16.48.32])
	by int-mx1.corp.redhat.com (8.11.6/8.11.6) with SMTP id i22C8x832489
	for <linux-lvm@redhat.com>; Tue, 2 Mar 2004 07:08:59 -0500
From: =?iso-8859-1?q?M=E5ns_Rullg=E5rd?= <mru@kth.se>
Message-ID: <yw1xy8qjxxgt.fsf@kth.se>
References: <001301c40041$7fdeab30$0400a8c0@vector>
Mime-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: [linux-lvm] Re: What if a drive dies ?
Sender: linux-lvm-admin@redhat.com
Errors-To: linux-lvm-admin@redhat.com
Reply-To: linux-lvm@redhat.com
List-Help: <mailto:linux-lvm-request@redhat.com?subject=help>
List-Post: <mailto:linux-lvm@redhat.com>
List-Subscribe: <https://www.redhat.com/mailman/listinfo/linux-lvm>,
	<mailto:linux-lvm-request@redhat.com?subject=subscribe>
List-Id: LVM general discussion and development <linux-lvm.redhat.com>
List-Unsubscribe: <https://www.redhat.com/mailman/listinfo/linux-lvm>,
	<mailto:linux-lvm-request@redhat.com?subject=unsubscribe>
List-Archive: <https://www.redhat.com/archives/linux-lvm/>
Date: Tue Mar  2 07:07:02 2004
List-Id: <linux-lvm.redhat.com>
Content-Type: text/plain; charset="utf-8"
To: linux-lvm@sistina.com

"Perplexer" <perplexer@thz.net> writes:

> Hello.
>
> I'm sorry if I ask something that's be asked a million times before but I
> prefer answers to my specific questions. I hope someone will try to help.
>
> I have a VG with several differently sized PVs and one LV. It is working
> fine but I am affraid that one day one of the drives would fail.

It happened to me.

> I'd like to know what I'll be looking at when that happens. What if
> one drive would fail in that VG ? Can I remove it and 'repair' the
> VG/LV to run on with one drive less

LVM2 can run readonly with some drives missing.

> (data is written in striped mode).

That lowers your odds considerably.  I wouldn't count on recovering
anything at all.

> That would mean I got my VG/LV back on-line but the data that was on
> the bad disk would be missing (a small price to pay actually). Would
> I need to resize the filesystem again with some tool or anything
> special ?

If you didn't run in striped mode you'd probably be able to recover
most of the data from the remaining disks, the exact results would
depend on the filesystem used and which part of it was lost.  However,
in striped mode you'll lose fragments all over the place.  Recovering
from that is more or less impossible.

If your data is precious, use RAID1 or RAID5 and make regular backups.

-- 
M�ns Rullg�rd
mru@kth.se
