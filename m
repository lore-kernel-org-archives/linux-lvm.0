From: "Heinz J . Mauelshagen" <mauelshagen@sistina.com>
Subject: Re: [linux-lvm] Does LVM work with NBD?
Message-Id: <20020320171121.E23233@sistina.com>
References: <1BD922A62552D411B48A00D0B74723751120A947@kecmsg04.ad.infosys.com>
MIME-Version: 1.0
In-Reply-To: <1BD922A62552D411B48A00D0B74723751120A947@kecmsg04.ad.infosys.com>;
    from ashish_gupta@infy.com on Wed, Mar 20, 2002 at 04:04:54PM +0530
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
Date: Wed Mar 20 10:13:02 2002
List-Id: <linux-lvm.redhat.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: linux-lvm@sistina.com

On Wed, Mar 20, 2002 at 04:04:54PM +0530, ASHISH GUPTA wrote:
> Hi All,
>  
> 1) I'm using NBD and LVM . I have mounted the remote device 
> using NBD(version 2.4.27). When I do pvcreate on mounted disk,it is successful.
>  
> #pvcreate /dev/nb0
> pvcreate -- physical volume "/dev/nb0" successfully created
>  
> But when we try out other commands such as pvdisplay, vgcreate etc. it gives the
> following error. 
>  
>  #pvdisplay /dev/nb0
> pvdisplay -- ERROR "pv_read(): pv_create_name_from_kdev_t" no VALID physical volume "/d
> ev/nb0"
>  
> # ./vgcreate /dev/nb0
> vgcreate -- please enter physical volume name(s)
>  
> pvcreate uses the information from /proc/partitions. 
> It  works although the /proc/partitions is not updated with the remote device information.
> However the other LVM commands like "vgcreate", "pvdisplay" look for remote device
> information in /proc/partition and as the entry is not there in dir_cache, it fails.
>  
> To make it run, I have added a entry for nb0 in the file lvm_dir_cache.c in _noprocdir.
> /* devices *not* showing up in /proc/partitions must be scanned anyway */
> static char *_noprocdir[] = {
>         LVM_DIR_PREFIX "loop",
>         LVM_DIR_PREFIX "nb0",
>         NULL
> };
>  
> After doing,I am able to do pvcreate, vgcreate and so.Is it right way to do this?

Yes.

That array is meant to name all devices, which don't show up in
/proc/partitions. In addition to that you need to define a LVM device type
(which is already there) in liblvm.h and a case to declare NBD as
non-partitioned devices in lvm_check_partitioned_dev.c (which is already done).

So you inserted the only missing definition which made it work :-)

Regards,
Heinz    -- The LVM Guy --


>  
> 2)As per some mail in lvm-linux archieve, if I make an entry for nbd device in _devdir[] in file lvm_dir_cache.c
>  and just modify this following check by replacing _cache_size with '1'.Still pvcreate fails.And it gives the following error.
>  
> if(!_cache_size)
>                         _scan_devs( TRUE);
>                 else
>                         _scan_devs( FALSE);
>         }
>  
>  
> # pvcreate /dev/nb0
> "/dev/nb0 has a partition table"
>  
>  
> 3) Is there any patch available to make NBD working with LVM?
>  
>  
>  
> Regards,
> Ashish
>  
>  
>  
>  
>  
>  
>  
>  
>  
>  

*** Software bugs are stupid.
    Nevertheless it needs not so stupid people to solve them ***

=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-

Heinz Mauelshagen                                 Sistina Software Inc.
Senior Consultant/Developer                       Am Sonnenhang 11
                                                  56242 Marienrachdorf
                                                  Germany
Mauelshagen@Sistina.com                           +49 2626 141200
                                                       FAX 924446
=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-
