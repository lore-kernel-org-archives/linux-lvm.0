From: Andreas Dilger <adilger@enel.ucalgary.ca>
Message-Id: <199903102259.PAA01316@munet-d.enel.ucalgary.ca>
Subject: [linux-lvm] Patches to 0.5
Date: Wed, 10 Mar 1999 15:59:57 -0700 (MST)
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Sender: owner-linux-lvm
Errors-To: owner-linux-lvm
List-Id: <linux-lvm.redhat.com>
Content-Type: text/plain; charset="us-ascii"
To: LVM on Linux <linux-lvm@msede.com>

I've uploaded a couple of small patches to the incoming directory at
msede.

The file lvm-0.5aed.diff has a couple of cosmetic fixes plus
a major fix to tools/lib/pv_move.c to change the LE sorting because
it was pretty inefficient, so I benchmarked an improved bubble sort,
insertion sort, and libc5 quicksort.  The insertion sort won most
of the time (using data from 6 AIX disks on a real system), but as
expected qsort won on disks with many LVs.  I looked at the glibc
qsort code, and it should beat everything, but the insertion sort code
is still there (#ifdefed out)...  I also changed the way
pe_src was allocated to avoid hundreds of small malloc() calls.  In
addition, some minor changes to the LVM_TO_* macros to reduce the
number of multiplies done.

The file lvm.c.diff changes the internal lvm_strcmp() type functions
to be lvm_strncmp(), to avoid the chance of buffer overflow when
doing a copy.  Not that I had any such problems, but with kernel code,
it is best to be sure.

I also have some patches in the works to allow reading both v1 and v2
structs from disk, but until 0.6 was released there was not much need
for this, but I will try to get them out.

Cheers, Andreas
-- 
Andreas Dilger   University of Calgary  \"If a man ate a pound of pasta and
                 Micronet Research Group \ a pound of antipasto, would they
Dept of Electrical & Computer Engineering \   cancel out, leaving him still
http://www-mddsp.enel.ucalgary.ca/People/adilger/       hungry?" -- Dogbert
