Message-ID: <5256F694.4090008@redhat.com>
Date: Thu, 10 Oct 2013 20:48:52 +0200
From: Peter Rajnoha <prajnoha@redhat.com>
MIME-Version: 1.0
References: <5255CAB1.5050606@tekcomms.com>	<1381356552.67129.YahooMailNeo@web181504.mail.ne1.yahoo.com>	<5255D815.1090704@tekcomms.com>	<1381361455.80237.YahooMailNeo@web181502.mail.ne1.yahoo.com>	<5256C1EA.8080805@tekcomms.com>
	<5256F40B.3060002@redhat.com>
In-Reply-To: <5256F40B.3060002@redhat.com>
Content-Transfer-Encoding: 7bit
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
Content-Type: text/plain; charset="us-ascii"
To: LVM general discussion and development <linux-lvm@redhat.com>
Cc: matthew patton <pattonme@yahoo.com>

On 10/10/2013 08:38 PM, Peter Rajnoha wrote:
> There are two notions of cache in LVM. One is device cache, the other one
> is metadata cache. The first one is controlled by write_cache_state setting
> (which is obsoleted by obtaining the device list from udev).
> 
...
> If lvmetad is not used, whenever the LVM command is executed, each
> block device in /dev is scanned for PV labels, every time! Here,
> the obtain_device_list_from_udev lvm.conf setting makes a difference
> in a way how we get the list of block devices - if this setting is
> disabled, LVM directly scans all the /dev content and it selects block devices
> itself.

...if LVM selects block devices itself, it can cache this 'selection' by using
'write_cache_state=1' - LVM will write this list of block devices to a cache
file which is read next time, hence LVM does not need to select them once again
on next command execution. Of course, this cache file is of no use when
'obtain_device_list_from_udev=1' and we get that list of block devices from
udev all the time... that's the reason why 'obtain_device_list_from_udev=1'
obsoletes 'write_cache_state=1'. This is the *device cache* - either from udev
or from file written by LVM itself.

Peter
