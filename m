Message-ID: <5204BB70.9060604@redhat.com>
Date: Fri, 09 Aug 2013 11:50:40 +0200
From: Zdenek Kabelac <zkabelac@redhat.com>
MIME-Version: 1.0
References: <20130806173719.GB15184@mail.waldi.eu.org>
	<52020FD1.2000004@redhat.com> <52039E15.10908@netapp.com>
In-Reply-To: <52039E15.10908@netapp.com>
Content-Transfer-Encoding: 7bit
Subject: Re: [linux-lvm] Missing error handling in lv_snapshot_remove
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
Cc: "Sarraf, Ritesh" <Ritesh.Sarraf@netapp.com>, Ritesh Raj Sarraf <rsarraf@netapp.com>

Dne 8.8.2013 15:33, Ritesh Raj Sarraf napsal(a):
> Hello Zdenek,
>
> On Wednesday 07 August 2013 02:43 PM, Zdenek Kabelac wrote:
>>
>> You are breaking the lvm2 logic thus pushing the code to go
>> through unexpected error code path - user is never supposed to open
>> so called 'private' /dev/mapper/ devices.
>
> Just checking if this applies to other device types of DM, or just LVM?
>
> We recommend our users to rely on /dev/mapper/* Multipath Devices, as
> _persistent_ ones.
>
> We also recommend to pvcreate on top of /dev/mapper/* Multipath Devices.


multipath  !=  lvm2

Multipath has its own rules how to use devices and make the available for use.

In lvm2 you could use lvm.conf preferred_names in this form:

preferred_names = [ "^/dev/mpath/", "^/dev/mapper/mpath", "^/dev/[hs]d" ]

But it's rather distro-specific how the multipath devices are made available 
for the user - so the names above are mostly usable for RedHat distors
(I think Suse uses slightly different logic)

Note - using   pvcreate on /dev/mapper is nothing against the lvm2 rule.

lvm2 rule is about supported device path for LVs -  whenever you try to use 
LV,  you should always use    '/dev/vgname/lvname'  path.

So   /dev/mapper/vgname-lvname  is not supported way though it will work in 
most cases - but i.e. one of the problems you may have is, that your tool 
would need to properly handle '-' symbol here,  other issue could be, that in 
/dev/mapper you see a lot more devices i.e. all mirror legs and other so 
called private devices which you could  misuse for 'mount' and do a lot of 
damage to internal metadata.

So the simple rule for LVs is to use   /dev/vgname/lvname.

Zdenek
