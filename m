Message-ID: <3E242AEA.5050407@inrialpes.fr>
From: Frederic Tronel <Frederic.Tronel@inrialpes.fr>
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Subject: [linux-lvm] How to reduce a physical volume in a volume group.
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
Date: Tue Jan 14 09:20:02 2003
List-Id: <linux-lvm.redhat.com>
Content-Type: text/plain; charset="us-ascii"; format="flowed"
To: linux-lvm@sistina.com

Hi list,


I have the following problem.
During the setup of a Linux box (Debian testing) I created
two partitions /dev/sda1 mounted on /boot (ext2) and
/dev/sda2 (Linux LVM). I have created all my logical volumes
in a single volume group that only contains the pv /dev/sda2.
Now I need to install FreeBSD. I would like to split /dev/sda2
into /dev/sda2 and /dev/sda3 that will contain a regular FreeBSD
FFS.

A pvdisplay on /dev/sda2 indicates that I have plenty of room located
at the end of /dev/sda2 (free physical extends).
However I did not find any indication on how to perform this operation
neither in the HOWTO, nor on the mailing-list.

I can create a bootable CD with all the necessary utilities to perform 
the job, since I imagine it cannot be performed on active vg.


Cheers,

Frederic.
