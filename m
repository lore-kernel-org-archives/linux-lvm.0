Message-ID: <38F371A9.E4639CC5@msede.com>
Date: Tue, 11 Apr 2000 20:40:41 +0200
From: Michael Marxmeier <mike@msede.com>
MIME-Version: 1.0
Subject: [linux-lvm] LVM, hardware raid and stride...
Content-Transfer-Encoding: 7bit
Sender: owner-linux-lvm
Errors-To: owner-linux-lvm
List-Id: <linux-lvm.redhat.com>
Content-Type: text/plain; charset="us-ascii"
To: linux-lvm@msede.com

Forwarded message from Wesley Darlington (wesley@blackstar.co.uk) ...

-------- Original Message --------
Date: Tue, 11 Apr 2000 15:50:00 +0100
From: Wesley Darlington <wesley@blackstar.co.uk>
Subject: LVM, hardware raid and stride...
Message-ID: <20000411155000.A3774@tux.blackstar.co.uk>

Hi folks,

When creating ext2 filesystems upon hardware raid arrays, it is
traditional
to pass the "stride" parameter to mke2fs so that it can magically
optimise 
the filesystem layout for the array's chunksize/stridesize.

How, if at all, does lvm interfere with this magic? Can any lvm
parameters
be tuned to take advantage of arrays?

Thanks,
Wesley.
