Return-Path: <jan@moria.gondor.com>
Date: Sun, 14 Jan 2001 15:17:56 +0100
From: Jan Niehusmann <list039@gondor.com>
Subject: Re: [linux-lvm] *** ANNOUNCEMENT *** LVM 0.9.1 beta1 available at www.sistina.com
Message-ID: <20010114151756.A1050@gondor.com>
References: <20010113011532.B21587@srv.t-online.de> <20010114142913.A4966@gondor.com>
Mime-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20010114142913.A4966@gondor.com>; from list039@gondor.com on Sun, Jan 14, 2001 at 02:29:13PM +0100
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
To: Jan Niehusmann <list039@gondor.com>, linux-lvm@sistina.com

Another thing with 0.9.1 - or to be exact, 0.9.1 userlevel tools
with the pv order patch, and a 2.4.1-pre3 kernel 
(didn't test with other versions):


I issued the following commands:

pvmove /dev/sda2
vgreduce vg1 /dev/sda2
vgscan

(You guess it - I just removed an old scsi drive from my VG)

Afterwards I wanted to see if everything was OK and did a vgdisplay -v:

--- Volume group ---
VG Name               vg1
VG Access             read/write
VG Status             available/resizable
VG #                  0
MAX LV                256
Cur LV                23
Open LV               20
MAX LV Size           1023.97 GB
Max PV                256
Cur PV                1
Act PV                1
VG Size               72.95 GB
PE Size               16 MB
Total PE              4669
Alloc PE / Size       3217 / 50.27 GB
Free  PE / Size       1452 / 22.69 GB
VG UUID               5HozPs-vN3u-eT3i-LNQp-eAE0-8HIS-KPy1O7

--- Logical volume ---
[...]

--- Physical volumes ---
PV Name (#)           /dev/hda5 (1)
PV Status             available / allocatable
Total PE / Free PE    414 / 0


Uh, what? Only one PV? Where is the other one, /dev/hdc4 with 4447 PEs?
But the system still works well, and vgdisplay -D shows all the PVs.
So I just rebooted and now everything is fine again. 

Any idea what may have caused that behaviour?


Jan
