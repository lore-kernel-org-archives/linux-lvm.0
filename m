MIME-Version: 1.0
Message-Id: <OF5335B286.82ADE051-ONC1256B41.004E7A11@hpigmbh.com>
From: "Matthias Stoll" <Matthias.Stoll@eu.icgcommerce.com>
Content-Type: multipart/alternative;
    boundary="=_alternative 004ED567C1256B41_="
Subject: [linux-lvm] lvm problem
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
Date: Mon Jan 14 08:22:02 2002
List-Id: <linux-lvm.redhat.com>
To: linux-lvm@sistina.com

This is a multipart message in MIME format.
--=_alternative 004ED567C1256B41_=
Content-Type: text/plain; charset="us-ascii"

Hi !

I'm not so firm in linux but:

We had a LG "smbdata" which went away somehow? ;-)

Searched all threads and followed your instructions on recovering 
configuration of LV. Didn't work ;-(

Here is the output of vgcfgrestore -ll -f /etc/lvmconf/smbdata.conf.7.old 
-n smbdata /dev/sda

--- Volume group ---
VG Name               smbdata
VG Access             read/write
VG Status             NOT available/resizable
VG #                  0
MAX LV                256
Cur LV                1
Open LV               0
MAX LV Size           255.99 GB
Max PV                256
Cur PV                4
Act PV                4
VG Size               15.86 GB
PE Size               4 MB
Total PE              4060
Alloc PE / Size       4060 / 15.86 GB
Free  PE / Size       0 / 0
VG UUID               zwceZi-TCXm-Ew3a-A5yc-H49M-R1NP-y4qg4T

--- Logical volume ---
LV Name                /dev/smbdata/all
VG Name                smbdata
LV Write Access        read/write
LV Status              available
LV #                   1
# open                 0
LV Size                15.86 GB
Current LE             4060
Allocated LE           4060
Allocation             next free
Read ahead sectors     120
Block device           58:0


--- Physical volume ---
PV Name               /dev/sda1
VG Name               smbdata
PV Size               3.97 GB / NOT usable 3.28 MB [LVM: 124 KB]
PV#                   1
PV Status             NOT available
Allocatable           yes (but full)
Cur LV                1
PE Size (KByte)       4096
Total PE              1015
Free PE               0
Allocated PE          1015
PV UUID               tFA0qy-8u7r-8oBv-MwYS-SUVM-1W7h-P3hHED

--- Physical volume ---
PV Name               /dev/sdb1
VG Name               smbdata
PV Size               3.97 GB / NOT usable 3.28 MB [LVM: 124 KB]
PV#                   2
PV Status             NOT available
Allocatable           yes (but full)
Cur LV                1
PE Size (KByte)       4096
Total PE              1015
Free PE               0
Allocated PE          1015
PV UUID               cVeBuv-1i2C-hkOO-mUA1-lNrj-Vh8l-vrr6Am

--- Physical volume ---
PV Name               /dev/sdc1
VG Name               smbdata
PV Size               3.97 GB / NOT usable 3.28 MB [LVM: 124 KB]
PV#                   3
PV Status             NOT available
Allocatable           yes (but full)
Cur LV                1
PE Size (KByte)       4096
Total PE              1015
Free PE               0
Allocated PE          1015
PV UUID               Rtuhx3-0HR9-V0hN-iLuZ-dkFL-hyih-cEwEII

--- Physical volume ---
PV Name               /dev/sdd1
VG Name               smbdata
PV Size               3.97 GB / NOT usable 3.28 MB [LVM: 124 KB]
PV#                   4
PV Status             NOT available
Allocatable           yes (but full)
Cur LV                1
PE Size (KByte)       4096
Total PE              1015
Free PE               0
Allocated PE          1015
PV UUID               HNkTzu-Ok46-4vqM-CJCu-Iqd1-JmQ4-c5yzea


Could anyone provide me some help?

Thanx

Matthias
--=_alternative 004ED567C1256B41_=
Content-Type: text/html; charset="us-ascii"


<br><font size=2 face="sans-serif">Hi !</font>
<br>
<br><font size=2 face="sans-serif">I'm not so firm in linux but:</font>
<br>
<br><font size=2 face="sans-serif">We had a LG &quot;smbdata&quot; which went away somehow? ;-)</font>
<br>
<br><font size=2 face="sans-serif">Searched all threads and followed your instructions on recovering configuration of LV. Didn't work ;-(</font>
<br>
<br><font size=2 face="sans-serif">Here is the output of vgcfgrestore -ll -f /etc/lvmconf/smbdata.conf.7.old -n smbdata /dev/sda</font>
<br>
<br><font size=2 face="Courier New">--- Volume group ---</font>
<br><font size=2 face="Courier New">VG Name &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; smbdata</font>
<br><font size=2 face="Courier New">VG Access &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; read/write</font>
<br><font size=2 face="Courier New">VG Status &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; NOT available/resizable</font>
<br><font size=2 face="Courier New">VG # &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;0</font>
<br><font size=2 face="Courier New">MAX LV &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;256</font>
<br><font size=2 face="Courier New">Cur LV &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;1</font>
<br><font size=2 face="Courier New">Open LV &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; 0</font>
<br><font size=2 face="Courier New">MAX LV Size &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; 255.99 GB</font>
<br><font size=2 face="Courier New">Max PV &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;256</font>
<br><font size=2 face="Courier New">Cur PV &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;4</font>
<br><font size=2 face="Courier New">Act PV &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;4</font>
<br><font size=2 face="Courier New">VG Size &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; 15.86 GB</font>
<br><font size=2 face="Courier New">PE Size &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; 4 MB</font>
<br><font size=2 face="Courier New">Total PE &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;4060</font>
<br><font size=2 face="Courier New">Alloc PE / Size &nbsp; &nbsp; &nbsp; 4060 / 15.86 GB</font>
<br><font size=2 face="Courier New">Free &nbsp;PE / Size &nbsp; &nbsp; &nbsp; 0 / 0</font>
<br><font size=2 face="Courier New">VG UUID &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; zwceZi-TCXm-Ew3a-A5yc-H49M-R1NP-y4qg4T</font>
<br>
<br><font size=2 face="Courier New">--- Logical volume ---</font>
<br><font size=2 face="Courier New">LV Name &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;/dev/smbdata/all</font>
<br><font size=2 face="Courier New">VG Name &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;smbdata</font>
<br><font size=2 face="Courier New">LV Write Access &nbsp; &nbsp; &nbsp; &nbsp;read/write</font>
<br><font size=2 face="Courier New">LV Status &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;available</font>
<br><font size=2 face="Courier New">LV # &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; 1</font>
<br><font size=2 face="Courier New"># open &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; 0</font>
<br><font size=2 face="Courier New">LV Size &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;15.86 GB</font>
<br><font size=2 face="Courier New">Current LE &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; 4060</font>
<br><font size=2 face="Courier New">Allocated LE &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; 4060</font>
<br><font size=2 face="Courier New">Allocation &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; next free</font>
<br><font size=2 face="Courier New">Read ahead sectors &nbsp; &nbsp; 120</font>
<br><font size=2 face="Courier New">Block device &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; 58:0</font>
<br>
<br>
<br><font size=2 face="Courier New">--- Physical volume ---</font>
<br><font size=2 face="Courier New">PV Name &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; /dev/sda1</font>
<br><font size=2 face="Courier New">VG Name &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; smbdata</font>
<br><font size=2 face="Courier New">PV Size &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; 3.97 GB / NOT usable 3.28 MB [LVM: 124 KB]</font>
<br><font size=2 face="Courier New">PV# &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; 1</font>
<br><font size=2 face="Courier New">PV Status &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; NOT available</font>
<br><font size=2 face="Courier New">Allocatable &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; yes (but full)</font>
<br><font size=2 face="Courier New">Cur LV &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;1</font>
<br><font size=2 face="Courier New">PE Size (KByte) &nbsp; &nbsp; &nbsp; 4096</font>
<br><font size=2 face="Courier New">Total PE &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;1015</font>
<br><font size=2 face="Courier New">Free PE &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; 0</font>
<br><font size=2 face="Courier New">Allocated PE &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;1015</font>
<br><font size=2 face="Courier New">PV UUID &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; tFA0qy-8u7r-8oBv-MwYS-SUVM-1W7h-P3hHED</font>
<br>
<br><font size=2 face="Courier New">--- Physical volume ---</font>
<br><font size=2 face="Courier New">PV Name &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; /dev/sdb1</font>
<br><font size=2 face="Courier New">VG Name &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; smbdata</font>
<br><font size=2 face="Courier New">PV Size &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; 3.97 GB / NOT usable 3.28 MB [LVM: 124 KB]</font>
<br><font size=2 face="Courier New">PV# &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; 2</font>
<br><font size=2 face="Courier New">PV Status &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; NOT available</font>
<br><font size=2 face="Courier New">Allocatable &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; yes (but full)</font>
<br><font size=2 face="Courier New">Cur LV &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;1</font>
<br><font size=2 face="Courier New">PE Size (KByte) &nbsp; &nbsp; &nbsp; 4096</font>
<br><font size=2 face="Courier New">Total PE &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;1015</font>
<br><font size=2 face="Courier New">Free PE &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; 0</font>
<br><font size=2 face="Courier New">Allocated PE &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;1015</font>
<br><font size=2 face="Courier New">PV UUID &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; cVeBuv-1i2C-hkOO-mUA1-lNrj-Vh8l-vrr6Am</font>
<br>
<br><font size=2 face="Courier New">--- Physical volume ---</font>
<br><font size=2 face="Courier New">PV Name &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; /dev/sdc1</font>
<br><font size=2 face="Courier New">VG Name &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; smbdata</font>
<br><font size=2 face="Courier New">PV Size &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; 3.97 GB / NOT usable 3.28 MB [LVM: 124 KB]</font>
<br><font size=2 face="Courier New">PV# &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; 3</font>
<br><font size=2 face="Courier New">PV Status &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; NOT available</font>
<br><font size=2 face="Courier New">Allocatable &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; yes (but full)</font>
<br><font size=2 face="Courier New">Cur LV &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;1</font>
<br><font size=2 face="Courier New">PE Size (KByte) &nbsp; &nbsp; &nbsp; 4096</font>
<br><font size=2 face="Courier New">Total PE &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;1015</font>
<br><font size=2 face="Courier New">Free PE &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; 0</font>
<br><font size=2 face="Courier New">Allocated PE &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;1015</font>
<br><font size=2 face="Courier New">PV UUID &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; Rtuhx3-0HR9-V0hN-iLuZ-dkFL-hyih-cEwEII</font>
<br>
<br><font size=2 face="Courier New">--- Physical volume ---</font>
<br><font size=2 face="Courier New">PV Name &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; /dev/sdd1</font>
<br><font size=2 face="Courier New">VG Name &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; smbdata</font>
<br><font size=2 face="Courier New">PV Size &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; 3.97 GB / NOT usable 3.28 MB [LVM: 124 KB]</font>
<br><font size=2 face="Courier New">PV# &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; 4</font>
<br><font size=2 face="Courier New">PV Status &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; NOT available</font>
<br><font size=2 face="Courier New">Allocatable &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; yes (but full)</font>
<br><font size=2 face="Courier New">Cur LV &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;1</font>
<br><font size=2 face="Courier New">PE Size (KByte) &nbsp; &nbsp; &nbsp; 4096</font>
<br><font size=2 face="Courier New">Total PE &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;1015</font>
<br><font size=2 face="Courier New">Free PE &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; 0</font>
<br><font size=2 face="Courier New">Allocated PE &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;1015</font>
<br><font size=2 face="Courier New">PV UUID &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; HNkTzu-Ok46-4vqM-CJCu-Iqd1-JmQ4-c5yzea</font>
<br>
<br>
<br><font size=2 face="Courier New">Could anyone provide me some help?</font>
<br>
<br><font size=2 face="Courier New">Thanx</font>
<br>
<br><font size=2 face="sans-serif">Matthias</font>
--=_alternative 004ED567C1256B41_=--
