Received: from mx1.redhat.com (mx1.redhat.com [172.16.48.31])
	by int-mx1.corp.redhat.com (8.13.1/8.13.1) with ESMTP id n6FMMWc0019736
	for <linux-lvm@redhat.com>; Wed, 15 Jul 2009 18:22:32 -0400
Received: from mailhost.anl.gov (mailhost.anl.gov [130.202.113.50])
	by mx1.redhat.com (8.13.8/8.13.8) with ESMTP id n6FMMB2i001129
	for <linux-lvm@redhat.com>; Wed, 15 Jul 2009 18:22:11 -0400
Date: Wed, 15 Jul 2009 17:22:07 -0500 (CDT)
From: "Brian E. Finley" <finley@anl.gov>
Message-ID: <21354387.222841247696527230.JavaMail.root@zimbra>
In-Reply-To: <1247695907.9792.26.camel@chandra-ubuntu>
Subject: Re: [linux-lvm] multipath works; lvm on multipath does not
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Reply-To: Brian Elliott Finley <finley@anl.gov>,
	LVM general discussion and development <linux-lvm@redhat.com>
List-Id: LVM general discussion and development <linux-lvm.redhat.com>
List-Unsubscribe: <https://www.redhat.com/mailman/listinfo/linux-lvm>,
	<mailto:linux-lvm-request@redhat.com?subject=unsubscribe>
List-Archive: <https://www.redhat.com/archives/linux-lvm>
List-Post: <mailto:linux-lvm@redhat.com>
List-Help: <mailto:linux-lvm-request@redhat.com?subject=help>
List-Subscribe: <https://www.redhat.com/mailman/listinfo/linux-lvm>,
	<mailto:linux-lvm-request@redhat.com?subject=subscribe>
List-Id: <linux-lvm.redhat.com>
Content-Type: text/plain; charset="us-ascii"
To: sekharan@linux.vnet.ibm.com
Cc: Brian Elliott Finley <finley@anl.gov>, LVM general discussion and development <linux-lvm@redhat.com>

Chandra,

root@zimbra-mb1:~# dmsetup ls
mb1_t1-redo     (254, 4)
zimbra-mb1-t2-v6_fujitsu1-lun68 (254, 29)
zimbra--mb1-home        (254, 19)
zimbra-mb1-t2-v5_fujitsu1-lun67 (254, 24)
mb1_t1-bin      (254, 0)
zimbra-mb1-t2-v4_fujitsu1-lun66 (254, 6)
zimbra--mb1-var (254, 21)
mb1_t2-hsm_store3       (254, 12)
zimbra-mb1-t2-v3_fujitsu1-lun65 (254, 28)
zimbra-mb1-t2-v2_fujitsu1-lun64 (254, 26)
mb1_t2-hsm_store2       (254, 10)
zimbra--mb1-swap        (254, 17)
zimbra-mb1-t2-v1_fujitsu1-lun63 (254, 25)
zimbra--mb1-root        (254, 18)
35000c5000b36aa2b       (254, 11)
mb1_t2-hsm_store1       (254, 7)
mb1_t1-store    (254, 5)
mb1_t1-db       (254, 2)
mb1_t1-log      (254, 1)
35000c5000b15fe7b-part2 (254, 14)
35000c5000b15fe7b-part1 (254, 13)
zimbra-mb1-t1-v4_fujitsu1-lun58 (254, 9)
zimbra-mb1-t1-v3_fujitsu1-lun57 (254, 22)
zimbra-mb1-t1-v2_fujitsu1-lun56 (254, 27)
zimbra-mb1-t1-v1_fujitsu1-lun55 (254, 23)
35000c5000b36aa2b-part2 (254, 16)
35000c5000b15fe7b       (254, 8)
35000c5000b36aa2b-part1 (254, 15)
zimbra--mb1-tmp (254, 20)
mb1_t1-index    (254, 3)


root@zimbra-mb1:~# dmsetup table
mb1_t1-redo: 0 314572800 striped 4 128 8:0 99615104 8:16 99615104 8:32 99615104 8:48 99615104
zimbra-mb1-t2-v6_fujitsu1-lun68: 0 491911168 multipath 1 queue_if_no_path 0 1 1 round-robin 0 4 1 66:112 1000 8:144 1000 65:48 1000 65:208 1000 
zimbra--mb1-home: 0 20971520 linear 9:1 54526336
zimbra-mb1-t2-v5_fujitsu1-lun67: 0 743178240 multipath 1 queue_if_no_path 0 1 1 round-robin 0 4 1 65:32 1000 8:128 1000 65:192 1000 66:96 1000 
mb1_t1-bin: 0 41943040 striped 4 128 8:0 384 8:16 384 8:32 384 8:48 384
zimbra-mb1-t2-v4_fujitsu1-lun66: 0 409600000 multipath 1 queue_if_no_path 0 1 1 round-robin 0 4 1 8:112 1000 65:16 1000 65:176 1000 66:80 1000 
zimbra--mb1-var: 0 41943040 linear 9:1 96469376
mb1_t2-hsm_store3: 0 718585856 linear 65:192 24584576
mb1_t2-hsm_store3: 718585856 329990144 linear 65:208 384
zimbra-mb1-t2-v3_fujitsu1-lun65: 0 409600000 multipath 1 queue_if_no_path 0 1 1 round-robin 0 4 1 8:96 1000 65:0 1000 65:160 1000 66:64 1000 
zimbra-mb1-t2-v2_fujitsu1-lun64: 0 1024000000 multipath 1 queue_if_no_path 0 1 1 round-robin 0 4 1 66:48 1000 8:80 1000 8:240 1000 65:144 1000 
mb1_t2-hsm_store2: 0 1023991808 linear 8:240 384
mb1_t2-hsm_store2: 1023991808 24584192 linear 65:192 384
zimbra--mb1-swap: 0 6291456 linear 9:1 27263360
zimbra-mb1-t2-v1_fujitsu1-lun63: 0 1056964608 multipath 1 queue_if_no_path 0 1 1 round-robin 0 4 1 8:64 1000 8:224 1000 65:128 1000 66:32 1000 
zimbra--mb1-root: 0 20971520 linear 9:1 33554816
35000c5000b36aa2b: 0 286739329 multipath 0 0 1 1 round-robin 0 1 1 66:144 1000 
mb1_t2-hsm_store1: 0 1048576000 linear 8:224 384
mb1_t1-store: 0 419430400 striped 4 128 8:0 178258304 8:16 178258304 8:32 178258304 8:48 178258304
mb1_t1-db: 0 104857600 striped 4 128 8:0 20971904 8:16 20971904 8:32 20971904 8:48 20971904
mb1_t1-log: 0 41943040 striped 4 128 8:0 10486144 8:16 10486144 8:32 10486144 8:48 10486144
35000c5000b15fe7b-part2: 0 286326495 linear 254:8 401625
35000c5000b15fe7b-part1: 0 401562 linear 254:8 63
zimbra-mb1-t1-v4_fujitsu1-lun58: 0 409600000 multipath 1 queue_if_no_path 0 1 1 round-robin 0 4 1 8:48 1000 8:208 1000 65:112 1000 66:16 1000 
zimbra-mb1-t1-v3_fujitsu1-lun57: 0 409600000 multipath 1 queue_if_no_path 0 1 1 round-robin 0 4 1 65:96 1000 8:32 1000 8:192 1000 66:0 1000 
zimbra-mb1-t1-v2_fujitsu1-lun56: 0 409600000 multipath 1 queue_if_no_path 0 1 1 round-robin 0 4 1 8:176 1000 8:16 1000 65:80 1000 65:240 1000 
zimbra-mb1-t1-v1_fujitsu1-lun55: 0 409600000 multipath 1 queue_if_no_path 0 1 1 round-robin 0 4 1 8:0 1000 8:160 1000 65:64 1000 65:224 1000 
35000c5000b36aa2b-part2: 0 286326495 linear 254:11 401625
35000c5000b15fe7b: 0 286739329 multipath 0 0 1 1 round-robin 0 1 1 66:128 1000 
35000c5000b36aa2b-part1: 0 401562 linear 254:11 63
zimbra--mb1-tmp: 0 20971520 linear 9:1 75497856
mb1_t1-index: 0 209715200 striped 4 128 8:0 47186304 8:16 47186304 8:32 47186304 8:48 47186304


Thanks, -Brian


----- Original Message -----
From: "Chandra Seetharaman" <sekharan@us.ibm.com>
To: "Brian Elliott Finley" <finley@anl.gov>, "LVM general discussion and development" <linux-lvm@redhat.com>
Sent: Wednesday, July 15, 2009 5:11:47 PM GMT -06:00 US/Canada Central
Subject: Re: [linux-lvm] multipath works; lvm on multipath does not

Can you send the o/p of "dmsetup ls" and "dmsetup table"

On Wed, 2009-07-15 at 16:53 -0500, finley@anl.gov wrote:
> How can I tell what is causing LVM on multipath volumes to fail, while direct multipath volumes are working?
> 
> 
> The details:
> 
> I have several volumes that are multipathed over fibre channel (2 qlogic cards in the host) from a Fujitsu Eternus 4000 (4 controllers).  
> 
> When using a file system mounted on the dm-multipath device directly (Ie.: generating I/O via IOZone), it fails over gracefully when I pull out either of the fibre pairs, and the file system continues to operate.  This device is called /dev/mapper/zimbra-mb1-t2-v4_fujitsu1-lun66.
> 
> However, when I access an LVM volume created with sister devices as PVs, the LVM presented volume does not fail over.  Rather the LV device goes inaccessible and the file system (ext3) re-mounts itself as read-only.  If I try to access any of the underlying PVs, they still respond as available (Ie.: fdisk -l $PV).
> 
> I am not seeing duplicate devices, and am using the following filter in /etc/lvm/lvm.conf:
> 
>  filter = [ "a|^/dev/md.*|", "a|^/dev/mapper/zimbra-mb.*-t.*-v.*_.*-lun.*|", "r|.*|" ]
> 
> 
> I have also added the following, but dm-multipath devices seem usable by LVM with or without this setting:
> 
>   types = [ "device-mapper", 1 ]
> 
> 
> I have tried removing the /etc/lvm/cache/.cache file, but that seems to have had no effect.  I've also tried re-building the initrd after modifying the lvm.conf file, also with no effect.
> 
> Additional info:
> root@zimbra-mb1:~# pvs
>   PV                                          VG         Fmt  Attr PSize   PFree  
>   /dev/mapper/zimbra-mb1-t1-v1_fujitsu1-lun55 mb1_t1     lvm2 a-   195.31G  60.31G
>   /dev/mapper/zimbra-mb1-t1-v2_fujitsu1-lun56 mb1_t1     lvm2 a-   195.31G  60.31G
>   /dev/mapper/zimbra-mb1-t1-v3_fujitsu1-lun57 mb1_t1     lvm2 a-   195.31G  60.31G
>   /dev/mapper/zimbra-mb1-t1-v4_fujitsu1-lun58 mb1_t1     lvm2 a-   195.31G  60.31G
>   /dev/mapper/zimbra-mb1-t2-v1_fujitsu1-lun63 mb1_t2     lvm2 a-   504.00G   4.00G
>   /dev/mapper/zimbra-mb1-t2-v2_fujitsu1-lun64 mb1_t2     lvm2 a-   488.28G      0 
>   /dev/mapper/zimbra-mb1-t2-v3_fujitsu1-lun65 mb1_t2     lvm2 a-   195.31G 195.31G
>   /dev/mapper/zimbra-mb1-t2-v5_fujitsu1-lun67 mb1_t2     lvm2 a-   354.37G      0 
>   /dev/mapper/zimbra-mb1-t2-v6_fujitsu1-lun68 mb1_t2     lvm2 a-   234.56G  77.21G
>   /dev/md1                                    zimbra-mb1 lvm2 a-   136.50G  83.50G
> 
> 
> 
> kernel version:  2.6.24-24-server
> distoro:         Ubuntu Hardy
> multipath-tools: 0.4.8-7ubuntu2
> lvm2:            2.02.26-1ubuntu9
> 
> Thanks!
> 
> -Brian
> 
> _______________________________________________
> linux-lvm mailing list
> linux-lvm@redhat.com
> https://www.redhat.com/mailman/listinfo/linux-lvm
> read the LVM HOW-TO at http://tldp.org/HOWTO/LVM-HOWTO/


-- 
Brian Elliott Finley
Unix, Storage, and Operations Deputy Manager
Computing and Information Systems
Argonne National Laboratory
Office: 630.252.4742  Mobile: 630.447.9108
