Date: Thu, 11 Apr 2019 14:32:48 +0200 (CEST)
From: "Lentes, Bernd" <bernd.lentes@helmholtz-muenchen.de>
Message-ID: <69170546.143990.1554985968570.JavaMail.zimbra@helmholtz-muenchen.de>
In-Reply-To: <70292f72-f282-51de-a913-55f579dcef4f@redhat.com>
References: <1674381816.392064.1554814805982.JavaMail.zimbra@helmholtz-muenchen.de>
	<6d88edff-8ec2-7724-04c2-9909f2013d29@gmail.com>
	<15435045.175922.1554903378472.JavaMail.zimbra@helmholtz-muenchen.de>
	<70292f72-f282-51de-a913-55f579dcef4f@redhat.com>
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
To: Zdenek Kabelac <zkabelac@redhat.com>
Cc: "LVM Mailingliste, (RedHat)" <linux-lvm@redhat.com>



----- On Apr 11, 2019, at 1:09 PM, Zdenek Kabelac zkabelac@redhat.com wrote:


>>>> Hello list,
>>>>
>>>> I have a two-node HA-cluster which uses local and cluster LVM.
>>>> cLVM is currently stopped, I try to remove a snapshot from the root lv which
>>>> is located on a local VG.
>>>> I get this error:
>>>> ha-idg-2:/mnt/spp # lvremove -fv vg_local/lv_snap_pre_sp4
>>>>     connect() failed on local socket: No such file or directory
>>>>     Internal cluster locking initialisation failed.
>>>>     WARNING: Falling back to local file-based locking.
>>>>     Volume Groups with the clustered attribute will be inaccessible.
>>>>       Archiving volume group "vg_local" metadata (seqno 26).
>>>>       Removing snapshot volume vg_local/lv_snap_pre_sp4.
>>>>       Loading table for vg_local-lv_root (254:8).
>>>>     device-mapper: reload ioctl on  (254:8) failed: Invalid argument
>>>>     Failed to refresh lv_root without snapshot.
>>>>
>>>
>>> Hi
>>>
>>> Have you tried to converted clustered VG to be a non-clustered one ?
>>> And use file locking to proceed with operation on local device?
>>>
>>> Zdenek
>> 
>> Hi,
>> 
>> i tried all i found on the net.
>> Stopping udev before lvremove, dmsetup remove before, lock the device with
>> lockdev,
>> tried to deactivate the snapshot before removing (which didn't work because then
>> i also had
>> to deactivate the root lv which is the source for the snapshot),
>> stopped monitoring the snapshot, update of the complete system ...
>> nothing succeeded.
>> I have a SLES 12 SP4 with 4.12.14-95.13-default and lvm2-2.02.180-9.7.1.x86_64.
>> 
>> I finally did a strace on the program:
>>   ...
>> write(2, "Loading table for vg_local-lv_ro"..., 43Loading table for
>> vg_local-lv_root (254:9).) = 43
>> write(2, "\n", 1
>> )                       = 1
>> ioctl(3, DM_TABLE_STATUS, 0x563eacb00c80) = 0
>> ioctl(3, DM_TABLE_LOAD, 0x563eacb00c80) = -1 EINVAL (Invalid argument)
>> <========================================================
>> write(2, "  ", 2  )                       = 2
>> write(2, "device-mapper: reload ioctl on  "..., 64device-mapper: reload ioctl on
>> (254:9) failed: Invalid argument) = 64
>> write(2, "\n", 1
>> )                       = 1
>> brk(0x563eacf92000)                     = 0x563eacf92000
>> write(2, "  ", 2  )                       = 2
>> write(2, "Failed to refresh lv_root withou"..., 43Failed to refresh lv_root
>> without snapshot.) = 43
>> write(2, "\n", 1
>> )                       = 1
>> 
>> This seems to be the culprit:
>> ioctl(3, DM_TABLE_LOAD, 0x563eacb00c80) = -1 EINVAL
>> 
>> fd 3 seems to be /dev/mapper/control. DM_TABLE_LOAD is defined in
>> include/uapi/linux/dm-ioctl.h:
>> #define DM_TABLE_LOAD    _IOWR(DM_IOCTL, DM_TABLE_LOAD_CMD, struct dm_ioctl)
>> And the memory adress is the same as the one used successfully one line before.
>> Error -1 is, following man:
>> EINVAL: request or argp is not valid
>> In the manpage sys/ioctl.h is mentioned, but i don't find it in my sources.
>> 
> 
> What is the related error message from kernel (IOCTL) - check and show dmesg
> messages. Eventually please supply
> 
> 'dmsetup table'
> 'dmsetup status'
> 'dmsetup info -c'

Hi Zdenek,

thanks for your support. I managed to delete the snapshot via "dmsetup remove",
but in lvs and lvdisplay it still appears.
And i'm still not able to remove it via lvremove:

ha-idg-2:~ # lvremove -fv /dev/vg_local/lv_snap_pre_sp4
  connect() failed on local socket: No such file or directory
  Internal cluster locking initialisation failed.
  WARNING: Falling back to local file-based locking.
  Volume Groups with the clustered attribute will be inaccessible.
    Archiving volume group "vg_local" metadata (seqno 26).
    Removing snapshot volume vg_local/lv_snap_pre_sp4.
    Loading table for vg_local-lv_root (254:9).
  device-mapper: reload ioctl on  (254:9) failed: Invalid argument
  Failed to refresh lv_root without snapshot.

dmesg:
[88310.980351] device-mapper: ioctl: can't change device type after initial table load.

dmsetup:
ha-idg-2:~ # dmsetup -c table
vg_local-lv_root-real: 0 209715200 linear 254:4 167774208
vg_local-lv_var: 0 83886080 linear 254:4 83888128
3600508b1001c5037520913a9b581d78d-part3: 0 2081866639 linear 254:0 262248448
3600508b1001c5037520913a9b581d78d-part2: 0 262144000 linear 254:0 104448
3600c0ff00012824b04af7a5201000000: 0 3738281088 multipath 1 queue_if_no_path 1 alua 2 1 service-time 0 1 2 8:32 1 1 service-time 0 1 2 8:16 1 1
3600508b1001c5037520913a9b581d78d-part1: 0 102400 linear 254:0 2048
3600c0ff00012824b04af7a5201000000-part3: 0 626951296 linear 254:1 3111329792
3600c0ff00012824b04af7a5201000000-part2: 0 999999744 linear 254:1 2111328256
vg_local-lv_tmp: 0 83886080 linear 254:4 2048
vg_local-lv_root: 0 209715200 snapshot-origin 254:8
3600c0ff00012824b04af7a5201000000-part1: 0 2111325952 linear 254:1 2048
3600508b1001c5037520913a9b581d78d: 0 2344115120 multipath 1 queue_if_no_path 0 1 1 service-time 0 1 2 8:0 1 1

ha-idg-2:~ # dmsetup -c status
vg_local-lv_root-real: 0 209715200 linear
vg_local-lv_var: 0 83886080 linear
3600508b1001c5037520913a9b581d78d-part3: 0 2081866639 linear
3600508b1001c5037520913a9b581d78d-part2: 0 262144000 linear
3600c0ff00012824b04af7a5201000000: 0 3738281088 multipath 2 0 1 0 2 1 A 0 1 2 8:32 A 0 0 1 E 0 1 2 8:16 A 0 0 1
3600508b1001c5037520913a9b581d78d-part1: 0 102400 linear
3600c0ff00012824b04af7a5201000000-part3: 0 626951296 linear
3600c0ff00012824b04af7a5201000000-part2: 0 999999744 linear
vg_local-lv_tmp: 0 83886080 linear
vg_local-lv_root: 0 209715200 snapshot-origin
3600c0ff00012824b04af7a5201000000-part1: 0 2111325952 linear
3600508b1001c5037520913a9b581d78d: 0 2344115120 multipath 2 0 0 0 1 1 A 0 1 2 8:0 A 0 0 1

ha-idg-2:~ # dmsetup -c info
Name                                    Maj Min Stat Open Targ Event  UUID
vg_local-lv_root-real                   254   8 L--w    1    1      0 LVM-btzX70eAWIejM6K1bcQnKNmnIOYaTODGt79QZ80zYmQrwddi2BBMObpN1gLssjEF-real
vg_local-lv_var                         254  13 L--w    1    1      0 LVM-btzX70eAWIejM6K1bcQnKNmnIOYaTODGrKrEMyCOt3F1beHksmGkVybX8gjiHtCK
3600508b1001c5037520913a9b581d78d-part3 254   4 L--w    3    1      0 part3-mpath-3600508b1001c5037520913a9b581d78d
3600508b1001c5037520913a9b581d78d-part2 254   3 L--w    2    1      0 part2-mpath-3600508b1001c5037520913a9b581d78d
3600c0ff00012824b04af7a5201000000       254   1 L--w    3    1      0 mpath-3600c0ff00012824b04af7a5201000000
3600508b1001c5037520913a9b581d78d-part1 254   2 L--w    0    1      0 part1-mpath-3600508b1001c5037520913a9b581d78d
3600c0ff00012824b04af7a5201000000-part3 254   7 L--w    0    1      0 part3-mpath-3600c0ff00012824b04af7a5201000000
3600c0ff00012824b04af7a5201000000-part2 254   6 L--w    0    1      0 part2-mpath-3600c0ff00012824b04af7a5201000000
vg_local-lv_tmp                         254  12 L--w    1    1      0 LVM-btzX70eAWIejM6K1bcQnKNmnIOYaTODGjcHjj26T647y1Lh468NGS5GysMiYeG7v
vg_local-lv_root                        254   9 L--w    1    1      0 LVM-btzX70eAWIejM6K1bcQnKNmnIOYaTODGt79QZ80zYmQrwddi2BBMObpN1gLssjEF
3600c0ff00012824b04af7a5201000000-part1 254   5 L--w    0    1      0 part1-mpath-3600c0ff00012824b04af7a5201000000
3600508b1001c5037520913a9b581d78d       254   0 L--w    3    1      0 mpath-3600508b1001c5037520913a9b581d78d


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
