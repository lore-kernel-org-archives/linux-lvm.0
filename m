From: Frode Ulsund <frode@gangstah.net>
MIME-Version: 1.0
Message-Id: <01111722421300.10008@nerds>
Content-Transfer-Encoding: 8bit
Subject: [linux-lvm] Not able to format logical volume
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
Date: Fri Nov 16 15:40:02 2001
List-Id: <linux-lvm.redhat.com>
Content-Type: text/plain; charset="us-ascii"
To: linux-lvm@sistina.com

Hi.

I have added five ide-drives to my volume group. 5 x 80 gb.
I have created the VG with PE size 8 mb witch gives me a max
logical volume size 512 gb.

My first problem starts when i try to use the whole volume group size
as one logical volume. I got 364 gb free, but i can't use more PEs than
320 gb in one LV. Rest of the space is just unusable unallcated space. I 
don't understand this.

So i created a 5 disks striped logical volume 
(lvcreate -i5 -I4 -L320G -nlv01 vg01 /dev/hda5 /dev/hde1 /dev/hdf1 /dev/hdg1 
/dev/hdh1)

The logical volume looks nice with lvdisplay but when i try to put a 
filesystem on the device my computer hangs in the start of the process.
Any ideas what I might have done wrong?

---
Frode Ulsund
