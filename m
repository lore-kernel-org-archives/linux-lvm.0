References: <1438f48b-0a6d-4fb7-92dc-3688251e0a00@assyoma.it>
	<fa8b9d2e-6f1f-d201-263a-48178815a055@assyoma.it>
	<2f9c4346d4e9646ca058efdf535d435e@xenhideout.nl>
	<f934657c1724caba1c432cace2f0ca69@assyoma.it>
	<5df13342-8c31-4a0b-785e-1d12f0d2d9e8@redhat.com>
	<e12f977563bfccf0a2a39aa3e53b9cf4@assyoma.it>
	<b1b73e21196be7c50daa098b2724880a@xenhideout.nl>
	<6dd12ab9-0390-5c07-f4b7-de0d8fbbeacf@redhat.com>
	<3831e817d7d788e93a69f20e5dda1159@xenhideout.nl>
	<0ab1c4e1-b15e-b22e-9455-5569eeaa0563@redhat.com>
	<51faeb921acf634609b61bff5fd269d4@xenhideout.nl>
	<4b4d56ef-3127-212b-0e68-00b595faa241@redhat.com>
	<0535f3d744145eceea9121b1e68b622d@assyoma.it>
	<d6923067-a96f-191e-15e0-42a6bf29b37e@redhat.com>
	<4fb6f017d9734892eff6b0ef544d99fc@assyoma.it>
	<20ddda25-dacf-f4e2-8df4-f9bed1c62fe7@redhat.com>
	<c5bee073-7871-fbb9-370d-8a1b322bbd86@assyoma.it>
From: Zdenek Kabelac <zkabelac@redhat.com>
Message-ID: <921a6b9c-103e-3c71-97d2-44ceb5a6bf87@redhat.com>
Date: Wed, 26 Apr 2017 16:33:15 +0200
MIME-Version: 1.0
In-Reply-To: <c5bee073-7871-fbb9-370d-8a1b322bbd86@assyoma.it>
Content-Language: en-US
Content-Transfer-Encoding: 8bit
Subject: Re: [linux-lvm] Snapshot behavior on classic LVM vs ThinLVM
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
Content-Type: text/plain; charset="utf-8"; format="flowed"
To: Gionatan Danti <g.danti@assyoma.it>
Cc: LVM general discussion and development <linux-lvm@redhat.com>

Dne 26.4.2017 v 15:37 Gionatan Danti napsal(a):
> 
> On 26/04/2017 13:23, Zdenek Kabelac wrote:
>>
>> You need to use 'direct' write more - otherwise you are just witnessing
>> issues related with 'page-cache' flushing.
>>
>> Every update of file means update of journal - so you surely can lose
>> some data in-flight - but every good software needs to the flush before
>> doing next transaction - so with correctly working transaction software
>> no data could be lost.
> 
> I used "oflag=sync" for this very reason - to avoid async writes, However, 
> let's retry with "oflat=direct,sync".
> 
> This is the thinpool before filling:
> 
> [root@blackhole mnt]# lvs
>    LV       VG        Attr       LSize  Pool     Origin Data%  Meta% Move Log 
> Cpy%Sync Convert
>    thinpool vg_kvm    twi-aot---  1.00g                 87.66  12.01
>    thinvol  vg_kvm    Vwi-aot---  2.00g thinpool        43.83
>    root     vg_system -wi-ao---- 50.00g
>    swap     vg_system -wi-ao----  7.62g
> 
> [root@blackhole storage]# mount | grep thinvol
> /dev/mapper/vg_kvm-thinvol on /mnt/storage type ext4 
> (rw,relatime,seclabel,errors=remount-ro,stripe=32,data=ordered)
> 
> 
> Fill the thin volume (note that errors are raised immediately due to 
> --errorwhenfull=y):
> 
> [root@blackhole mnt]# dd if=/dev/zero of=/mnt/storage/test.2 bs=1M count=300 
> oflag=direct,sync
> dd: error writing ‘/mnt/storage/test.2’: Input/output error
> 127+0 records in
> 126+0 records out
> 132120576 bytes (132 MB) copied, 14.2165 s, 9.3 MB/s
> 
>  From syslog:
> 
> Apr 26 15:26:24 localhost lvm[897]: WARNING: Thin pool vg_kvm-thinpool-tpool 
> data is now 96.84% full.
> Apr 26 15:26:27 localhost kernel: device-mapper: thin: 253:4: reached low 
> water mark for data device: sending event.
> Apr 26 15:26:27 localhost kernel: device-mapper: thin: 253:4: switching pool 
> to out-of-data-space (error IO) mode
> Apr 26 15:26:34 localhost lvm[897]: WARNING: Thin pool vg_kvm-thinpool-tpool 
> data is now 100.00% full.
> 
> Despite write errors, the filesystem is not in read-only mode:


But you get correct 'write' error - so from application POV - you get failing
transaction update/write - so app knows  'data' were lost and should not 
proceed with next transaction - so it's in line with  'no data is lost' and 
filesystem is not damaged and is in correct state (mountable).


Zdenek
