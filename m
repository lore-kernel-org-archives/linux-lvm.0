From: Bradley M Alexander <storm@tux.org>
Message-ID: <20011122231706.M5393@sonsofthunder.yi.org>
Mime-Version: 1.0
Content-Disposition: inline
Subject: [linux-lvm] LVM performance
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
Date: Thu Nov 22 22:15:02 2001
List-Id: <linux-lvm.redhat.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: linux-lvm@sistina.com

Hi all,

All right. I've got LVM installed and running on 2 30GB IDE drives, a VG on
each, and the partitions divided just about evenly between them. This is on
a 1GHz Athlon with 640MB of RAM. I am running Debian/sid with lvm 1.0.1rc4
and kernel 2.4.13.

A few things I have noticed in the week or so that I have been using LVM.
First, the drive activity light stays lit all the time. I'm not terribly
worried about it, since things seem to be behaving normally, but I figured
I would ask.

The second, and far more disturbing thing is that any heavy accesses to the
filesystem (copying large files, scp-ing files mastering CDs, anything with
a lot of IO brings my machine to its knees. Case in point. When I started
this message, I was mastering a CD using xcdroast, which had called
mkisofs. Not only did the mastering take (I'm guessing here, since I didn't
note the time) about 10 minutes, the load average jumped, at one point, to
8.23, and generally hovered around the 6-to-7 range. Copying large files
from filesystem to filesystem on the machine yields similar results.
Originally, I had the following configuration:

hda 30GB HD
hdb 30GB HD
hdc DVD-ROM
hdd CD-RW

A friend suggested moving the HD on hdb to the other channel, so now the
drives are on hda and hdc, the dvd is on hdb and the cdrw is on hdd.

Can anyone give me any ideas as to why the machine gets beaten about so
much during IO operations and more importantly how can I minimize the
impact. 

Regards,
-- 
--Brad
============================================================================
Bradley M. Alexander, CISSP              |   Co-Chairman,
Beowulf System Admin/Security Specialist |    NoVALUG/DCLUG Security SIG
Debian/GNU Linux Developer		 |   storm@debian.org
                                         |   storm@tux.org
============================================================================
Never sign a contract which contains the phrases "sort of," "kind of," or
"and stuff."
