From: Stefan Nilsen <stefan.nilsen@wale.dyndns.dk>
References: <200302041927.44619.stefan.nilsen@wale.dyndns.dk> <200302041953.23662.stefan.nilsen@wale.dyndns.dk> <3E40245C.8030808@ednet.ns.ca>
In-Reply-To: <3E40245C.8030808@ednet.ns.ca>
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline
Message-Id: <200302042246.39398.stefan.nilsen@wale.dyndns.dk>
Subject: [linux-lvm] Re: [SOLVED] New lv cannot span pv's
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
Date: Tue Feb  4 16:14:01 2003
List-Id: <linux-lvm.redhat.com>
Content-Type: text/plain; charset="us-ascii"
To: linux-lvm@sistina.com

On Tuesday 04 February 2003 21.36, Patrick Boutilier wrote:
> Does
>
> lvcreate -ntest -l1383 vgdata
>
>
> work ?
>

It did not.

wale:~ # lvcreate -ntest -l1383 vgdata
lvcreate -- not enough allocatable/free physical volume space in 
"vgdata"
lvcreate -- please check, if physical volumes are allocatable

I looked around little more and found this:

wale:~ # pvdisplay /dev/hda5
--- Physical volume ---
PV Name               /dev/hda5
VG Name               vgdata
PV Size               11.61 GB [24338412 secs] / NOT usable 3.99 MB 
[LVM: 134 KB]
PV#                   1
PV Status             available
Allocatable           NO
Cur LV                5
PE Size (KByte)       4096
Total PE              2970
Free PE               553
Allocated PE          2417
PV UUID               eQxblH-x1uS-bb9G-reYu-ocZo-QSOW-5j6QB0

I seem to have managed to turn off the allocatable status of one of the 
pv's. :-)

I changed it with "pvchange -xy /dev/hda5" and now it works.

Thanks for help.
