Return-Path: <adilger@turbolinux.com>
From: Andreas Dilger <adilger@turbolinux.com>
Message-Id: <200103172023.f2HKNYP03975@webber.adilger.int>
Subject: Re: [linux-lvm] Problem win Suse 7.0
In-Reply-To: <20010317123633.8B53E3588E@mad.isoco.com> from Javier Ferruz Rodriguez
 at "Mar 17, 2001 01:36:33 pm"
Date: Sat, 17 Mar 2001 13:23:34 -0700 (MST)
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
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: linux-lvm@sistina.com

You write:
> 	This is my partition table disk:
> 
> 	hda1	Boot	Primary	Linux ext2	16M
> 	hda2		Primary	Linux ReiserFS	1G	(/)
> 	hda5		Logical	Linux ReiserFS	2GB	(/usr)
> 	hda6		Logical	Linux ReiserFS	1GB	(/usr/local)
> 	hda7		Logical	Linux ReiserFS	1GB	(/var)
> 	hda8		Logical	Linux swap	128M
> 	hda9		Logical	Linux ReiserFS	450M	(/home)
> 
> 	I set 'Linux LVM' in hda2, hda5, hda6, hda7 and hda9. When I write
> 	the new table, the display show me next message:
> 
> 	Wrote partition table, but re-read table failed. Reboot to update table
> 
> 	so I reboot my computer.
> 
> 	My kernel version is 2.2.16.
> 
> 	myhost#cat /proc/lvm
> 
> 	LVM driver version 0.8e (4/1/2000)
> 	Total: 0VGs	0 PVs	0 LVs	(0 LVs open)
> 	Global: 138 bytes vmalloced	IOP Version: 6	1:12:19 active
> 
> 	When the machine is up again, I execute
> 
> 		vgscan
> 		pvcreate /dev/hda2
> 		pvcreate /dev/hda5
> 		pvcreate /dev/hda6
> 		pvcreate /dev/hda7
> 		pvcreate /dev/hda9
> 
> 	I execute again 'cat /proc/lvm' and I get the same information.
> 	Is this correct?
> 
> 	The last command I execute is ...
> 
> 		vgcreate grp1Beta /dev/hda2 /dev/hda5 /dev/hda6 /dev/hda7 /dev/hda9

You are lucky this doesn't work - you would DESTROY all of your data.  Please
read the instructions first!!!

Cheers, Andreas
-- 
Andreas Dilger  \ "If a man ate a pound of pasta and a pound of antipasto,
                 \  would they cancel out, leaving him still hungry?"
http://www-mddsp.enel.ucalgary.ca/People/adilger/               -- Dogbert
