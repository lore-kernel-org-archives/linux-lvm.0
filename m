Date: Tue, 3 Aug 1999 21:24:46 +0100 (IST)
From: Paul Jakma <paul@clubi.ie>
Subject: Re: [linux-lvm] RAID and LVM?
In-Reply-To: <852567BA.0076DBF1.00@USCOMM02.aholdusa.com>
Message-ID: <Pine.LNX.4.10.9908032111350.2456-100000@hibernia.spin.ie>
MIME-Version: 1.0
Sender: owner-linux-lvm
Errors-To: owner-linux-lvm
List-Id: <linux-lvm.redhat.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: David Venus <dvenus@aholdusa.com>
Cc: Linux LVM list <linux-lvm@msede.com>

On Mon, 26 Jul 1999, David Venus wrote:
  
  Hi!
  
  I am guessing the difference is that one accesses the
  drive/device in block mode (bh_dev) and the other as a
  character/raw device (bh_rdev).

i'm not much of a kernel hacker, but i think b_dev/r_dev is
device/real device... ie md0/sda3 type of thing. but i'm not sure.

what i'd like to know is: if i'm right, why does lvm want to make
bh->b_dev=bh->b_rdev?? .. i don't know. it means if lvm tries to read
from mdx, then the md code is invoked with hd<something> instead of
md.. which fails miserably of course...

i left this hack out, and the kernel booted. RAID worked, LVM worked
on normal devices.. but the LVM tools gave errors when i tried to
build VLM ontop of a RAID device (ingo's latest raid that is).
  
The reason for the device remap is something to do with the original
md code, but i don't know why. Ingo's new RAID code should be pretty
transparent and hence LVM shouldn't need to do low-level fiddling
around in ll_rw_blk. an mdx device is afaik pretty much the same as
an hdax device.. (right?)

regards,
-- 
Paul Jakma
paul@clubi.ie	http://hibernia.clubi.ie
PGP5 key: http://www.clubi.ie/jakma/publickey.txt
-------------------------------------------
Fortune:
Now and then an innocent man is sent to the legislature.
