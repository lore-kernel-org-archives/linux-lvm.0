Message-ID: <001401c3214b$89789230$6c7745cb@codevel>
From: "armani" <armani@codevel.com>
References: <OF3FA18EC2.6DB9EC24-ONC1256D2F.00199A52@phoenixcontact.com> <1053696372.1216.92.camel@prvpcompq249.css.twable.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Subject: [linux-lvm] Can't make an on-line snapshot with LVM !
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
Date: Fri May 23 11:50:02 2003
List-Id: <linux-lvm.redhat.com>
Content-Type: text/plain; charset="us-ascii"
To: linux-lvm@sistina.com

Dear Sir

I don't know that if this is a FAQ.
But when I create a snapshot for my LV2

# lvcreate -L1M -s -nsnapshot1 /dev/VG1/LV2
lvcreate -- rounding size up to physical extent boundary
lvcreate -- WARNING: the snapshot will be automatically disabled once it
gets full
lvcreate -- INFO: using default snapshot chunk size of 64 KB for
"/dev/VG1/snapshot1"
lvcreate -- doing automatic backup of "VG1"
lvcreate -- logical volume "/dev/VG1/snapshot1" successfully created

This will create a /dev/VG1/snapshot1 for me.

But I can't mount it with the following command:
# mount /dev/VG1/snapshot1 /mnt
when I still mount  /dev/VG1/LV2 on my /var1 mount point.

After umount /var1
# umount /var1

Then redo the command
# lvcreate -L1M -s -nsnapshot2 /dev/VG1/LV2

This will be ok ..

What's wrong with the snapshot ?
