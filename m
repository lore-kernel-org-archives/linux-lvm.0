From: pbmonday@imation.com
Message-ID: <OF290F58B3.93D6CDEA-ON86256996.007579D7@imation.com>
Subject: [linux-lvm] network block device support in LVM
Date: Thu, 16 Nov 2000 09:05:01 -0600
MIME-Version: 1.0
Sender: owner-linux-lvm
Errors-To: owner-linux-lvm
List-Id: <linux-lvm.redhat.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: linux-lvm@msede.com

Hi There,

A while back (about 2 weeks) I mentioned (indirectly) that I couldn't get
network block devices working with the LVM.  Heinz mentioned that there
were fixes available, these didn't seem to fix my problem.  After digging a
bit more I discovered that although there was support for the NBD (assuming
I set NBD_MAJORS), the lvm_dir_cache function would not go beyond the
/proc/partitions data.

The logic in lvm_dir_cache (in my version at least) goes:

if ( dir_cache == NULL) {
     if ( ( proc = fopen ("/proc/partions") .... ) {
          // add partitions which subsequently increases cache_size
                }
                if (!cache_size) {
                    // add other devices
     }
}

So, my NBDs were never being added because my /proc/partions added 8 items
to the cache.

I removed the if(!cache_size) by changing it to if(1) and lvmdiskscan and
pvcreate now work, sort of, for NBD...though I haven't pushed it far.

There is one odd result, with the enhanced network block device support,
each entry is actually represented by several /dev entries, I think to
allow for alternate pipes.  So when I assign /dev/nda, it actually uses
/dev/nda and /dev/ndaX where X is 0 to 15.  So, lvmdiskscan reports
incorrectly.

Anyway, my pvcreate works now so I can go on testing.  My questions are, is
the cache_size problem a bug or is something funky on my system?  And, of
course, if it is a bug, could it be fixed up?

Thank you,
Paul Monday
pbmonday@imation.com
