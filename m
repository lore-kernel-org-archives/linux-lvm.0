Message-ID: <3E47B064.9040506@ednet.ns.ca>
From: Patrick Boutilier <boutilpj@ednet.ns.ca>
MIME-Version: 1.0
Subject: Re: [linux-lvm] PV Status NOT available
References: <000801c2d0e8$91e8d320$0d01a8c0@aphrodite> <20030210143353.A5958@sistina.com>
In-Reply-To: <20030210143353.A5958@sistina.com>
Content-Transfer-Encoding: 7bit
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
Date: Mon Feb 10 08:02:01 2003
List-Id: <linux-lvm.redhat.com>
Content-Type: text/plain; charset="us-ascii"; format="flowed"
To: linux-lvm@sistina.com

I have the same problem on RedHat 8.0


# pvdisplay /dev/sda6

--- Physical volume ---
PV Name               /dev/sda6
VG Name               imap_vg
PV Size               261.11 GB [547591527 secs] / NOT usable 16.25 MB 
[LVM: 189 KB]
PV#                   1
PV Status             NOT available
Allocatable           yes (but full)
Cur LV                1
PE Size (KByte)       16384
Total PE              16710
Free PE               0
Allocated PE          16710
PV UUID               O7WnwM-5ASt-AsiV-8BlZ-h6KP-NjFl-cdY33C


# cat /proc/lvm/global

LVM driver LVM version 1.0.6(25/10/2002)

Total:  1 VG  1 PV  1 LV (1 LV open 1 times)

Global: 271038 bytes malloced   IOP version: 10   63 days 17:26:47 active

VG:  imap_vg  [1 PV, 1 LV/1 open]  PE Size: 16384 KB
   Usage [KB/PE]: 273776640 /16710 total  273776640 /16710 used  0 /0 free
   PV:  [AA] sda6                  273776640 /16710   273776640 /16710 
         0 /0
     LV:  [AWDL  ] imap_lv                  273776640 /16710    1x open






Heinz J . Mauelshagen wrote:
> Rupert,
> 
> do all 3 PVs show up active (the [] following 'PV:' should contain 'AA'
> unless you set a PV to inallocatable) in /proc/lvm/global ?
> 
> if so pvdisplay (pv_status in the library respectively) doesn't seem
> to get the PV_ACTIVE status from the kernel correctly.
> 
> 
> On Mon, Feb 10, 2003 at 09:41:18AM -0000, Rupert Hair wrote:
> 
>>Hi Everyone.
>>
>>I have a rather strange 'problem' with my LVM setup.  I am using a very
>>standard install of Redhat 8.0 (Kernel 2.4.18-14smp (I guess the "-14smp" is
>>some Redhat version number.)) with LVM version 1.0.3(19/02/2002).  I used
>>the Redhat installer to create a single VG (datavg) and LV (datalv) made up
>>of 3 PVs (hdd5 hdd6 hdd7 (Yes all three PVs are on the same disk as this is
>>just a test setup.)).  This all went fine and the installer created an ext3
>>filesystem on top of the LV.  I have put some data on the filesystem and
>>rebooted a few times to test it out and everything works great.
>>
>>Now the 'problem': two of my PVs (hdd5 hdd7) have a status of "NOT
>>available" (reported by pvdisplay).  This is very strange as the whole setup
>>seems to work fine and all three PVs are on the same disk (which is working
>>fine).  I have attached various files which are the outputs of some of the
>>LVM utilities that seemed useful.
>>
>>I would be very grateful if anyone could shed any light on this problem and
>>what I have done wrong.
>>
>>Thanks.
>>Rupert
> 
> 
