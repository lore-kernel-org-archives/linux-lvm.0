Message-ID: <5256F40B.3060002@redhat.com>
Date: Thu, 10 Oct 2013 20:38:03 +0200
From: Peter Rajnoha <prajnoha@redhat.com>
MIME-Version: 1.0
References: <5255CAB1.5050606@tekcomms.com>	<1381356552.67129.YahooMailNeo@web181504.mail.ne1.yahoo.com>	<5255D815.1090704@tekcomms.com>	<1381361455.80237.YahooMailNeo@web181502.mail.ne1.yahoo.com>
	<5256C1EA.8080805@tekcomms.com>
In-Reply-To: <5256C1EA.8080805@tekcomms.com>
Content-Transfer-Encoding: quoted-printable
Subject: Re: [linux-lvm] pvs complains of missing PVs that are not missing
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
Content-Type: text/plain; charset="iso-8859-1"
To: LVM general discussion and development <linux-lvm@redhat.com>
Cc: matthew patton <pattonme@yahoo.com>

On 10/10/2013 05:04 PM, Joe Harvell wrote:
> Le 09/10/2013 18:30, matthew patton a =EF=BF=BDcrit :
>>> So I should set 'obtain_device_list_from_udev' to 0, then pvscan, vgscan
>>> and lvscan?
>>
>> worth a shot. have you confirmed that udev has all the basic disk
>> devices created?
>>
> I tried that to no avail.  Yes, all the block devices were present in
> /dev, both for the raw partitions and the RAID ones.
>=20
> Does anyone know the algorithm LVM uses to determine whether PVs are
> present?  Also, I'd really like an LVM tool that reads the PV label off
> of a PV and displays it...I want to see what UUID label is actually on
> each PV.
>=20

Two important questions here - which distro is this?

There are two notions of cache in LVM. One is device cache, the other one
is metadata cache. The first one is controlled by write_cache_state setting
(which is obsoleted by obtaining the device list from udev). The latter one
is controlled by use_lvmetad setting. The lvmetad (and metadata cache) has
been added to LVM just recently, while the device cache is there for a long
time...

As for the other important question:
Is lvmetad used or not? (check global/use_lvmetad lvm.conf setting).
If lvmetad is used, it gathers incoming PVs based on events which means
once the PV is available in the system, lvmetad gets notified automatically.
Then the PV is scanned for LVM metadata and lvmetad stores that information.
This information is then reused for each LVM command call instead of scanni=
ng
the /dev again and again for PVs. The lvmetad requires udev for its operati=
on!
If lvmetad is used, does pvscan --cache call help?

If lvmetad is not used, whenever the LVM command is executed, each
block device in /dev is scanned for PV labels, every time! Here,
the obtain_device_list_from_udev lvm.conf setting makes a difference
in a way how we get the list of block devices - if this setting is
disabled, LVM directly scans all the /dev content and it selects block devi=
ces
itself. If it's enabled, we get the list of block devices from udev database
(which is a bit quicker as we don't need to iterate over all the content of
/dev and decide which item is a block device or not, saving a bit of time
this way).

Peter
