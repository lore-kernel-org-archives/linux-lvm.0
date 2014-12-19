Received: from [10.10.62.44] (vpn-62-44.rdu2.redhat.com [10.10.62.44])
	by int-mx09.intmail.prod.int.phx2.redhat.com (8.14.4/8.14.4) with ESMTP
	id sBJGkTC2030974
	for <linux-lvm@redhat.com>; Fri, 19 Dec 2014 11:46:30 -0500
Message-ID: <54945665.5060107@redhat.com>
Date: Fri, 19 Dec 2014 11:46:29 -0500
From: Jack Waterworth <jack@redhat.com>
MIME-Version: 1.0
References: <5493FEB9.7010009@crowie.net>
In-Reply-To: <5493FEB9.7010009@crowie.net>
Content-Transfer-Encoding: 7bit
Subject: Re: [linux-lvm] Missing Logical Volumes
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
To: linux-lvm@redhat.com

It sounds like the VG was not activated. You can activate it with the 
following command:

     # vgchange -ay array1

   Jack Waterworth, Red Hat Certified Architect
   Senior Storage Technical Support Engineer
   Red Hat Global Support Services ( 1.888.467.3342 )

On 12/19/2014 05:32 AM, G Crowe wrote:
> After rebooting, some of my logical volumes did not have device files.
>
> /dev/array1/LVpics
> and
> /dev/mapper/array1-LVpics
> did not exist but the output of "lvdisplay" said that the volume was 
> available (see below).
>
> vgscan did not resolve the problem.
>
> I was able to regain access to the LV by renaming it, then renaming it 
> back...
> [root@host1 ~]# lvrename /dev/array1/LVpics /dev/array1/LVpicsnew
>   Renamed "LVpics" to "LVpicsnew" in volume group "array1"
> [root@host1 ~]# lvrename /dev/array1/LVpicsnew /dev/array1/LVpics
>   Renamed "LVpicsnew" to "LVpics" in volume group "array1"
>
> There are 29 LVs in the VG and 25 of them came up OK and 4 had this 
> problem. Note that there is only one single PV (a RAID6 array) in the 
> VG, and there are two VGs on the machine.
>
> Is this expected behaviour, or is it something I should be worried about?
>
>
>
>   --- Logical volume ---
>   LV Path                /dev/array1/LVpics
>   LV Name                LVpics
>   VG Name                array1
>   LV UUID                WH7g9u-Ls7J-fIpQ-Hk2p-mUuH-QRKf-9uxcM2
>   LV Write Access        read/write
>   LV Creation host, time example.com, 2013-11-26 07:29:51 +1100
>   LV Status              available
>   # open                 0
>   LV Size                350.00 GiB
>   Current LE             89600
>   Segments               2
>   Allocation             inherit
>   Read ahead sectors     auto
>   - currently set to     256
>   Block device           253:9
>
>
> I am running Fedora 19 with kernel 3.11.9-200.fc19.x86_64
>
>
> Thanks
>
> GC
>
> _______________________________________________
> linux-lvm mailing list
> linux-lvm@redhat.com
> https://www.redhat.com/mailman/listinfo/linux-lvm
> read the LVM HOW-TO at http://tldp.org/HOWTO/LVM-HOWTO/
