From: Marek Jan <xjan@informatics.muni.cz>
Message-ID: <Pine.LNX.4.44.0401091500050.29504-100000@nymfe07.fi.muni.cz>
MIME-Version: 1.0
Subject: [linux-lvm] problem with pvcreate
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
Date: Fri Jan  9 09:53:01 2004
List-Id: <linux-lvm.redhat.com>
Content-Type: TEXT/PLAIN; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: linux-lvm@sistina.com

Hi,
I want run LVM with 3 devices, one is lokal disk part. an other two are 
/dev/nda and /dev/ndb, block device created with enbd.y
I have problem with pvcreat on disk part. /dev/hda3. Typo of /dev/hda3 is 
0x8e (Linux LVM). When I run pvcreate, it looks ok:

# pvcreate -v /dev/hda3
pvcreate -- locking logical volume manager
pvcreate -- checking physical volume name "/dev/hda3"
pvcreate -- getting physical volume size
pvcreate -- checking maximum physical volume size
pvcreate -- checking partition type
pvcreate -- creating new physical volume
pvcreate -- setting up physical volume for /dev/hda3 with 148531824 
sectors
pvcreate -- writing physical volume data to disk "/dev/hda3"
pvcreate -- physical volume "/dev/hda3" successfully created
pvcreate -- unlocking logical volume manager

Now, I want pvdisplay:

# pvdisplay /dev/hda3
pvdisplay -- ERROR "pv_read(): pv_create_name_from_kdev_t" no VALID 
physical volume "/dev/hda3"

Everyone know where the problem is ?

Thank a lot, Marek Jan

PS sorry, my english is really bad :-)
