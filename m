Message-Id: <200308192223.h7JMN6o06498@mail.osdl.org>
From: markw@osdl.org
MIME-Version: 1.0
Subject: [linux-lvm] Insufficient space in params[] to write target parameters.
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
Date: Tue Aug 19 17:24:02 2003
List-Id: <linux-lvm.redhat.com>
Content-Type: TEXT/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: linux-lvm@sistina.com

Hi again, I've reconfigured and repartitioned my drives and now I run
into this error message:

# lvcreate -i52 -I8 -l225420 -n mydata data_volume
  Insufficient space in params[] to write target parameters.
  Unable to build table for 'mydata'
  Couldn't populate device 'data_volume-mydata'.
  Failed to activate new LV.

vgdisplay says this, if it helps:

  --- Volume group ---
  VG Name               data_volume
  System ID             
  Format                lvm2
  Metadata Areas        52
  Metadata Sequence No  1
  VG Access             read/write
  VG Status             resizable
  MAX LV                256
  Cur LV                0
  Open LV               0
  Max PV                256
  Cur PV                52
  Act PV                52
  VG Size               880.55 GB
  PE Size               4.00 MB
  Total PE              225420
  Alloc PE / Size       0 / 0   
  Free  PE / Size       225420 / 880.55 GB
  VG UUID               WgC7yB-QkUx-aYy8-nAhp-SuYj-sRZ5-pmNvUv

I've copied a new lvm2.log.gz file to:
	http://developer.osdl.org/markw/lvm2.log.gz

Let me know if there's anything else I can provide.

Thanks,
Mark
