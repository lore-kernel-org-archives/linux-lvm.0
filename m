Date: Fri, 25 Aug 2000 20:39:44 -0400
From: Peter Green <pcg@gospelcom.net>
Subject: Re: [linux-lvm] LVM and sw RAID1
Message-ID: <20000825203944.E5159@gospelcom.net>
References: <20000823162957.B8398@gospelcom.net>
Mime-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20000823162957.B8398@gospelcom.net>; from pcg@gospelcom.net on Wed, Aug 23, 2000 at 04:29:57PM -0400
Sender: owner-linux-lvm
Errors-To: owner-linux-lvm
List-Id: <linux-lvm.redhat.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: linux-lvm@msede.com

also sprach pcg:
> I am having a really difficult time being able to get LVM to recognize my
> /dev/md[012] arrays. The system:
> 
>   (pcg@dmna) ~> uname -a
>   Linux dmna 2.4.0-0.21 #2 Wed Aug 23 11:46:12 EDT 2000 i686 unknown
>   
>   (pcg@dmna) ~> cat /proc/lvm
>   LVM driver version 0.8final  (15/02/2000)
> 
>   Total:  0 VGs  0 PVs  0 LVs (0 LVs open)
>   Global: 143 bytes malloced   IOP version: 6   4:01:56 active
>   
>   (pcg@dmna) ~> cat /proc/mdstat 
>   Personalities : [linear] [raid0] [raid1] [raid5] 
>   read_ahead 1024 sectors
>   md2 : active raid1 sdg1[1] sdd1[0]
>         17920384 blocks [2/2] [UU]
> 	      
>   md1 : active raid1 sdf1[1] sdc1[0]
>         35840896 blocks [2/2] [UU]
> 
>   md0 : active raid1 sde1[1] sdb1[0]
>         17936448 blocks [2/2] [UU]
> 
> (User-space tools are 0.8final+0.8final-2 patch. /dev/sda is on a BusLogic
> BT-958, while sd[b-g] are on two separate channels of an Adaptec 39160.)

Just as a followup, with the exact same system BUT using the SuSE lvm tools
(lvm-0.8-70; see rpmfind.net), everything seems to work. (The Mandrake RPM
at rpmfind did *not* work.)

I would be interested in seeing what SuSE has done to the source for the
tools. I'm sure the developers here ought to be as well. :)

Anyway, thanks for all the help. Anyone who is running into similar problems
might consider fetching the RPM I've mentioned above; you'll be glad you
did!

/pg
-- 
Peter Green : Gospel Communications Network, SysAdmin : pcg@gospelcom.net
---
I'd rather be rich than stupid.
 (Jack Handey)
