From: Melinda Taylor <melinda@phys.unsw.edu.au>
Message-ID: <Pine.OSF.4.33.0207231638100.7125-100000@newt.phys.unsw.edu.au>
MIME-Version: 1.0
Subject: [linux-lvm] LVM newbie question.
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
Date: Tue Jul 23 01:49:01 2002
List-Id: <linux-lvm.redhat.com>
Content-Type: TEXT/PLAIN; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: linux-lvm@sistina.com

Hello :)

I am about to setup LVM for the first time on a new server I have just
installed redhat on. And I have a few questions.

When I do a pvcreate on say /dev/sda1 does that destroy all the existing
data on that partition?

Which is better for pvcreate to be used on a whole disk (pvcreate
/dev/sda) and destroy all the underlying data or for me to merge all my
existing paritions over to PV to combine in a volume group? Is there any
advantage over either?

I've read the LVM how-to and am stilll alittle confused having never done
it in practice. One part of the how-to said converting a root system to
LVM is not recommended. SHould your OS directories /var / /boot
etc all not be included in the LVM? That was the main idea behind me
implementing LVM so that specific partitions (say var) could be resized at
a later date if needed.

Will I have any trouble restoring my system (which I backed up using dd
with a BS of 1024k) Do I have to make the LV the same size as my original
partition were for this to work?

Many Thanks for any help. I am just a bit confused as to where to step to
start.

Thanks,

melinda
