Message-ID: <3BA670B3.7050707@kenamea.com>
Date: Mon, 17 Sep 2001 14:52:51 -0700
From: Kenny Gorman <kenny@kenamea.com>
MIME-Version: 1.0
Subject: Re: [linux-lvm] Phantom Vol Grp
References: <3BA66769.1030001@kenamea.com> <20010917165416.A13723@sistina.com>
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
List-Id: <linux-lvm.redhat.com>
Content-Type: text/plain; charset="us-ascii"; format="flowed"
To: linux-lvm@sistina.com

Yes! That was it.

thanks!

-kg

AJ Lewis wrote:

> On Mon, Sep 17, 2001 at 02:13:13PM -0700, Kenny Gorman wrote:
> 
>>I can not delete a vol grp, but it doesn't show as there.  When I try to 
>>create a new one with the same name, then it says it exists...  how do I 
>>  'clean out' old references?
>>
>>See below:
>>
>>colobus:~ # pvscan
>>pvscan -- reading all physical volumes (this may take a while...)
>>pvscan -- ACTIVE   PV "/dev/sdb1" of VG "oraredo1" [100 MB / 100 MB free]
>>pvscan -- inactive PV "/dev/sdb2" is in no VG  [16.99 GB]
>>pvscan -- ACTIVE   PV "/dev/sdc1" of VG "oraredo2" [100 MB / 100 MB free]
>>pvscan -- inactive PV "/dev/sdc2" is in no VG  [16.99 GB]
>>pvscan -- ACTIVE   PV "/dev/sdd1" of VG "redogrp3" [17.09 GB / 16.98 GB 
>>free]
>>pvscan -- ACTIVE   PV "/dev/sdd2" of VG "sysgrp"   [16.99 GB / 12.49 GB 
>>free]
>>pvscan -- total: 6 [68.26 GB] / in use: 4 [34.28 GB] / in no VG: 2 
>>[33.98 GB]
>>
>>colobus:~ # vgcreate indxgrp /dev/sdc2
>>vgcreate -- volume group directory or file already exists
>>vgcreate -- please choose a different name
>>
> 
> I believe this is referring to the /dev/indxgrp directory...look at that and
> if you know you don't need it, rm it.
> 
> 
