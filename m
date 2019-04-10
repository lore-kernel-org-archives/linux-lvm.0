Received: from mx1.redhat.com (ext-mx07.extmail.prod.ext.phx2.redhat.com
	[10.5.110.31])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 82F325D96E
	for <linux-lvm@redhat.com>; Wed, 10 Apr 2019 13:36:24 +0000 (UTC)
Received: from mtaextp1.scidom.de (mtaextp1.scidom.de [146.107.103.20])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mx1.redhat.com (Postfix) with ESMTPS id C524AC0798ED
	for <linux-lvm@redhat.com>; Wed, 10 Apr 2019 13:36:21 +0000 (UTC)
Date: Wed, 10 Apr 2019 15:36:18 +0200 (CEST)
From: "Lentes, Bernd" <bernd.lentes@helmholtz-muenchen.de>
Message-ID: <15435045.175922.1554903378472.JavaMail.zimbra@helmholtz-muenchen.de>
In-Reply-To: <6d88edff-8ec2-7724-04c2-9909f2013d29@gmail.com>
References: <1674381816.392064.1554814805982.JavaMail.zimbra@helmholtz-muenchen.de>
	<6d88edff-8ec2-7724-04c2-9909f2013d29@gmail.com>
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
Cc: Zdenek Kabelac <zdenek.kabelac@gmail.com>


----- Am 9. Apr 2019 um 15:24 schrieb Zdenek Kabelac zdenek.kabelac@gmail.com:

> Dne 09. 04. 19 v 15:00 Lentes, Bernd napsal(a):
>> Hello list,
>> 
>> I have a two-node HA-cluster which uses local and cluster LVM.
>> cLVM is currently stopped, I try to remove a snapshot from the root lv which
>> is located on a local VG.
>> I get this error:
>> ha-idg-2:/mnt/spp # lvremove -fv vg_local/lv_snap_pre_sp4
>>    connect() failed on local socket: No such file or directory
>>    Internal cluster locking initialisation failed.
>>    WARNING: Falling back to local file-based locking.
>>    Volume Groups with the clustered attribute will be inaccessible.
>>      Archiving volume group "vg_local" metadata (seqno 26).
>>      Removing snapshot volume vg_local/lv_snap_pre_sp4.
>>      Loading table for vg_local-lv_root (254:8).
>>    device-mapper: reload ioctl on  (254:8) failed: Invalid argument
>>    Failed to refresh lv_root without snapshot.
>> 
> 
> Hi
> 
> Have you tried to converted clustered VG to be a non-clustered one ?
> And use file locking to proceed with operation on local device?
> 
> Zdenek

Hi,

i tried all i found on the net.
Stopping udev before lvremove, dmsetup remove before, lock the device with lockdev,
tried to deactivate the snapshot before removing (which didn't work because then i also had 
to deactivate the root lv which is the source for the snapshot),
stopped monitoring the snapshot, update of the complete system ...
nothing succeeded.
I have a SLES 12 SP4 with 4.12.14-95.13-default and lvm2-2.02.180-9.7.1.x86_64.

I finally did a strace on the program:
 ...
write(2, "Loading table for vg_local-lv_ro"..., 43Loading table for vg_local-lv_root (254:9).) = 43
write(2, "\n", 1
)                       = 1
ioctl(3, DM_TABLE_STATUS, 0x563eacb00c80) = 0
ioctl(3, DM_TABLE_LOAD, 0x563eacb00c80) = -1 EINVAL (Invalid argument)    <========================================================
write(2, "  ", 2  )                       = 2
write(2, "device-mapper: reload ioctl on  "..., 64device-mapper: reload ioctl on  (254:9) failed: Invalid argument) = 64
write(2, "\n", 1
)                       = 1
brk(0x563eacf92000)                     = 0x563eacf92000
write(2, "  ", 2  )                       = 2
write(2, "Failed to refresh lv_root withou"..., 43Failed to refresh lv_root without snapshot.) = 43
write(2, "\n", 1
)                       = 1

This seems to be the culprit:
ioctl(3, DM_TABLE_LOAD, 0x563eacb00c80) = -1 EINVAL

fd 3 seems to be /dev/mapper/control. DM_TABLE_LOAD is defined in include/uapi/linux/dm-ioctl.h:
#define DM_TABLE_LOAD    _IOWR(DM_IOCTL, DM_TABLE_LOAD_CMD, struct dm_ioctl)
And the memory adress is the same as the one used successfully one line before.
Error -1 is, following man: 
EINVAL: request or argp is not valid
In the manpage sys/ioctl.h is mentioned, but i don't find it in my sources.

Any ideas ?

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
