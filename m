From: Harald Milz <hm@seneca.muc.de>
Subject: Re: [linux-lvm] Mirroring
References: <38A431B0.C4B1114E@alwan.com>
Reply-To: h.milz@seneca.muc.de
Message-Id: <20000211162518.0A595E81E@seneca.muc.de>
Date: Fri, 11 Feb 2000 17:25:18 +0100 (CET)
Sender: owner-linux-lvm
Errors-To: owner-linux-lvm
List-Id: <linux-lvm.redhat.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: linux-lvm@msede.com

Chris Anderson <chris@alwan.com> wrote:
> I have looked through the doc and I see that LVM stripes but how do you
> setup a true mirror?  One hard dive mirrored to another hard drive (1 to
> 1).

It's more like one partition or logical volume mirrored against another
one (not necessarily disks - you seem to be familiar with Novell). LVM
can't do this. Use MD.

-- 
If you sit down at a poker game and don't see a sucker, get up.  You're
the sucker.
