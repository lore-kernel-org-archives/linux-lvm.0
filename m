Date: Thu, 11 Apr 2019 16:49:21 +0200 (CEST)
From: "Lentes, Bernd" <bernd.lentes@helmholtz-muenchen.de>
Message-ID: <787104895.51532.1554994161932.JavaMail.zimbra@helmholtz-muenchen.de>
In-Reply-To: <69170546.143990.1554985968570.JavaMail.zimbra@helmholtz-muenchen.de>
References: <1674381816.392064.1554814805982.JavaMail.zimbra@helmholtz-muenchen.de>
	<6d88edff-8ec2-7724-04c2-9909f2013d29@gmail.com>
	<15435045.175922.1554903378472.JavaMail.zimbra@helmholtz-muenchen.de>
	<70292f72-f282-51de-a913-55f579dcef4f@redhat.com>
	<69170546.143990.1554985968570.JavaMail.zimbra@helmholtz-muenchen.de>
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Subject: Re: [linux-lvm] can't remove snapshot
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
To: "LVM Mailingliste, (RedHat)" <linux-lvm@redhat.com>
Cc: Zdenek Kabelac <zkabelac@redhat.com>

----- On Apr 11, 2019, at 2:32 PM, Bernd Lentes bernd.lentes@helmholtz-muenchen.de wrote:

> ----- On Apr 11, 2019, at 1:09 PM, Zdenek Kabelac zkabelac@redhat.com wrote:
> 
> 
>>>>> Hello list,
>>>>>
>>>>> I have a two-node HA-cluster which uses local and cluster LVM.
>>>>> cLVM is currently stopped, I try to remove a snapshot from the root lv which
>>>>> is located on a local VG.
>>>>> I get this error:
>>>>> ha-idg-2:/mnt/spp # lvremove -fv vg_local/lv_snap_pre_sp4
>>>>>     connect() failed on local socket: No such file or directory
>>>>>     Internal cluster locking initialisation failed.
>>>>>     WARNING: Falling back to local file-based locking.
>>>>>     Volume Groups with the clustered attribute will be inaccessible.
>>>>>       Archiving volume group "vg_local" metadata (seqno 26).
>>>>>       Removing snapshot volume vg_local/lv_snap_pre_sp4.
>>>>>       Loading table for vg_local-lv_root (254:8).
>>>>>     device-mapper: reload ioctl on  (254:8) failed: Invalid argument
>>>>>     Failed to refresh lv_root without snapshot.
>>>>>
>>>>
 

>> 
>> What is the related error message from kernel (IOCTL) - check and show dmesg
>> messages. Eventually please supply
>> 
>> 'dmsetup table'
>> 'dmsetup status'
>> 'dmsetup info -c'
> 
> Hi Zdenek,
> 
> thanks for your support. I managed to delete the snapshot via "dmsetup remove",
> but in lvs and lvdisplay it still appears.
> And i'm still not able to remove it via lvremove:
> 
> ha-idg-2:~ # lvremove -fv /dev/vg_local/lv_snap_pre_sp4
>  connect() failed on local socket: No such file or directory
>  Internal cluster locking initialisation failed.
>  WARNING: Falling back to local file-based locking.
>  Volume Groups with the clustered attribute will be inaccessible.
>    Archiving volume group "vg_local" metadata (seqno 26).
>    Removing snapshot volume vg_local/lv_snap_pre_sp4.
>    Loading table for vg_local-lv_root (254:9).
>  device-mapper: reload ioctl on  (254:9) failed: Invalid argument
>  Failed to refresh lv_root without snapshot.
> 
> dmesg:
> [88310.980351] device-mapper: ioctl: can't change device type after initial
> table load.
> 
> dmsetup:
> ha-idg-2:~ # dmsetup -c table
> vg_local-lv_root-real: 0 209715200 linear 254:4 167774208
> vg_local-lv_var: 0 83886080 linear 254:4 83888128
> 3600508b1001c5037520913a9b581d78d-part3: 0 2081866639 linear 254:0 262248448
> 3600508b1001c5037520913a9b581d78d-part2: 0 262144000 linear 254:0 104448
> 3600c0ff00012824b04af7a5201000000: 0 3738281088 multipath 1 queue_if_no_path 1
> alua 2 1 service-time 0 1 2 8:32 1 1 service-time 0 1 2 8:16 1 1
> 3600508b1001c5037520913a9b581d78d-part1: 0 102400 linear 254:0 2048
> 3600c0ff00012824b04af7a5201000000-part3: 0 626951296 linear 254:1 3111329792
> 3600c0ff00012824b04af7a5201000000-part2: 0 999999744 linear 254:1 2111328256
> vg_local-lv_tmp: 0 83886080 linear 254:4 2048
> vg_local-lv_root: 0 209715200 snapshot-origin 254:8
> 3600c0ff00012824b04af7a5201000000-part1: 0 2111325952 linear 254:1 2048
> 3600508b1001c5037520913a9b581d78d: 0 2344115120 multipath 1 queue_if_no_path 0 1
> 1 service-time 0 1 2 8:0 1 1
> 
> ha-idg-2:~ # dmsetup -c status
> vg_local-lv_root-real: 0 209715200 linear
> vg_local-lv_var: 0 83886080 linear
> 3600508b1001c5037520913a9b581d78d-part3: 0 2081866639 linear
> 3600508b1001c5037520913a9b581d78d-part2: 0 262144000 linear
> 3600c0ff00012824b04af7a5201000000: 0 3738281088 multipath 2 0 1 0 2 1 A 0 1 2
> 8:32 A 0 0 1 E 0 1 2 8:16 A 0 0 1
> 3600508b1001c5037520913a9b581d78d-part1: 0 102400 linear
> 3600c0ff00012824b04af7a5201000000-part3: 0 626951296 linear
> 3600c0ff00012824b04af7a5201000000-part2: 0 999999744 linear
> vg_local-lv_tmp: 0 83886080 linear
> vg_local-lv_root: 0 209715200 snapshot-origin
> 3600c0ff00012824b04af7a5201000000-part1: 0 2111325952 linear
> 3600508b1001c5037520913a9b581d78d: 0 2344115120 multipath 2 0 0 0 1 1 A 0 1 2
> 8:0 A 0 0 1
> 
> ha-idg-2:~ # dmsetup -c info
> Name                                    Maj Min Stat Open Targ Event  UUID
> vg_local-lv_root-real                   254   8 L--w    1    1      0
> LVM-btzX70eAWIejM6K1bcQnKNmnIOYaTODGt79QZ80zYmQrwddi2BBMObpN1gLssjEF-real
> vg_local-lv_var                         254  13 L--w    1    1      0
> LVM-btzX70eAWIejM6K1bcQnKNmnIOYaTODGrKrEMyCOt3F1beHksmGkVybX8gjiHtCK
> 3600508b1001c5037520913a9b581d78d-part3 254   4 L--w    3    1      0
> part3-mpath-3600508b1001c5037520913a9b581d78d
> 3600508b1001c5037520913a9b581d78d-part2 254   3 L--w    2    1      0
> part2-mpath-3600508b1001c5037520913a9b581d78d
> 3600c0ff00012824b04af7a5201000000       254   1 L--w    3    1      0
> mpath-3600c0ff00012824b04af7a5201000000
> 3600508b1001c5037520913a9b581d78d-part1 254   2 L--w    0    1      0
> part1-mpath-3600508b1001c5037520913a9b581d78d
> 3600c0ff00012824b04af7a5201000000-part3 254   7 L--w    0    1      0
> part3-mpath-3600c0ff00012824b04af7a5201000000
> 3600c0ff00012824b04af7a5201000000-part2 254   6 L--w    0    1      0
> part2-mpath-3600c0ff00012824b04af7a5201000000
> vg_local-lv_tmp                         254  12 L--w    1    1      0
> LVM-btzX70eAWIejM6K1bcQnKNmnIOYaTODGjcHjj26T647y1Lh468NGS5GysMiYeG7v
> vg_local-lv_root                        254   9 L--w    1    1      0
> LVM-btzX70eAWIejM6K1bcQnKNmnIOYaTODGt79QZ80zYmQrwddi2BBMObpN1gLssjEF
> 3600c0ff00012824b04af7a5201000000-part1 254   5 L--w    0    1      0
> part1-mpath-3600c0ff00012824b04af7a5201000000
> 3600508b1001c5037520913a9b581d78d       254   0 L--w    3    1      0
> mpath-3600508b1001c5037520913a9b581d78d
> 
> 


Hi,

some more information, maybe helpful:
strace lvremove -fvvvv /dev/vg_local/lv_snap_pre_sp4

 ...

write(2, "#ioctl/libdm-iface.c:1857       "..., 35#ioctl/libdm-iface.c:1857          ) = 35
write(2, "dm reload   (254:9) [ noopencoun"..., 56dm reload   (254:9) [ noopencount flush ]   [16384] (*1)) = 56
write(2, "\n", 1) = 1

ioctl(3, DM_TABLE_LOAD, 0x563c294d2c90) = -1 EINVAL (Invalid argument)   <===========


write(2, "#ioctl/libdm-iface.c:1895    ", 29#ioctl/libdm-iface.c:1895    ) = 29
write(2, "device-mapper: reload ioctl on  "..., 64device-mapper: reload ioctl on  (254:9) failed: Invalid argument) = 64
write(2, "\n", 1)                       = 1
write(2, "#libdm-deptree.c:2846          ", 31#libdm-deptree.c:2846          ) = 31
write(2, "<backtrace>", 11<backtrace>)             = 11
write(2, "\n", 1)                       = 1
write(2, "#activate/dev_manager.c:3291    "..., 38#activate/dev_manager.c:3291          ) = 38
write(2, "<backtrace>", 11<backtrace>)             = 11
write(2, "\n", 1)                       = 1
write(2, "#activate/dev_manager.c:3346    "..., 38#activate/dev_manager.c:3346          ) = 38
write(2, "<backtrace>", 11<backtrace>)             = 11
write(2, "\n", 1)                       = 1
write(2, "#activate/activate.c:1406       "..., 35#activate/activate.c:1406          ) = 35
write(2, "<backtrace>", 11<backtrace>)             = 11
write(2, "\n", 1)                       = 1

Bernd
 

Helmholtz Zentrum Muenchen
Deutsches Forschungszentrum fuer Gesundheit und Umwelt (GmbH)
Ingolstaedter Landstr. 1
85764 Neuherberg
www.helmholtz-muenchen.de
Stellv. Aufsichtsratsvorsitzender: MinDirig. Dr. Manfred Wolter
Geschaeftsfuehrung: Prof. Dr. med. Dr. h.c. Matthias Tschoep, Heinrich Bassler, Kerstin Guenther
Registergericht: Amtsgericht Muenchen HRB 6466
USt-IdNr: DE 129521671
