Message-ID: <3F5522A7.5030900@phys.unsw.edu.au>
From: Melinda Taylor <melinda@phys.unsw.edu.au>
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Subject: [linux-lvm] Remove VOlume group that doesn't exist
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
Date: Tue Sep  2 18:09:01 2003
List-Id: <linux-lvm.redhat.com>
Content-Type: text/plain; charset="us-ascii"; format="flowed"
To: linux-lvm@sistina.com

Hello,

After my couple of disks died I have been left with one working volume 
group vg02 and
one non-existant volume group vg01 which I would like to remove.
Since /dev/sdd2 and /dev/sde2 no longer exist I am unable to remove the 
volume group with the usual method:

/sbin/vgremove vg01
VG data differs between PVs /dev/sdd2 and /dev/sde2
Volume group "vg01" doesn't exist


Actually /dev/sdd2 does still exist as a normal formatted linux partition
so I don't want to damage that while trying to remove my volume group.

How do I tell lvm that vg01 no longer exists? It is not in lvmtab so I 
am unsure where it store this info.


Many Thanks,

melinda
