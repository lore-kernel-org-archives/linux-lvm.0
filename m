Date: Wed, 8 Nov 2000 18:04:03 +0100
From: Andrea Arcangeli <andrea@suse.de>
Subject: [linux-lvm] Re: LVM 2.2 snapshot bug
Message-ID: <20001108180403.E3650@inspiron.suse.de>
References: <20001108173113.B3650@inspiron.suse.de> <898720000.973701988@coffee>
Mime-Version: 1.0
Content-Disposition: inline
In-Reply-To: <898720000.973701988@coffee>; from mason@suse.com on Wed, Nov 08, 2000 at 11:46:28AM -0500
Sender: owner-linux-lvm
Errors-To: owner-linux-lvm
List-Id: <linux-lvm.redhat.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Chris Mason <mason@suse.com>
Cc: Rik van Riel <riel@conectiva.com.br>, linux-lvm@msede.com, marcelo@conectiva.com.br, "Stephen C. Tweedie" <sct@redhat.com>

On Wed, Nov 08, 2000 at 11:46:28AM -0500, Chris Mason wrote:
> But, if is_read_only(dev) returns 0,[..]

That is the case for a read only floppy disk and for a LVM snapshot but
in reality both generates I/O errors after calling ll_rw_block(WRITE)
because in reality they are both read only.

> [..] reiserfs tries to update the journal
> header block on mount. [..]

So it does the same thing of ext3, I remeber we also discussed that design
decision in the past and I remeber there are good reasons for that.

> Heinz and found the bug where is_read_only returns 0 for the snapshot

Oh, I didn't know you were just aware of it.

> volume while we were working on the snapshot api for journaled filesystems,
> so this code got a lot of testing.

Ok.

Andrea
