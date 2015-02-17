Received: from mx1.redhat.com (ext-mx12.extmail.prod.ext.phx2.redhat.com
	[10.5.110.17])
	by int-mx09.intmail.prod.int.phx2.redhat.com (8.14.4/8.14.4) with ESMTP
	id t1HHUM79029391
	for <linux-lvm@redhat.com>; Tue, 17 Feb 2015 12:30:22 -0500
Received: from mail-yk0-f182.google.com (mail-yk0-f182.google.com
	[209.85.160.182])
	by mx1.redhat.com (8.14.4/8.14.4) with ESMTP id t1HHUKIB006335
	(version=TLSv1/SSLv3 cipher=AES128-GCM-SHA256 bits=128 verify=FAIL)
	for <linux-lvm@redhat.com>; Tue, 17 Feb 2015 12:30:20 -0500
Received: by mail-yk0-f182.google.com with SMTP id 142so13525815ykq.13
	for <linux-lvm@redhat.com>; Tue, 17 Feb 2015 09:30:20 -0800 (PST)
MIME-Version: 1.0
In-Reply-To: <88FDEFD2F804448094DAA74DE7136C5B@black>
References: <848E1BB85A9C4FB5A91BC299FEB36775@black>
	<A3158969DA2045E5A22780BE845B20CA@black>
	<88FDEFD2F804448094DAA74DE7136C5B@black>
From: Roger Heflin <rogerheflin@gmail.com>
Date: Tue, 17 Feb 2015 11:29:59 -0600
Message-ID: <CAAMCDefH+zygfOt6uHbKTb8txSbhGZVgR5R10H69pNpFFip4GA@mail.gmail.com>
Subject: Re: [linux-lvm] Confusing error: No space left on device
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
Content-Transfer-Encoding: 7bit
To: LVM general discussion and development <linux-lvm@redhat.com>

Look in /etc/lvm/archive there should be large amounts of details on
exactly how the lv was built and exactly what commands were done to it
that could have changed things from the original config.

On Tue, Feb 17, 2015 at 11:08 AM, Jason Pyeron <jpyeron@pdinc.us> wrote:
>> -----Original Message-----
>> From: Jason Pyeron
>> Sent: Tuesday, February 17, 2015 11:53
>>
>> > -----Original Message-----
>> > From: Jason Pyeron
>> > Sent: Tuesday, February 17, 2015 11:21
>> >
>> > This is likely a problem between keyboard and chair, but it
>> > has got me confused all the same.
>> >
>> > I was having issues with rsync, so I switched to dd and the
>> > same problem persists.
>> >
>> > Any suggestions?
>> >
>> > History says "lvcreate --size 8589934592b --name
>> > ciphershed-dmz-http vg_five66"
>> >
>> >
>> > root@five-66 ~
>> > # dd of=/dev/vg_five66/ciphershed-dmz-http bs=512 if=/dev/zero
>> > dd: writing `/dev/vg_five66/ciphershed-dmz-http': No space
>> > left on device
>> > 8580489+0 records in
>> > 8580488+0 records out
>> > 4393209856 bytes (4.4 GB) copied, 11.1884 s, 393 MB/s
>> >
>> > root@five-66 ~
>> > # lvdisplay /dev/vg_five66/ciphershed-dmz-http
>> >   --- Logical volume ---
>> >   LV Path                /dev/vg_five66/ciphershed-dmz-http
>> >   LV Name                ciphershed-dmz-http
>> >   VG Name                vg_five66
>> >   LV UUID                3yQHr9-WpdJ-76eL-4lEZ-hv0X-HP3N-GgqOvN
>> >   LV Write Access        read/write
>> >   LV Creation host, time five-66.pdinc.us, 2015-02-17 05:05:17 -0500
>> >   LV Status              available
>> >   # open                 0
>> >   LV Size                8.00 GiB
>> >   Current LE             2048
>> >   Segments               1
>> >   Allocation             inherit
>> >   Read ahead sectors     auto
>> >   - currently set to     256
>> >   Block device           253:3
>> >
>> >
>> > root@five-66 ~
>> > # vgdisplay
>> >   --- Volume group ---
>> >   VG Name               vg_five66
>> >   System ID
>> >   Format                lvm2
>> >   Metadata Areas        1
>> >   Metadata Sequence No  36
>> >   VG Access             read/write
>> >   VG Status             resizable
>> >   MAX LV                0
>> >   Cur LV                5
>> >   Open LV               2
>> >   Max PV                0
>> >   Cur PV                1
>> >   Act PV                1
>> >   VG Size               1.82 TiB
>> >   PE Size               4.00 MiB
>> >   Total PE              476806
>> >   Alloc PE / Size       19866 / 77.60 GiB
>> >   Free  PE / Size       456940 / 1.74 TiB
>> >   VG UUID               drT68w-cRLR-ZcmV-VYFz-haaK-Djd4-S8q9EV
>> >
>> >
>> > root@five-66 ~
>> > # rpm -qf `which vgdisplay`
>> > lvm2-2.02.111-2.el6_6.1.x86_64
>> >
>> > root@five-66 ~
>> > # uname -a
>> > Linux five-66.pdinc.us 2.6.32-504.8.1.el6.x86_64 #1 SMP Wed
>> > Jan 28 21:11:36 UTC 2015 x86_64 x86_64 x86_64 GNU/Linux
>>
>> # lvremove /dev/vg_five66/ciphershed-dmz-http
>> Do you really want to remove active logical volume
>> ciphershed-dmz-http? [y/n]: y
>>   Logical volume "ciphershed-dmz-http" successfully removed
>>
>> root@five-66 ~
>> # lvcreate --size 8589934592b --name ciphershed-dmz-http vg_five66
>>   Logical volume "ciphershed-dmz-http" created
>>
>> root@five-66 ~
>> # dd of=/dev/vg_five66/ciphershed-dmz-http bs=512 if=/dev/zero
>> dd: writing `/dev/vg_five66/ciphershed-dmz-http': No space
>> left on device
>> 16777217+0 records in
>> 16777216+0 records out
>> 8589934592 bytes (8.6 GB) copied, 254.765 s, 33.7 MB/s
>>
>
> <snip/>
>
> It is back.
>
> root@five-66 ~
> # rsync --inplace --progress server:/var/lib/libvirt/images/ciphershed-dmz-http.img /dev/vg_five66/ciphershed-dmz-http -vv
> opening connection using: ssh server rsync --server --sender -vve.Ls --inplace . /var/lib/libvirt/images/ciphershed-dmz-http.img
> delta-transmission enabled
> ciphershed-dmz-http.img
>   4285333400  49%  113.37MB/s    0:00:37
> rsync: write failed on "/dev/vg_five66/ciphershed-dmz-http": No space left on device (28)
> rsync error: error in file IO (code 11) at receiver.c(301) [receiver=3.0.6]
> rsync: connection unexpectedly closed (48 bytes received so far) [generator]
> rsync error: error in rsync protocol data stream (code 12) at io.c(600) [generator=3.0.6]
>
> root@five-66 ~
> # dd of=/dev/vg_five66/ciphershed-dmz-http bs=512 if=/dev/zero
> dd: writing `/dev/vg_five66/ciphershed-dmz-http': No space left on device
> 8580489+0 records in
> 8580488+0 records out
> 4393209856 bytes (4.4 GB) copied, 11.2402 s, 391 MB/s
>
> -Jason
>
>
>
> --
> -=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-
> -                                                               -
> - Jason Pyeron                      PD Inc. http://www.pdinc.us -
> - Principal Consultant              10 West 24th Street #100    -
> - +1 (443) 269-1555 x333            Baltimore, Maryland 21218   -
> -                                                               -
> -=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-
> This message is copyright PD Inc, subject to license 20080407P00.
>
>
> _______________________________________________
> linux-lvm mailing list
> linux-lvm@redhat.com
> https://www.redhat.com/mailman/listinfo/linux-lvm
> read the LVM HOW-TO at http://tldp.org/HOWTO/LVM-HOWTO/
