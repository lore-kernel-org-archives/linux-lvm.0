Received: from mx1.redhat.com (ext-mx05.extmail.prod.ext.phx2.redhat.com
	[10.5.110.9])
	by int-mx03.intmail.prod.int.phx2.redhat.com (8.13.8/8.13.8) with ESMTP
	id o1PAcsrj032045
	for <linux-lvm@redhat.com>; Thu, 25 Feb 2010 05:38:55 -0500
Received: from fela.liber4e.com (fela.liber4e.com [208.77.96.130])
	by mx1.redhat.com (8.13.8/8.13.8) with ESMTP id o1PAcinj028972
	for <linux-lvm@redhat.com>; Thu, 25 Feb 2010 05:38:45 -0500
Received: from fela.liber4e.com (fela.liber4e.com [127.0.0.1])
	by fela.liber4e.com (8.14.2/8.14.2) with ESMTP id o1PAaTC7009261
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-SHA bits=256 verify=NO)
	for <linux-lvm@redhat.com>; Thu, 25 Feb 2010 10:36:41 GMT
Message-ID: <cbc809246d15e30c4dd15df41e2889b9.squirrel@fela.liber4e.com>
In-Reply-To: <20100224185530.GA22199@us.ibm.com>
References: <ece181eaa6b6652da66cb42699955e87.squirrel@fela.liber4e.com>
	<20100224185530.GA22199@us.ibm.com>
Date: Thu, 25 Feb 2010 10:36:29 -0000 (GMT)
From: "jose nuno neto" <jose.neto@liber4e.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: Re: [linux-lvm] Mirror fail/recover test
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
To: LVM general discussion and development <linux-lvm@redhat.com>

Much thanks for your interest
im putting more info below

> jose nuno neto [jose.neto@liber4e.com] wrote:
>> Hi
>>
>> I'm trying to test the failure of a SAN Mirrored Lv, and the recover and
>> check for data lost.
>>
>> Im runing RedHat 5.4
>> 2.6.18-164.2.1.el5
>> lvm2-2.02.46-8.el5_4.1
>>
>> I create a 2mirror+log lv ok, can lvconvert to one leg only, can delete
>> ok.
>> But when I simulate a disk fail either with
>> dd if=/dev/zero of=pvmirror_device
>> echo offline > /sys/block/pvmirror_device/device/status
>
> What is the output of "dmsetup status" at this point?
> There must be some messages in the /var/log/messages file if you enable
> them.

This is my setup for the device Im unppluging

multipath -l -v2 | grep -A 7 3600a0b800048f9b200000c2b4b5980b7
mpath12 (3600a0b800048f9b200000c2b4b5980b7) dm-8 SUN,CSM200_R
[size=52G][features=1 queue_if_no_path][hwhandler=1 rdac][rw]
\_ round-robin 0 [prio=0][enabled]
 \_ 7:0:1:1  sdo  8:224  [active][undef]
 \_ 9:0:1:1  sdq  65:0   [active][undef]
\_ round-robin 0 [prio=0][enabled]
 \_ 7:0:0:1  sdd  8:48   [active][undef]
 \_ 9:0:0:1  sdf  8:80   [active][undef]

Before UnPluging
dmsetup status mpath12
0 109051904 multipath 2 0 0 0 2 1 E 0 2 0 8:224 A 0 65:0 A 0 E 0 2 0 8:48
A 0 8:80 A 0

echo offline > /sys/block/sdd/device/state
echo offline > /sys/block/sdo/device/state
echo offline > /sys/block/sdq/device/state
echo offline > /sys/block/sdf/device/state

dmsetup status mpath12
0 109051904 multipath 2 0 0 0 2 1 E 0 2 0 8:224 F 1 65:0 F 1 E 0 2 0 8:48
F 1 8:80 F 1

Feb 25 11:10:32 malta9 multipathd: sdd: rdac checker reports path is down
Feb 25 11:10:32 malta9 multipathd: sdd: rdac checker reports path is down
Feb 25 11:10:32 malta9 multipathd: sdo: rdac checker reports path is down
Feb 25 11:10:32 malta9 multipathd: sdo: rdac checker reports path is down
Feb 25 11:10:32 malta9 multipathd: sdq: rdac checker reports path is down
Feb 25 11:10:32 malta9 multipathd: sdq: rdac checker reports path is down
Feb 25 11:10:32 malta9 multipathd: dm-8: devmap already registered
Feb 25 11:10:32 malta9 multipathd: dm-8: devmap already registered
Feb 25 11:10:52 malta9 multipathd: sdf: rdac checker reports path is down
Feb 25 11:10:52 malta9 multipathd: sdf: rdac checker reports path is down
Feb 25 11:10:52 malta9 multipathd: dm-8: devmap already registered
Feb 25 11:10:52 malta9 multipathd: dm-8: devmap already registered

dmeventd is running
root      4601  0.0  0.1  96272 69668 ?        S<Lsl Feb24   0:00 [dmeventd]

Also I have lvm.conf option
ignore_suspended_devices = 1
that should prevent this right?

>
>> lvs -a -o +devices
>> stills shows the lv has mirrored ( should switch to non-mirrored right?)
>> ,
>
> Yes, provided you successfully started the dmeventd monitoring thread
> and it handled the failure event.
>
> Thanks, Malahal.
>
> _______________________________________________
> linux-lvm mailing list
> linux-lvm@redhat.com
> https://www.redhat.com/mailman/listinfo/linux-lvm
> read the LVM HOW-TO at http://tldp.org/HOWTO/LVM-HOWTO/
>
> --
> This message has been scanned for viruses and
> dangerous content by MailScanner, and is
> believed to be clean.
>

lvm.conf

devices {
    dir = "/dev"
    scan = [ "/dev" ]
    preferred_names = [ ]
    filter = [ "r/disk/", "r/sd.*/", "a/.*/" ]
    cache_dir = "/etc/lvm/cache"
    cache_file_prefix = ""
    write_cache_state = 1
    sysfs_scan = 1
    md_component_detection = 1
    md_chunk_alignment = 1
    data_alignment = 0
    ignore_suspended_devices = 1
}
log {
    verbose = 1
    syslog = 1
    file = "/var/log/lvm2.log"
    overwrite = 0
    level = 0
    indent = 1
    command_names = 1
    prefix = "  "
}
backup {
    backup = 1
    backup_dir = "/etc/lvm/backup"
    archive = 1
    archive_dir = "/etc/lvm/archive"
    retain_min = 10
    retain_days = 30
}
shell {
    history_size = 100
}
global {
    library_dir = "/usr/lib64"
    umask = 077
    test = 0
    units = "h"
    activation = 1
    proc = "/proc"
    locking_type = 1
    fallback_to_clustered_locking = 1
    fallback_to_local_locking = 1
    locking_dir = "/var/lock/lvm"
}
activation {
    missing_stripe_filler = "error"
    reserved_stack = 256
    reserved_memory = 8192
    process_priority = -18
    volume_list = [ "rootvg" , "@cluster.test" ]
    mirror_region_size = 512
    readahead = "auto"
    mirror_log_fault_policy = "allocate"
    mirror_device_fault_policy = "remove"
}
dmeventd {
    mirror_library = "libdevmapper-event-lvm2mirror.so"
    snapshot_library = "libdevmapper-event-lvm2snapshot.so"
}


-- 
This message has been scanned for viruses and
dangerous content by MailScanner, and is
believed to be clean.
