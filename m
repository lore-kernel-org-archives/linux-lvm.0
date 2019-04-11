Date: Thu, 11 Apr 2019 19:25:26 +0200 (CEST)
From: "Lentes, Bernd" <bernd.lentes@helmholtz-muenchen.de>
Message-ID: <1421265263.11965.1555003526525.JavaMail.zimbra@helmholtz-muenchen.de>
In-Reply-To: <37332d31-8ab2-af15-1e0b-cb26a2421603@redhat.com>
References: <1674381816.392064.1554814805982.JavaMail.zimbra@helmholtz-muenchen.de>
	<6d88edff-8ec2-7724-04c2-9909f2013d29@gmail.com>
	<15435045.175922.1554903378472.JavaMail.zimbra@helmholtz-muenchen.de>
	<70292f72-f282-51de-a913-55f579dcef4f@redhat.com>
	<69170546.143990.1554985968570.JavaMail.zimbra@helmholtz-muenchen.de>
	<787104895.51532.1554994161932.JavaMail.zimbra@helmholtz-muenchen.de>
	<37332d31-8ab2-af15-1e0b-cb26a2421603@redhat.com>
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


----- On Apr 11, 2019, at 5:59 PM, Zdenek Kabelac zkabelac@redhat.com wrote:


>>   
>> 
>>>>
>>>> What is the related error message from kernel (IOCTL) - check and show dmesg
>>>> messages. Eventually please supply
>>>>
>>>> 'dmsetup table'
>>>> 'dmsetup status'
>>>> 'dmsetup info -c'
>>>
>>> Hi Zdenek,
>>>
>>> thanks for your support. I managed to delete the snapshot via "dmsetup remove",
>>> but in lvs and lvdisplay it still appears.
>>> And i'm still not able to remove it via lvremove:
>>>
>>> ha-idg-2:~ # lvremove -fv /dev/vg_local/lv_snap_pre_sp4
>>>   connect() failed on local socket: No such file or directory
>>>   Internal cluster locking initialisation failed.
>>>   WARNING: Falling back to local file-based locking.
>>>   Volume Groups with the clustered attribute will be inaccessible.
>>>     Archiving volume group "vg_local" metadata (seqno 26).
>>>     Removing snapshot volume vg_local/lv_snap_pre_sp4.
>>>     Loading table for vg_local-lv_root (254:9).
>>>   device-mapper: reload ioctl on  (254:9) failed: Invalid argument
>>>   Failed to refresh lv_root without snapshot.
>>>
>>> dmesg:
>>> [88310.980351] device-mapper: ioctl: can't change device type after initial
>>> table load.
>>>
>>> dmsetup:
>>> ha-idg-2:~ # dmsetup -c table
>>> vg_local-lv_root-real: 0 209715200 linear 254:4 167774208
>>> vg_local-lv_var: 0 83886080 linear 254:4 83888128
>>> 3600508b1001c5037520913a9b581d78d-part3: 0 2081866639 linear 254:0 262248448
>>> 3600508b1001c5037520913a9b581d78d-part2: 0 262144000 linear 254:0 104448
>>> 3600c0ff00012824b04af7a5201000000: 0 3738281088 multipath 1 queue_if_no_path 1
>>> alua 2 1 service-time 0 1 2 8:32 1 1 service-time 0 1 2 8:16 1 1
>>> 3600508b1001c5037520913a9b581d78d-part1: 0 102400 linear 254:0 2048
>>> 3600c0ff00012824b04af7a5201000000-part3: 0 626951296 linear 254:1 3111329792
>>> 3600c0ff00012824b04af7a5201000000-part2: 0 999999744 linear 254:1 2111328256
>>> vg_local-lv_tmp: 0 83886080 linear 254:4 2048
>>> vg_local-lv_root: 0 209715200 snapshot-origin 254:8
>>> 3600c0ff00012824b04af7a5201000000-part1: 0 2111325952 linear 254:1 2048
>>> 3600508b1001c5037520913a9b581d78d: 0 2344115120 multipath 1 queue_if_no_path 0 1
>>> 1 service-time 0 1 2 8:0 1 1
> 
> 
> Hi
> 
> So here is the reason:
> 
> ioctl: can't change device type after initial table load.
> 
> You already have snapshot-origin in the table - which likely is not what lvm2
> would have expected - you could either try 'lvchange --refresh' to get the dm
> table into matching state - or reboot and start from beginning.
> 
> Clearly you are not supposed to partial modify DM table targets yourself while
> lvm2 holds the metadata state for them - so ATM it looks like lvm2 cannot
> proceed with the command - as the content of DM node is different and
> transition is not allowed.
> 
> lvm2 should probably detect the case sooner and report error about
> incompatible state of device for present metadata (but this will not help
> you to resolve the problem).
> 
> So waht you can do is to probably restore to the metadata you had before
> you've took your snapshot and try change into this table - but looking into
> your current DM table - such transition might be untrivial.
> 
> Is there a reason why you cannot reboot - as that's IMHO the simplest fix??
> 
> Regards
> 
> Zdenek

Hi Zdanek,

it's just that i don't like to reboot a linux system when i have problems, i prefer to find the solution
so that there is no need to reboot. Then i feel a bit as being in front of a windows system :-)).

I rebooted, but problem persists:

ha-idg-2:~ # lvremove -fv /dev/vg_local/lv_snap_pre_sp4
    Logging initialised at Thu Apr 11 19:15:02 2019
    Set umask from 0022 to 0077
lvremove  connect() failed on local socket: No such file or directory
lvremove  Internal cluster locking initialisation failed.
lvremove  WARNING: Falling back to local file-based locking.
lvremove  Volume Groups with the clustered attribute will be inaccessible.
lvremove    Archiving volume group "vg_local" metadata (seqno 26).
lvremove    Removing snapshot volume vg_local/lv_snap_pre_sp4.
lvremove    Loading table for vg_local-lv_root (254:9).
lvremove  device-mapper: reload ioctl on  (254:9) failed: Invalid argument
lvremove  Failed to refresh lv_root without snapshot.

My current config:
ha-idg-2:~ # dmsetup -vc info
Name                                    Maj Min Stat Open Targ Event  UUID
vg_local-lv_root-real                   254   8 L--w    2    1      0 LVM-btzX70eAWIejM6K1bcQnKNmnIOYaTODGt79QZ80zYmQrwddi2BBMObpN1gLssjEF-real
vg_local-lv_var                         254  13 L--w    1    1      0 LVM-btzX70eAWIejM6K1bcQnKNmnIOYaTODGrKrEMyCOt3F1beHksmGkVybX8gjiHtCK
vg_local-lv_snap_pre_sp4-cow            254  10 L--w    1    1      0 LVM-btzX70eAWIejM6K1bcQnKNmnIOYaTODGRANlNEYz9OBICsXXWfDNtFd1kQCovks3-cow
3600508b1001c5037520913a9b581d78d-part3 254   4 L--w    4    1      0 part3-mpath-3600508b1001c5037520913a9b581d78d
vg_local-lv_snap_pre_sp4                254  11 L--w    0    1      0 LVM-btzX70eAWIejM6K1bcQnKNmnIOYaTODGRANlNEYz9OBICsXXWfDNtFd1kQCovks3
3600508b1001c5037520913a9b581d78d-part2 254   3 L--w    2    1      0 part2-mpath-3600508b1001c5037520913a9b581d78d
3600c0ff00012824b04af7a5201000000       254   1 L--w    3    1      0 mpath-3600c0ff00012824b04af7a5201000000
3600508b1001c5037520913a9b581d78d-part1 254   2 L--w    0    1      0 part1-mpath-3600508b1001c5037520913a9b581d78d
3600c0ff00012824b04af7a5201000000-part3 254   7 L--w    0    1      0 part3-mpath-3600c0ff00012824b04af7a5201000000
3600c0ff00012824b04af7a5201000000-part2 254   6 L--w    0    1      0 part2-mpath-3600c0ff00012824b04af7a5201000000
vg_local-lv_tmp                         254  12 L--w    1    1      0 LVM-btzX70eAWIejM6K1bcQnKNmnIOYaTODGjcHjj26T647y1Lh468NGS5GysMiYeG7v
vg_local-lv_root                        254   9 L--w    1    1      0 LVM-btzX70eAWIejM6K1bcQnKNmnIOYaTODGt79QZ80zYmQrwddi2BBMObpN1gLssjEF
3600c0ff00012824b04af7a5201000000-part1 254   5 L--w    0    1      0 part1-mpath-3600c0ff00012824b04af7a5201000000
3600508b1001c5037520913a9b581d78d       254   0 L--w    3    1      0 mpath-3600508b1001c5037520913a9b581d78d

ha-idg-2:~ # lvs
    Logging initialised at Thu Apr 11 19:17:58 2019
    Set umask from 0022 to 0077
lvs  connect() failed on local socket: No such file or directory
lvs  Internal cluster locking initialisation failed.
lvs  WARNING: Falling back to local file-based locking.
lvs  Volume Groups with the clustered attribute will be inaccessible.
lvs  Skipping clustered volume group vg_san
lvs  LV              VG       Attr       LSize   Pool Origin  Data%  Meta%  Move Log Cpy%Sync Convert
lvs  lv_root         vg_local owi-aos--- 100.00g
lvs  lv_snap_pre_sp4 vg_local swi-a-s---  50.00g      lv_root 15.12
lvs  lv_tmp          vg_local -wi-ao----  40.00g
lvs  lv_var          vg_local -wi-ao----  40.00g

output from dmesg:
[  309.203692] device-mapper: ioctl: can't change device type after initial table load.

ha-idg-2:~ # dmsetup table vg_local-lv_root
0 209715200 snapshot-origin 254:8

AFAIK it seems that 254:9 (lv_root) is still snapshot-origin and lvremove
can't change it to linear, right ?

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
