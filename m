Date: Fri, 7 Apr 2000 00:51:03 +0200
From: bert hubert <ahu@ds9a.nl>
Subject: [linux-lvm] bug in vgdisplay?
Message-ID: <20000407005102.A2301@home.ds9a.nl>
Mime-Version: 1.0
Sender: owner-linux-lvm
Errors-To: owner-linux-lvm
List-Id: <linux-lvm.redhat.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: linux-lvm@msede.com

Hi,

Is this correct:

debian:/home/ahu/programming/lvm-viewer# vgdisplay -D group1
--- Volume group ---
VG Name               group1
VG Access             read/write
>VG Status             NOT available/resizable
VG #                  0
MAX LV                256
Cur LV                1
Open LV               0
MAX LV Size           255.99 GB
Max PV                256
Cur PV                2
Act PV                2
VG Size               184 MB
PE Size               4 MB
Total PE              46
Alloc PE / Size       5 / 20 MB
Free  PE / Size       41 / 164 MB


debian:/home/ahu/programming/lvm-viewer# vgdisplay group1
--- Volume group ---
VG Name               group1
VG Access             read/write
>VG Status             available/resizable
VG #                  0
MAX LV                256
Cur LV                1
Open LV               0
MAX LV Size           255.99 GB
Max PV                256
Cur PV                2
Act PV                2
VG Size               184 MB
PE Size               4 MB
Total PE              46
Alloc PE / Size       5 / 20 MB
Free  PE / Size       41 / 164 MB


-- 
                       |              http://www.rent-a-nerd.nl
                       |                     - U N I X -
                       |          Inspice et cautus eris - D11T'95
