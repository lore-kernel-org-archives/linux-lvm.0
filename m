Message-ID: <401BB8A5.8070409@grayskies.net>
From: David Powers <david@grayskies.net>
MIME-Version: 1.0
Subject: Re: [linux-lvm] duplicate PV error with 2.6.1 and lvm2 - resolved
References: <401A8C6C.3040108@grayskies.net> <20040130170639.GC13019@percy.comedia.it>
In-Reply-To: <20040130170639.GC13019@percy.comedia.it>
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
Date: Sat Jan 31 09:17:01 2004
List-Id: <linux-lvm.redhat.com>
Content-Type: text/plain; charset="us-ascii"; format="flowed"
To: linux-lvm@sistina.com

That worked like a charm - thank you very much.  I added:

devices { filter=["r|sd[a-z]|"] } to /etc/lvm/lvm.conf (to ignore /dev/sda and /dev/sdb) and everything else fell into place.

-David Powers



Luca Berra wrote:

> On Fri, Jan 30, 2004 at 11:55:08AM -0500, David Powers wrote:
>
>> I am attempting to create a simple volume on a soft raid 1 device 
>> (/dev/md1) on a gentoo linux box running 2.6.1.  The pvcreate seems 
>> to go fine but when I then attempt to create the volume group I get 
>> an odd error about duplicate PV's.  It seems as if the code is 
>> sometimes treating the device as a single device and sometimes seeing 
>> the underlying disks.  Any help would be appreciated.
>>
> either modify /etc/lvm/lvm.conf in order to ignore the devices that are
> part of your md array or look at the patch i posted to this list under
> the subject: "[patch] lvm2 and md component devices"
>
> L.
>
