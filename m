Message-ID: <4EC24A12.20200@redhat.com>
Date: Tue, 15 Nov 2011 11:16:34 +0000
From: "Bryn M. Reeves" <bmr@redhat.com>
MIME-Version: 1.0
References: <4EC09964.1080305@omiha.com> <4EC12F54.2000303@redhat.com>
	<4EC20A6A.10709@omiha.com> <4EC247E0.7050905@redhat.com>
In-Reply-To: <4EC247E0.7050905@redhat.com>
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

On 11/15/2011 11:07 AM, Bryn M. Reeves wrote:
> On 11/15/2011 06:44 AM, Jan Bakuwel wrote:
>> Hi Bryn,
>>
>>> The partition map has a 'p' separator - d-pdc.oa.cp1 - the correct
>>> command is:
>>>
>>> kpartx -d /dev/mapper/d-pdc.oa.c
>>
>> # kpartx -d /dev/mapper/d-pdc.oa.c
>
> It's possible kpartx is getting confused and is refusing to remove the
> maps if they still exist after running this command.

That seems to be the case:

# vgcreate d /dev/loop0
   Volume group "d" successfully created
# lvcreate -n pdc.oa.c -L 4m d
   Logical volume "pdc.oa.c" created
# fdisk /dev/d/pdc.oa.c
[...]
# kpartx -l /dev/mapper/d-pdc.oa.c
d-pdc.oa.c1 : 0 8191 /dev/mapper/d-pdc.oa.c 1
# ls /dev/mapper/d-pdc.oa.c*
/dev/mapper/d-pdc.oa.c  /dev/mapper/d-pdc.oa.cp1
# kpartx -d /dev/mapper/d-pdc.oa.c
# kpartx -l /dev/mapper/d-pdc.oa.c
d-pdc.oa.c1 : 0 8191 /dev/mapper/d-pdc.oa.c 1
# ls /dev/mapper/d-pdc.oa.c*
/dev/mapper/d-pdc.oa.c  /dev/mapper/d-pdc.oa.cp1

It does the right thing if you specify the partition separator on the 
command line:

# kpartx -d -pp /dev/mapper/d-pdc.oa.c
# ls /dev/mapper/d-pdc.oa.c
/dev/mapper/d-pdc.oa.c

Regards,
Bryn.
