Received: from mx1.redhat.com (ext-mx16.extmail.prod.ext.phx2.redhat.com
	[10.5.110.45])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id BAF8760A35
	for <linux-lvm@redhat.com>; Fri, 11 Oct 2019 08:23:59 +0000 (UTC)
Received: from m4a0041g.houston.softwaregrp.com
	(m4a0041g.houston.softwaregrp.com [15.124.2.87])
	(using TLSv1.2 with cipher DHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mx1.redhat.com (Postfix) with ESMTPS id 958D23082A6C
	for <linux-lvm@redhat.com>; Fri, 11 Oct 2019 08:23:57 +0000 (UTC)
Received: FROM m4a0041g.houston.softwaregrp.com (15.120.17.147) BY
	m4a0041g.houston.softwaregrp.com WITH ESMTP FOR linux-lvm@redhat.com;
	Fri, 11 Oct 2019 08:21:42 +0000
From: Heming Zhao <heming.zhao@suse.com>
Date: Fri, 11 Oct 2019 08:11:29 +0000
Message-ID: <6b055125-2e06-df7d-89fa-6c347404a9cd@suse.com>
References: <CH2PR18MB32067A650CBE520D9A0DC547CFB10@CH2PR18MB3206.namprd18.prod.outlook.com>
In-Reply-To: <CH2PR18MB32067A650CBE520D9A0DC547CFB10@CH2PR18MB3206.namprd18.prod.outlook.com>
Content-Language: en-US
Content-ID: <A17D706D825ADF46BE1978F56144218C@namprd18.prod.outlook.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: Re: [linux-lvm] pvresize will cause a meta-data corruption with
 error message "Error writing device at 4096 length 512"
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
To: LVM general discussion and development <linux-lvm@redhat.com>, Gang He <GHe@suse.com>

Hello list,

I analyze this issue for some days. It looks a new bug.

trigger steps:
user execute pvresize to enlarge the pv.
After the command execution, one disk lvm metadata was overwrite by another disk lvm metadata.

once log (execute pvresize cmd), there are 7 disk occur read/write failed:
```
scsi-360060e80072a670000302a670000fc68
scsi-360060e80072a670000302a670000fc67
scsi-360060e80072a670000302a670000fc66
scsi-360060e80072a660000302a660000f74c
scsi-360060e80072a660000302a660000f74a
scsi-360060e80072a660000302a660000f749
scsi-360060e80072a660000302a660000f748 (has fc68 metadata)
```
the f748 metadata was overwritten by fc68.


the fc67 fc66 f74c f74a f749 f748 error log are same:
```
#toollib.c:4377          Processing PVs in VG vgpocdbcdb1_r1
#locking/locking.c:331           Dropping cache for vgpocdbcdb1_r1.
#misc/lvm-flock.c:202         Locking /run/lvm/lock/V_vgpocdbcdb1_r1 WB
#misc/lvm-flock.c:100           _do_flock /run/lvm/lock/V_vgpocdbcdb1_r1:aux WB
#misc/lvm-flock.c:100           _do_flock /run/lvm/lock/V_vgpocdbcdb1_r1 WB
#misc/lvm-flock.c:47            _undo_flock /run/lvm/lock/V_vgpocdbcdb1_r1:aux
#metadata/metadata.c:3778        Reading VG vgpocdbcdb1_r1 tTwjvG-xxxx-FA0cJj
#metadata/metadata.c:3874          Rescanning devices for vgpocdbcdb1_r1
#cache/lvmcache.c:751           lvmcache has no info for vgname "vgpocdbcdb1_r1" with VGID tTwjvGfl1zsU6gODANVsela1siFA0cJj.
#label/label.c:629           Scanning 1 devices for VG info
#label/label.c:665           Scanning submitted 1 reads
#label/label.c:674           Scan failed to read /dev/disk/by-id/scsi-360060e80072a670000302a670000fc67 error 0.
#device/bcache.c:189     WRITE last fd 36 last_offset 4608 last_sector_size 512
#device/bcache.c:244           Limit write at 0 len 131072 to len 4608
#label/label.c:764           Scanned devices: read errors 1 process errors 0 failed 1
#cache/lvmcache.c:751           lvmcache has no info for vgname "vgpocdbcdb1_r1" with VGID tTwjvGfl1zsU6gODANVsela1siFA0cJj.
#cache/lvmcache.c:1410    VG info not found after rescan of vgpocdbcdb1_r1
#cache/lvmcache.c:751           lvmcache has no info for vgname "vgpocdbcdb1_r1" with VGID tTwjvGfl1zsU6gODANVsela1siFA0cJj.
#metadata/metadata.c:3884          Cache did not find fmt for vgname vgpocdbcdb1_r1
#metadata/metadata.c:3885          <backtrace>
#metadata/metadata.c:4518          <backtrace>
```

the fc68 error log is in below <1> subsection.


 From all the log files, user's disk have 3 classes issues:

1> disk (fc68) has old lvm extension header.

It will trigger lvm write action to update PV header (metadata area).

related log:
```
#format_text/text_label.c:423           /dev/disk/by-id/scsi-360060e80072a670000302a670000fc68: PV header extension version 1 found
... ...
#metadata/metadata.c:2842          PV /dev/disk/by-id/scsi-360060e80072a670000302a670000fc68 has old extension header, updating to newest version.
```

In user machine, this write action was failed, the PV header data (first 4K) save in bcache (cache->errored list), and then write (by bcache_flush) to another disk (f748).

related error log:
```
#format_text/format-text.c:1470          Creating metadata area on /dev/disk/by-id/scsi-360060e80072a670000302a670000fc68 at sector 8 size 2040 sectors
#device/bcache.c:189     WRITE last fd 36 last_offset 4608 last_sector_size 512
#device/bcache.c:244           Limit write at 0 len 131072 to len 4608
#label/label.c:1333    Error writing device /dev/disk/by-id/scsi-360060e80072a670000302a670000fc68 at 4096 length 512.
#format_text/format-text.c:407     Failed to write mda header to /dev/disk/by-id/scsi-360060e80072a670000302a670000fc68 fd -1
```

related code:
pvresize
  process_each_pv
   _process_pvs_in_vgs
    vg_read
     vg_read_internal
      _vg_read
       _vg_update_old_pv_ext_if_needed
        +-> pv_needs_rewrite is 1
        |    set vg->pv_write_list
        +-> vg_write
    ||
    \/
vg_write
  pv_write //vg->pv_write_list is not empty.
   pv->fmt->ops->pv_write
    _text_pv_write
     lvmcache_foreach_mda(info, _write_single_mda, &baton)
      _raw_write_mda_header

static int  _raw_write_mda_header ()
{
     ... ...
     dev_set_last_byte(dev, start_byte + MDA_HEADER_SIZE);

     if (!dev_write_bytes(dev, start_byte, MDA_HEADER_SIZE, mdah)) {
         dev_unset_last_byte(dev); //zhm: useless, fd = -1 now!!
         return 0;
     }
     dev_unset_last_byte(dev);

     return 1;
}

If dev_write_bytes failed, the bcache never clean last_byte. and the fd is closed at same time, but cache->errored still have errored fd's data. later lvm open new disk, the fd may reuse the old-errored fd number, error data will be written when later lvm call bcache_flush.

2> duplicated pv header.
    as <1> description, fc68 metadata was overwritten to f748.
    this cause by lvm bug (I said in <1>).

3> device not correct
    I don't know why the disk scsi-360060e80072a670000302a670000fc68 has below wrong metadata:

pre_pvr/scsi-360060e80072a670000302a670000fc68
(please also read the comments in below metadata area.)
```
     vgpocdbcdb1_r2 {
         id = "PWd17E-xxx-oANHbq"
         seqno = 20
         format = "lvm2"
         status = ["RESIZEABLE", "READ", "WRITE"]
         flags = []
         extent_size = 65536
         max_lv = 0
         max_pv = 0
         metadata_copies = 0
         
         physical_volumes {
             
             pv0 {
                 id = "3KTOW5-xxxx-8g0Rf2"
                 device = "/dev/disk/by-id/scsi-360060e80072a660000302a660000f768"
                                                                     Wrong!! ^^^^^
                          I don't know why there is f768, please ask customer
                 status = ["ALLOCATABLE"]
                 flags = []
                 dev_size = 860160
                 pe_start = 2048
                 pe_count = 13
             }
         }
```
    fc68 => f768  the 'c' (b1100) change to '7' (b0111).
    maybe disk bit overturn, maybe lvm has bug. I don't know & have no idea.

Thanks
zhm

On 9/11/19 5:17 PM, Gang He wrote:
> Hello List,
> 
> Our user encountered a meta-data corruption problem, when run pvresize command after upgrading to LVM2 v2.02.180 from v2.02.120.
> 
> The details are as below,
> we have following environment:
> - Storage: HP XP7 (SAN) - LUN's are presented to ESX via RDM
> - VMWare ESXi 6.5
> - SLES 12 SP 4 Guest
> 
> Resize happened this way (is our standard way since years) - however - this is our first resize after upgrading SLES 12 SP3 to SLES 12 SP4 - until this upgrade, we
> never had a problem like this:
> - split continous access on storage box, resize lun on XP7
> - recreate ca on XP7
> - scan on ESX
> - rescan-scsi-bus.sh -s on SLES VM
> - pvresize  ( at this step the error happened)
> 
> huns1vdb01:~ # pvresize /dev/disk/by-id/scsi-360060e80072a660000302a6600003274
