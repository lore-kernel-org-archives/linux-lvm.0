Date: Wed, 8 Nov 2000 17:31:13 +0100
From: Andrea Arcangeli <andrea@suse.de>
Subject: [linux-lvm] Re: LVM 2.2 snapshot bug
Message-ID: <20001108173113.B3650@inspiron.suse.de>
References: <20001107174504.A5834@inspiron.suse.de> <Pine.LNX.4.05.10011080001260.12418-100000@humbolt.nl.linux.org>
Mime-Version: 1.0
Content-Disposition: inline
In-Reply-To: <Pine.LNX.4.05.10011080001260.12418-100000@humbolt.nl.linux.org>; from riel@conectiva.com.br on Wed, Nov 08, 2000 at 12:04:50AM +0100
Sender: owner-linux-lvm
Errors-To: owner-linux-lvm
List-Id: <linux-lvm.redhat.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Rik van Riel <riel@conectiva.com.br>
Cc: linux-lvm@msede.com, marcelo@conectiva.com.br, "Stephen C. Tweedie" <sct@redhat.com>, Chris Mason <mason@suse.com>

On Wed, Nov 08, 2000 at 12:04:50AM +0100, Rik van Riel wrote:
> I haven't checked yet if LVM actually returns an error
> to ext3 or if it just silently (well, except for the

After ll_rw_block(WRITE) returns the buffer will be clean and _not_ uptodate.
That's the only way a blockdevice reports I/O errors to highlevel layers.

> Exposing a read-only device as read-write to the users
> will cause a bit of confusion, yes :)

I agree.

> Though I guess Stephen's decision to do log replay on
> read-only mounted filesystems on read-write block
> devices is certainly a defendable decision. Btw, don't

Yes, I'm not complaining that decsion.

What I am saying is that the major bug here is that ext3 Oopses the kernel when
it gets I/O errors because of faulty harddisk during recovery, not that LVM
forgot to set the ro_bits just like the floppy disk when it's read only and
the floppy disk case is likely to be unfixable infact. I can't see any
bug in LVM that could explain an Oops.

>the reiserfs people do the same?

About reiserfs I don't know what it does but I guess it does the same.

Chris, could you try to mount reiserfs in readonly mode on a snapshot
blockdevice and see what happens?

Andrea
