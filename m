Subject: Re: [linux-lvm] 33% of my space is missing?
Message-ID: <OF3246CEC7.7F5BD99E-ON85256AC6.0071033C@raleigh.ibm.com>
From: "Kevin M Corry" <corryk@us.ibm.com>
Date: Thu, 13 Sep 2001 15:40:07 -0500
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
List-Id: <linux-lvm.redhat.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: linux-lvm@sistina.com

Hi Mike,

As I recall from your previous emails, you added a few of these
drives below as new PVs to your VG. You now need to do an
lvextend on the existing logical volume to make use of this
additional space in the volume group. AFTER the lvextend, you
will need to expand the filesystem so it makes use of the
new space as well. If you are using ext2 (I can't remember
if you are using Reiser), then there is an LVM tool (e2fsadm)
which should do both the lvextend and the fs extend. If you
are using Reiser or XFS, they will have their own tools for
doing the fs extend.

The other option is to create a second logical volume in that
group, with a new filesystem. If you need a single filesystem
for all that space, then you will need the procedure above.

-Kevin


----------------------------------
Hi all.

I seem to be missing 100Gb out of a possible 300Gb!  Check it out:

[root@filmore jdiehl]# fdisk -l | grep LVM
/dev/sdb5           226      4402  33551721   8e  Linux LVM
/dev/sdb6          4403      8579  33551721   8e  Linux LVM
/dev/sdb7          8580     12756  33551721   8e  Linux LVM
/dev/sdb8         12757     15030  18265873+  8e  Linux LVM
/dev/sdc6          7015     14028  56339923+  8e  Linux LVM
/dev/sdc7         14029     21042  56339923+  8e  Linux LVM
/dev/sdc8         21043     28056  56339923+  8e  Linux LVM
/dev/sdc9         28057     30945  23205861   8e  Linux LVM
[root@filmore jdiehl]#

Adding this space up, I get 311Gb.

But:

[root@filmore jdiehl]# lvdisplay /dev/Database2/data
--- Logical volume ---
LV Name                /dev/Database2/data
VG Name                Database2
LV Write Access        read/write
LV Status              available
LV #                   1
# open                 1
LV Size                215.3 GB
Current LE             27558
Allocated LE           27558
Allocation             next free
Read ahead sectors     120
Block device           58:0

Here we see that I only have access to 215Gb.

Where is the rest of my space?

Mike Diehl.


_______________________________________________
linux-lvm mailing list
linux-lvm@sistina.com
http://lists.sistina.com/mailman/listinfo/linux-lvm
read the LVM HOW-TO at http://www.sistina.com/lvm/Pages/howto.html
