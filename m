Received: from mx3.redhat.com (mx3.redhat.com [172.16.48.32])
	by int-mx1.corp.redhat.com (8.12.11.20060308/8.11.6) with ESMTP id
	k3N4j4KG008566
	for <linux-lvm@redhat.com>; Sun, 23 Apr 2006 00:45:04 -0400
Received: from percy.comedia.it (percy.comedia.it [212.97.59.71])
	by mx3.redhat.com (8.13.1/8.13.1) with ESMTP id k3N4iulP000751
	for <linux-lvm@redhat.com>; Sun, 23 Apr 2006 00:44:56 -0400
Date: Sun, 23 Apr 2006 06:44:55 +0200
From: Luca Berra <bluca@comedia.it>
Subject: Re: [linux-lvm] restoring my lvm
Message-ID: <20060423044455.GG15564@percy.comedia.it>
References: <2996.192.168.0.15.1145660815.squirrel@192.168.0.15>
	<20060422080622.GB15564@percy.comedia.it>
	<1775.192.168.0.15.1145727636.squirrel@192.168.0.15>
Mime-Version: 1.0
Content-Disposition: inline
In-Reply-To: <1775.192.168.0.15.1145727636.squirrel@192.168.0.15>
Reply-To: LVM general discussion and development <linux-lvm@redhat.com>
List-Id: LVM general discussion and development <linux-lvm.redhat.com>
List-Unsubscribe: <https://www.redhat.com/mailman/listinfo/linux-lvm>,
	<mailto:linux-lvm-request@redhat.com?subject=unsubscribe>
List-Archive: <https://www.redhat.com/archives/linux-lvm>
List-Post: <mailto:linux-lvm@redhat.com>
List-Help: <mailto:linux-lvm-request@redhat.com?subject=help>
List-Subscribe: <https://www.redhat.com/mailman/listinfo/linux-lvm>,
	<mailto:linux-lvm-request@redhat.com?subject=subscribe>
List-Id: <linux-lvm.redhat.com>
Content-Type: text/plain; charset="us-ascii"; format="flowed"
Content-Transfer-Encoding: 7bit
To: LVM general discussion and development <linux-lvm@redhat.com>

On Sat, Apr 22, 2006 at 06:40:36PM +0100, Jannetta S Steyn wrote:
>Hi Luca
>
>> On Sat, Apr 22, 2006 at 12:06:55AM +0100, Jannetta S Steyn wrote:
>>>My problem was that the new system (also FC4 and also a vanilla install)
>>>already had VolGroup00. I then did a 'vgcreate VolGroup01 /dev/hdb2'. I
>> vgcreate = msdos format
>> you just wiped your disk
>
>It didn't take very long and didn't give any warnings, so I thought it
>just wrote the volume name to somewhere on the disk.

unfortunately it also wipes out informations about logical volumes into
the vg. data is not damaged, only you don't know where it is.
and since the VG backups were on one of the inaccessible logical volume
you cannot use those for recovery.

...

>I have downloaded testdisk and this is what I get:
>
>TestDisk 6.3, Data Recovery Utility, March 2006
>Christophe GRENIER <grenier@cgsecurity.org>
>http://www.cgsecurity.org
>
>Disk /dev/hdb - 3249 MB / 3098 MiB - CHS 6296 16 63
>     Partition               Start        End    Size in sectors
>* Linux                    0   1  1   202  15 63     204561 [/boot]
>D Linux                  203   0  1  5645  15 63    5486544 [/]
>D Linux LVM              203   0  1  6295  15 63    6141744
>D Linux                  229   0  1  5560  15 63    5374656
>D Linux                  265   0  1  5596  15 63    5374656
>

try with each of the linux partitions found and see if you can mount it
and get your data back.

L.

-- 
Luca Berra -- bluca@comedia.it
        Communication Media & Services S.r.l.
 /"\
 \ /     ASCII RIBBON CAMPAIGN
  X        AGAINST HTML MAIL
 / \
