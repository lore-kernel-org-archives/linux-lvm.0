Return-Path: <ardy@rdb.linux-help.org>
Date: Tue, 3 Apr 2001 11:21:38 -0400 (EDT)
From: <ardy@rdb.linux-help.org>
In-Reply-To: <200104030645.f336jhV12163@rdb.linux-help.org>
Message-ID: <Pine.LNX.4.21.0104031114410.31846-100000@rdb.linux-help.org>
MIME-Version: 1.0
Subject: [linux-lvm] Re: linux-lvm digest, Vol 1 #118 (MSG 5)
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
Content-Type: TEXT/PLAIN; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: linux-lvm@sistina.com

On Sun, Apr 01, 2001 at 07:32:51PM -0400, ardy@rdb.linux-help.org wrote:
>> I'm trying to add a seventh logical volume on a two-disk, striped
>> volume
>> group. vgdisplay shows the following:
>> 
>> I've redone this system, and the only difference is that I'm striping
>> this
>> time. I was capable of creating more logical volumes when I wasn't
>> striping. Also, I could create a seventh volume using 3900MB, but not
>> 4000MB.

> When you create a striped LV of 4g you will need 2g free on both
> disks. You can check this with pvscan.

Patrick, thanks for responding,

pvscan -- reading all physical volumes (this may take a while...)
pvscan -- ACTIVE   PV "/dev/hdb2" of VG "vg0" [4.75 GB / 44 MB free]
pvscan -- ACTIVE   PV "/dev/hdd2" of VG "vg0" [9.49 GB / 4.78 GB free]
pvscan -- total: 2 [14.25 GB] / in use: 2 [14.25 GB] / in no VG: 0 [0]

Since I only have 44 MB free on hdb2, is that the size limit of any new
additional striped volumes I can create? 

Can I create unstriped volumes with the balance of the space left on the
volume group?

Can I resize existing striped volumes and make them larger, and if yes, am
I limited to a maximum of 44MB as shown by pvscan?
