Message-ID: <2D4B6CD74137D4119A1100104BC6BCBF0BC585C9@dubntex006.qwest.net>
From: "Montgomery, Kendal L" <kendal.montgomery@qwest.com>
Subject: RE: [linux-lvm] determining lv from mount point
MIME-Version: 1.0
Sender: linux-lvm-admin@sistina.com
Errors-To: linux-lvm-admin@sistina.com
Reply-To: linux-lvm@sistina.com
List-Help: <mailto:linux-lvm-request@sistina.com?subject=help>
List-Post: <mailto:linux-lvm@sistina.com>
List-Subscribe: <http://lists.sistina.com/mailman/listinfo/linux-lvm>,
	<mailto:linux-lvm-request@sistina.com?subject=subscribe>
List-Unsubscribe: <http://lists.sistina.com/mailman/listinfo/linux-lvm>,
	<mailto:linux-lvm-request@sistina.com?subject=unsubscribe>
List-Archive: <http://lists.sistina.com/pipermail/linux-lvm/>
Date: Tue Sep 23 15:22:02 2003
List-Id: <linux-lvm.redhat.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: "'linux-lvm@sistina.com'" <linux-lvm@sistina.com>

The df command will already do that.  For instance, on my machine, if I do:

[klmontg@klmontg klmontg]$ df /opt
Filesystem           1K-blocks      Used Available Use% Mounted on
/dev/vg01/opt          4194172   1610880   2583292  39% /opt

It gives me the filesystem, etc.

So, you could do something like this:

#!/bin/bash

if [[ ! -d ${1} ]]
then
  echo "error: ${1} is not a valid mount point"
  exit 1
fi

df ${1} | grep -v ^Filesystem | awk '{ print $1 }'

Kendal.

-----Original Message-----
From: Galen Seitz [mailto:galens@seitzassoc.com] 
Sent: Tuesday, September 23, 2003 3:28 PM
To: linux-lvm@sistina.com
Subject: [linux-lvm] determining lv from mount point



I'm trying to update my backup script (a tweaked version of hostdump.sh from
backupcentral.com) to use snapshots.  My machine has a mix of 
normal ext3 and ext3 on lvm filesystems.  What I'm looking for is an easy
way from a shell script to determine the lv from the mount point. The ideal
thing would be a shell function that takes the mount point as an argument
and returns the associated logical volume, or an error if the filesystem
doesn't use lvm.

Suggestions?

thanks,
galen

_______________________________________________
linux-lvm mailing list
linux-lvm@sistina.com http://lists.sistina.com/mailman/listinfo/linux-lvm
read the LVM HOW-TO at http://tldp.org/HOWTO/LVM-HOWTO/
