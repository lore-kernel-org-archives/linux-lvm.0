Message-ID: <3E1CB9E4.1030704@email.arizona.edu>
From: Gary Windham <windhamg@email.arizona.edu>
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Subject: [linux-lvm] LVM2 snapshot creation problem
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
Date: Wed Jan  8 17:48:02 2003
List-Id: <linux-lvm.redhat.com>
Content-Type: text/plain; charset="us-ascii"; format="flowed"
To: linux-lvm@sistina.com

I am testing LVM2 under the 2.4.20 (vanilla) kernel running on RedHat 
8.0.  I'm Using device-mapper0.96.07 and the userspace tools 
LVM2.1.95.13 packages.  I applied the device-mapper kernel patches 
located at 
http://people.sistina.com/~thornber/patches/2.4-stable/2.4.20/2.4.20-dm-2.tar.bz2.

My problem is that I have not been able to create LV snapshots under 
LVM2.  Here's an example (command and output follow):

===
# /lvm2/sbin/lvcreate -s -L 20g -n snap -v mytestvg/testlv

     Setting chunksize to 16 sectors.
     Finding volume group "mytestvg"
     Creating logical volume snap
     Archiving volume group "mytestvg" metadata.
     Found volume group "mytestvg"
     Loading mytestvg-snap
     Found volume group "mytestvg"
     Zeroing start of logical volume "snap"
     Found volume group "mytestvg"
     Removing mytestvg-snap
     Found volume group "mytestvg"
     Found volume group "mytestvg"
     Found volume group "mytestvg"
     Loading mytestvg-testlv-real
     Loading mytestvg-testlv
     Loading mytestvg-snap-cow
     Loading mytestvg-snap
   device-mapper ioctl cmd 2 failed: Invalid argument
   Couldn't load device 'mytestvg-snap'.
     Creating volume group backup "/etc/lvm/backup/mytestvg"
   Logical volume "snap" created
===

The logical volume is then in an "INACTIVE destination" for my original 
LV, and cannot be activated.  All I can do is "lvremove" it.

Any advice would be most appreciated!

Thanks,
--Gary
-- 
Gary Windham
Systems Programmer, Principal
The University of Arizona, CCIT
