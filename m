Date: Thu, 8 Jun 2000 12:49:53 +0100 (IST)
From: Paul Jakma <paulj@itg.ie>
Subject: Re: [linux-lvm] LVM 0.8final for 2.2.15/2.2.16?
In-Reply-To: <20000608103415.A3935@gruyere.muc.suse.de>
Message-ID: <Pine.LNX.4.21.0006081245010.3252-100000@rossi.itg.ie>
MIME-Version: 1.0
Sender: owner-linux-lvm
Errors-To: owner-linux-lvm
List-Id: <linux-lvm.redhat.com>
Content-Type: TEXT/PLAIN; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Andi Kleen <ak@suse.de>
Cc: Jos Visser <josv@osp.nl>, Paul Jakma <paul@clubi.ie>, Michael Marxmeier <mike@msede.com>, jan@gondor.com, linux-lvm@msede.com

On Thu, 8 Jun 2000, Andi Kleen wrote:

> consider a database that uses user space journaling using fsync:
> to make its disk files consistent after the snapshot it requires
> both the log write and the data write. When one is missing the
> log needs to be replayed, which requires writes.

but doesn't the call to block_fsync that Heinz confirmed exists cover
this?

nothing can cover the case where app data consistency depends on a future
write(). But that's the app's problem, and anyway a good database should
be consistent/recover itself if it's died between write(?)'s. right?

(in which case lvm snapshot is perfectly suitable for backing up
databases..)

--paulj
