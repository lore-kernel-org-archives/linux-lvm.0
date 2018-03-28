References: <5efc943a1039bda80e77469afbfffd3d323c9a8f.camel@fladi.at>
From: Zdenek Kabelac <zkabelac@redhat.com>
Message-ID: <5bf42865-57aa-9bbf-9d0b-2e2e34d74a8c@redhat.com>
Date: Wed, 28 Mar 2018 10:27:50 +0200
MIME-Version: 1.0
In-Reply-To: <5efc943a1039bda80e77469afbfffd3d323c9a8f.camel@fladi.at>
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Subject: Re: [linux-lvm] Cannot create PV on /dev/dm-NN (/dev/dm-N works)
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
To: LVM general discussion and development <linux-lvm@redhat.com>, Michael Fladischer <michael@fladi.at>

Dne 27.3.2018 v 12:38 Michael Fladischer napsal(a):
> Hi,
> 
> I'm unable to create PVs on Multipath-Volumes that are available at
> /dev/dm-NN where N~[0-9] but I can create them on single digit devices
> like /dev/dm-9:
> 
> # pvcreate /dev/dm-6
>    Physical volume "/dev/dm-6" successfully created.
> 
> # pvcreate /dev/dm-16
>    Device /dev/dm-16 not found (or ignored by filtering).
> 
> My Version of LVM is 2.02.168 from Debian 9.
> The filter ist set to a permissive value:
>    filter = [ "a|.*|" ]
>    global_filter = [ "a|.*|" ]
> 
> Any ideas why two or more digits in the device path can cause it to be
> filtered by pvcreate?
> 



Hi


lvm2 is detecting  multipath 'component' devices - those are not allowed to be 
used for pvcreate.

You can use  'pvcreate -vvv' to get more information - there will be printed 
the reason why devices are rejected....

Eventually if you can't figure this out yourself - provide this trace in 
attachment.


Regards

Zdenek
