Message-ID: <3800FBAE.A74F9163@msede.com>
Date: Sun, 10 Oct 1999 22:48:46 +0200
From: Michael Marxmeier <mike@msede.com>
MIME-Version: 1.0
Subject: Re: [linux-lvm] Can't see /dev/hdk1
References: <Pine.WNT.4.05.9910081501230.-171375@socks.egs.uct.ac.za>
Content-Transfer-Encoding: 7bit
Sender: owner-linux-lvm
Errors-To: owner-linux-lvm
List-Id: <linux-lvm.redhat.com>
Content-Type: text/plain; charset="us-ascii"
To: Bruce Hewitson <hewitson@egs.uct.ac.za>
Cc: Heinz Mauelshagen <mge@ez-darmstadt.telekom.de>, linux-lvm@msede.com

Hi Bruce.

> There is no physical hdj* device, as I have kept the disks to one per IDE
> channel.  (By the way, if it helps, all drives work fine as stand alone
> ext2fs devices, and under md raid).

And that triggers a bug in pv_read_all_pv(). To opmize scan time for 
the cluttered /dev directory, pv_read_all_pv() tries to skip all
partitions for devices which don't exist.
Hover it's done in a wrong way ...

As a quick fix, have a look at lib/pv_read_all_pv.c and
modify it as below. The current code tries to skip partitions
if the device does not exist. However it blindly skips over the
next 15 devices it has found in /dev.

The code should look like:

         if ( ( tst = open ( dev_name, O_RDONLY)) == -1) {
            continue;
#if 0
            if ( MAJOR ( dir_cache[n].st_rdev) != MD_MAJOR &&
                 MINOR ( dir_cache[n].st_rdev) % 16 == 0) {
               n += 15;
               continue;
            }
#endif
         } else close ( tst);

Does this fix your problem?

The correct solution would be to order the dir_cache in major/minor
order and skip based on major/minor.


Hope this helps
Michael

-- 
Michael Marxmeier           Marxmeier Software AG
E-Mail: mike@msede.com      Besenbruchstrasse 9
Phone : +49 202 2431440     42285 Wuppertal, Germany
Fax   : +49 202 2431420     http://www.msede.com/
