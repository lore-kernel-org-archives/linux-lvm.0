Received: from mx3.redhat.com (mx3.redhat.com [172.16.48.32])
	by int-mx1.corp.redhat.com (8.11.6/8.11.6) with SMTP id i1D2sei16460
	for <linux-lvm@redhat.com>; Thu, 12 Feb 2004 21:54:40 -0500
Message-Id: <s02bd9d6.050@prv-mail20.provo.novell.com>
From: "Alexander Danoyan" <ADANOYAN@novell.com>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline
Subject: [linux-lvm] Bug report for LVM 1.08
Sender: linux-lvm-admin@redhat.com
Errors-To: linux-lvm-admin@redhat.com
Reply-To: linux-lvm@redhat.com
List-Help: <mailto:linux-lvm-request@redhat.com?subject=help>
List-Post: <mailto:linux-lvm@redhat.com>
List-Subscribe: <https://www.redhat.com/mailman/listinfo/linux-lvm>,
	<mailto:linux-lvm-request@redhat.com?subject=subscribe>
List-Id: LVM general discussion and development <linux-lvm.redhat.com>
List-Unsubscribe: <https://www.redhat.com/mailman/listinfo/linux-lvm>,
	<mailto:linux-lvm-request@redhat.com?subject=unsubscribe>
List-Archive: <https://www.redhat.com/archives/linux-lvm/>
Date: Fri Feb 13 09:12:04 2004
List-Id: <linux-lvm.redhat.com>
Content-Type: text/plain; charset="us-ascii"
To: "<Heinz Mauelshagen" <Linux-LVM@Sistina.com>

Hello Heinz,

Here are a few defects.
There are inconsistency in view between 
lvdisplay and lvdisplay with -c option
Here is an example:

lvdisplay /dev/vg_demo/striped 

--- Logical volume ---
LV Name                /dev/vg_demo/striped
VG Name                vg_demo
LV Write Access        read/write
LV Status              available
LV #                   3
# open                 0
LV Size                1 GB
Current LE             32
Allocated LE           32
Stripes                2
Stripe size (KByte)    4
Allocation             next free
Read ahead sectors     1024
Block device           58:2

lvdisplay -c /dev/vg_demo/striped 
/dev/vg_demo/striped:vg_demo:3:1:2:0:2097152:32:32:0:1024:58:2

1. As you can see the option -c does not show information about stripes
at all.
2. -c option also does not show information on snapshot volumes

3. Also in vgdisplay, pvdisplay and lvdisplay with -c option some of
the sizes shown in KBytes and some of the sizes in the number of sectors
? 

We are (here at Novell) relying heavily on -c option. 
Do you have any plans to fix these defects ? 
If yes when are you planing to have a patch or next release ?
Thanks a lot.

Alex.
