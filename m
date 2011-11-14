Message-ID: <4EC12F54.2000303@redhat.com>
Date: Mon, 14 Nov 2011 15:10:12 +0000
From: "Bryn M. Reeves" <bmr@redhat.com>
MIME-Version: 1.0
References: <4EC09964.1080305@omiha.com>
In-Reply-To: <4EC09964.1080305@omiha.com>
Content-Transfer-Encoding: 7bit
Subject: Re: [linux-lvm] Unable to remove LVs
Reply-To: LVM general discussion and development <linux-lvm@redhat.com>
List-Id: LVM general discussion and development <linux-lvm.redhat.com>
List-Unsubscribe: <https://www.redhat.com/mailman/options/linux-lvm>,
	<mailto:linux-lvm-request@redhat.com?subject=unsubscribe>
List-Archive: <https://www.redhat.com/archives/linux-lvm>
List-Post: <mailto:linux-lvm@redhat.com>
List-Help: <mailto:linux-lvm-request@redhat.com?subject=help>
List-Subscribe: <https://www.redhat.com/mailman/listinfo/linux-lvm>,
	<mailto:linux-lvm-request@redhat.com?subject=subscribe>
List-Id: <linux-lvm.redhat.com>
Content-Type: text/plain; charset="us-ascii"; format="flowed"
To: LVM general discussion and development <linux-lvm@redhat.com>
Cc: Jan Bakuwel <jan.bakuwel@omiha.com>

On 11/14/2011 04:30 AM, Jan Bakuwel wrote:
> server1:/# ls -al /dev/mapper/*oa*
> brw-rw---- 1 root disk 254,  7 2011-07-22 19:40 /dev/mapper/d-pdc.oa.c
> brw-rw---- 1 root disk 254, 78 2011-10-30 13:04 /dev/mapper/d-pdc.oa.cp1
> server1:/# kpartx -l /dev/mapper/d-pdc.oa.c
> d-pdc.oa.c1 : 0 71103627 /dev/mapper/d-pdc.oa.c 63
> server1:/# kpartx -d /dev/mapper/d-pdc.oa.c

This should have removed the <name>p1 partition map previously created 
by kpartx -a.

> server1:/# kpartx -d /dev/mapper/d-pdc.oa.c1

The kpartx command expects the base device as its argument (as you gave 
in the previous command). This should be "/dev/mapper/d-pdc.oa.c" (the 
'1' is the partition index and the 'p' is the separator).

> failed to stat() /dev/mapper/d-pdc.oa.c1

The partition map has a 'p' separator - d-pdc.oa.cp1 - the correct 
command is:

kpartx -d /dev/mapper/d-pdc.oa.c

> server1:/# lvs | grep oa
>    pdc.oa.c         d    -wi-ao  37.00G

The LV is still showing as active and open here. You should be able to 
remove it with lvremove d/pdc.oa.c or shut it down with 
vgchange/lvchange after correctly removing the kpartx mapping.

If it still shows as open you may want to look at the output of "dmsetup 
ls --tree" to see if there are other device-mapper devices using it and 
make sure that it's not mounted anywhere.

Regards,
Bryn.
