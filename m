Message-ID: <5057B830.6040804@omiha.com>
Date: Tue, 18 Sep 2012 11:54:24 +1200
From: Jan Bakuwel <jan.bakuwel@omiha.com>
MIME-Version: 1.0
References: <4EC09964.1080305@omiha.com> <4EC12F54.2000303@redhat.com>
	<4EC20A6A.10709@omiha.com> <4EC247E0.7050905@redhat.com>
	<4EC24A12.20200@redhat.com> <4EC2D031.3090101@omiha.com>
In-Reply-To: <4EC2D031.3090101@omiha.com>
Content-Transfer-Encoding: 7bit
Subject: [linux-lvm] Unable to remove LVs
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
Content-Type: text/plain; charset="us-ascii"
To: "Bryn M. Reeves" <bmr@redhat.com>
Cc: linux-lvm@redhat.com

Kia ora Bryn,


On 16/11/11 09:48, Jan Bakuwel wrote:
> Hi Bryn,
>
> After:
>
> # kpartx -d -pp /dev/mapper/d-pdc.oa.c
>
> I was able to remove the LV.
>
> Thanks very much for your advice - much appreciated.
>
> kind regards,
> Jan
>


It seems I'm being bitten again by this. Last time you kindly helped me
resolve this issue on a Debian Lenny (kernel 2.6.26-2-xen-amd64, lvm
2.02.39-7, kpartx 0.4.8-14+lenny2).

This time it's a slightly older system (Debian Etch, kernel
2.6.18-6-xen-amd64, lvm 2.02.06-4eth1) but in a rather remote location
(at sea). The system is rock solid otherwise and upgrading is quite an
undertaking so if at all possible I hope to be able to resolve this
issue without upgrading.

Any advice you can offer is much appreciated.

kind regards,
Jan



# lvs
  LV         VG   Attr   LSize   Origin Snap%  Move Log Copy%
  xm.dt1     d    -wi-a-   8.10G                             
  xm.dt1old  d    -wi-a-   8.10G                             
  xm.dt2     d    -wi-ao  12.00G                             
  xm.fms     d    -wi-ao  12.10G                             
  xm.w2k     d    -wi-ao  12.10G                             
  xm.wxp     d    -wi-ao   8.10G                             
  xm.wxp-eng d    -wi-ao   8.10G                             
  xm.wxp-ro  d    -wi-ao   8.10G                             

# kpartx -l /dev/mapper/d-xm.dt1old
d-xm.dt1old1 : 0 16980642 /dev/mapper/d-xm.dt1old 63
# kpartx -d -pp /dev/mapper/d-xm.dt1old
# kpartx -l /dev/mapper/d-xm.dt1old
d-xm.dt1old1 : 0 16980642 /dev/mapper/d-xm.dt1old 63

# ls -al /dev/mapper
total 0
drwxr-xr-x  2 root root     620 2012-09-17 23:17 .
drwxr-xr-x 19 root root    5140 2012-09-17 23:17 ..
crw-rw----  1 root root  10, 62 2044-01-30 07:04 control
brw-rw----  1 root disk 254, 21 2044-01-30 07:05 d-xm.dt1
brw-rw----  1 root disk 254, 12 2044-01-30 07:05 d-xm.dt1old
brw-rw----  1 root disk 254, 22 2044-01-30 07:05 d-xm.dt2
brw-rw----  1 root disk 254, 15 2012-09-17 23:25 d-xm.fms
brw-rw----  1 root disk 254, 24 2044-01-30 07:05 d-xm.fms1
brw-rw----  1 root disk 254, 18 2044-01-30 07:05 d-xm.w2k
brw-rw----  1 root disk 254, 25 2044-01-30 07:05 d-xm.w2k1
brw-rw----  1 root disk 254, 23 2012-09-17 03:40 d-xm.wxp
brw-rw----  1 root disk 254, 29 2044-01-30 07:05 d-xm.wxp1
brw-rw----  1 root disk 254, 19 2044-01-30 07:05 d-xm.wxp--eng
brw-rw----  1 root disk 254, 27 2044-01-30 07:05 d-xm.wxp--eng1
brw-rw----  1 root disk 254, 13 2044-01-30 07:05 d-xm.wxp--ro
brw-rw----  1 root disk 254, 20 2044-01-30 07:05 d-xm.wxp--ro1


-- 

Omiha Systems Ltd
NEW ZEALAND
p +64 9 950 3007
m +64 21 027 51803
m +64 22 103 9151
