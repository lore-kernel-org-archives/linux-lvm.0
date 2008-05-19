Received: from file.rdu.redhat.com (file.rdu.redhat.com [10.11.255.147])
	by int-mx1.corp.redhat.com (8.13.1/8.13.1) with ESMTP id m4JCggN9012179
	for <linux-lvm@RedHat.com>; Mon, 19 May 2008 08:42:42 -0400
Received: from o.ww.redhat.com (vpn-4-5.str.redhat.com [10.32.4.5])
	by file.rdu.redhat.com (8.13.1/8.13.1) with ESMTP id m4JCgf3x022776
	for <linux-lvm@RedHat.com>; Mon, 19 May 2008 08:42:41 -0400
Received: from o.ww.redhat.com (localhost [127.0.0.1])
	by o.ww.redhat.com (8.14.2/8.14.2) with ESMTP id m4JCgWcA006233
	for <linux-lvm@RedHat.com>; Mon, 19 May 2008 14:42:32 +0200
Received: (from mauelsha@localhost)
	by o.ww.redhat.com (8.14.2/8.14.2/Submit) id m4JCgWZP006232
	for linux-lvm@redhat.com; Mon, 19 May 2008 14:42:32 +0200
Date: Mon, 19 May 2008 14:42:32 +0200
From: Heinz Mauelshagen <mauelshagen@redhat.com>
Subject: Re: [linux-lvm] Performance of striping
Message-ID: <20080519124232.GB5134@redhat.com>
References: <20080517091151.GB14292@kiwi.hjbaader.home>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20080517091151.GB14292@kiwi.hjbaader.home>
Reply-To: mauelshagen@redhat.com,
	LVM general discussion and development <linux-lvm@redhat.com>
List-Id: LVM general discussion and development <linux-lvm.redhat.com>
List-Unsubscribe: <https://www.redhat.com/mailman/listinfo/linux-lvm>,
	<mailto:linux-lvm-request@redhat.com?subject=unsubscribe>
List-Archive: <https://www.redhat.com/archives/linux-lvm>
List-Post: <mailto:linux-lvm@redhat.com>
List-Help: <mailto:linux-lvm-request@redhat.com?subject=help>
List-Subscribe: <https://www.redhat.com/mailman/listinfo/linux-lvm>,
	<mailto:linux-lvm-request@redhat.com?subject=subscribe>
List-Id: <linux-lvm.redhat.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: LVM general discussion and development <linux-lvm@redhat.com>

On Sat, May 17, 2008 at 11:11:51AM +0200, Hans-Joachim Baader wrote:
> Hi,
> 
> last year I built a server with 3 SATA disks. I used a physical volume
> for each disk, a volume group on each, and then created identical LVs
> in each VG. Then I used dmesetup to create a RAID 0 over all 3 disks.
> A single disk has an I/O performance of 70 MB/s. After creating a
> filesystem on the RAID and measuring its performance I got the expected
> result: 210 MB/s.

Strange config, good result ;)

> 
> But this setup was too complicated for me, so I tried a different
> approach. Still a physical volume for each disk (actually partiton 2
> which is nearly the complete disk), but only one volume group vg0.
> The commands used were:
> 
> pvcreate /dev/sda2
> pvcreate /dev/sdb2
> pvcreate /dev/sdc2
> vgcreate vg0 -s 128 /dev/sda2 /dev/sdb2 /dev/sdc2
> 
> On vg0, I created a LV which should span all 3 disks and therefore be
> equivalent to a RAID 0:
> 
> lvcreate --name=test -L 10000M -i 3 vg0
> 
> Resulting LV:
> 
>   --- Logical volume ---                                                          LV Name                /dev/vg0/ubuntu                                          VG Name                vg0
>   LV Write Access        read/write
>   LV Status              available
>   # open                 1
>   LV Size                10,12 GB
>   Current LE             81
>   Segments               1
>   Allocation             inherit
>   Read ahead sectors     0
>   Block device           254:10
> 
> However, I get only half the expected performance. I created an XFS
> filesystem and mounted it on /mnt/tmp:
> 
> # dd if=/dev/zero of=/mnt/tmp/bla bs=1024k count=10000
> 10485760000 Bytes (10 GB) kopiert, 112,233 Sekunden, 93,4 MB/s
> # dd if=/mnt/tmp/bla of=/dev/null bs=1024k count=10000
> 10485760000 Bytes (10 GB) kopiert, 88,8886 Sekunden, 118 MB/s
> 
> This was measured with kernel 2.6.23.12 and 2.6.25.1 on AMD64 X2.
> Is it possible to get 210 MB/s?

Have you tried fiddling with read ahead ?
"blockdev --setra ..." on the striped LV.

> 
> Thanks,
> hjb
> -- 
> Pro-Linux - Germany's largest volunteer Linux support site
> http://www.pro-linux.de/          Public Key ID 0x3DDBDDEA



> _______________________________________________
> linux-lvm mailing list
> linux-lvm@redhat.com
> https://www.redhat.com/mailman/listinfo/linux-lvm
> read the LVM HOW-TO at http://tldp.org/HOWTO/LVM-HOWTO/

-- 

Regards,
Heinz    -- The LVM Guy --

*** Software bugs are stupid.
    Nevertheless it needs not so stupid people to solve them ***

=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-

Heinz Mauelshagen                                 Red Hat GmbH
Consulting Development Engineer                   Am Sonnenhang 11
Storage Development                               56242 Marienrachdorf
                                                  Germany
Mauelshagen@RedHat.com                            PHONE +49  171 7803392
                                                  FAX   +49 2626 924446
=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-
