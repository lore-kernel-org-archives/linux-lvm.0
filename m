Date: Mon, 2 Aug 1999 20:21:06 +0100 (IST)
From: Paul Jakma <paul@clubi.ie>
Subject: Re: [linux-lvm] RAID and LVM?
In-Reply-To: <Pine.LNX.4.10.9908021419460.1912-100000@fuse.aethos.co.uk>
Message-ID: <Pine.LNX.4.10.9908021532440.960-100000@hibernia.spin.ie>
MIME-Version: 1.0
Sender: owner-linux-lvm
Errors-To: owner-linux-lvm
List-Id: <linux-lvm.redhat.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: James Pattinson <jamesp@aethos.co.uk>
Cc: linux-lvm@msede.com

On Mon, 2 Aug 1999, James Pattinson wrote:

  Cheers - I'll try that later on.
  
  Does anyone have a such thing as a patch against 2.2.10 which includes LVM
  and RAID0145? It's just I feel a lot happier running 2.2.10, rather than

i have 2.2.11pre4, with raid0145-19990724, lvm and devfs (plus some
more stuff aswell). Both raid and lvm work, but not on top of each
other, at least not for raid5 anyway. (luca has reported success with
lvm on raid1 or raid0 i believe).

if you want i'll do a diff against plain 2.2.11pre4 if you want.

  PS - I tried devfs on -ac12 last week as well, impressive, but I couldn't
  seem to use my SCSI cdrom drive anymore, no such thing as /dev/scd or even
  /dev/*cd* exists! Also, I had to `modprobe loop` before I could access
  /dev/loop*.
  
that's cause it'd be under /dev/sr/ now. :) incidentally are you sure
you had a /dev/scd?? scsi cdrom's are usually /dev/sr<something>.
ATAPI cdrom's would appear under ide/cd/.

regards,
-- 
Paul Jakma
paul@clubi.ie	http://hibernia.clubi.ie
PGP5 key: http://www.clubi.ie/jakma/publickey.txt
-------------------------------------------
Fortune:
There are only two things in this world that I am sure of, death and
taxes, and we just might do something about death one of these days.
		-- shades
