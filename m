Message-ID: 
     <1229.68.146.150.149.1059231897.squirrel@webmail.levelonehosting.net>
From: "Tyler" <tyler@tylercentral.com>
MIME-Version: 1.0
Subject: [linux-lvm] Can't Create LV
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
Date: Sat Jul 26 10:05:01 2003
List-Id: <linux-lvm.redhat.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: linux-lvm@sistina.com

Hi All,

I'm a newbie to LVM so please bear with me.

I've created 2 LVM's before, but am stuck on the 3rd one.  I'm trying to
create a striped volume with 2 IDE disks.  I've created the VG, but the LV
wont go.

--- Volume group ---
VG Name               storage
VG Access             read/write
VG Status             available/resizable
VG #                  1
MAX LV                256
Cur LV                0
Open LV               0
MAX LV Size           2 TB
Max PV                256
Cur PV                2
Act PV                2
VG Size               111.72 GB
PE Size               32 MB
Total PE              3575
Alloc PE / Size       0 / 0
Free  PE / Size       3575 / 111.72 GB
VG UUID               LYZMgA-IqDg-aJ9K-wFRY-80Uv-TUFQ-KFxgkb

(/)# lvcreate -i2 -I4 -l3575 -nvolume1 storage
lvcreate -- rounding to stripe boundary size
lvcreate -- only 3575 free physical extents in volume group "storage"

I've also tried.

(/)# lvcreate -i2 -I4 -L111G -nvolume1 storage
lvcreate -- not enough allocatable/free physical volume space in "storage"
lvcreate -- please check, if physical volumes are allocatable

With no luck.

How can I create an LV that fills the entire VG?

Tyler
