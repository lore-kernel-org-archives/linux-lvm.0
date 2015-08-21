Received: from mx1.redhat.com (ext-mx03.extmail.prod.ext.phx2.redhat.com
	[10.5.110.27])
	by int-mx13.intmail.prod.int.phx2.redhat.com (8.14.4/8.14.4) with ESMTP
	id t7L7LqZB030868
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256
	verify=NO)
	for <linux-lvm@redhat.com>; Fri, 21 Aug 2015 03:21:53 -0400
Received: from plane.gmane.org (plane.gmane.org [80.91.229.3])
	by mx1.redhat.com (Postfix) with ESMTPS id 4E6AD8CF62
	for <linux-lvm@redhat.com>; Fri, 21 Aug 2015 07:21:51 +0000 (UTC)
Received: from list by plane.gmane.org with local (Exim 4.69)
	(envelope-from <gllg-linux-lvm@m.gmane.org>) id 1ZSge3-0004cL-8t
	for linux-lvm@redhat.com; Fri, 21 Aug 2015 09:21:47 +0200
Received: from nat-pool-brq-t.redhat.com ([209.132.186.34])
	by main.gmane.org with esmtp (Gmexim 0.1 (Debian))
	id 1AlnuQ-0007hv-00
	for <linux-lvm@redhat.com>; Fri, 21 Aug 2015 09:21:47 +0200
Received: from zdenek.kabelac by nat-pool-brq-t.redhat.com with local (Gmexim
	0.1 (Debian)) id 1AlnuQ-0007hv-00
	for <linux-lvm@redhat.com>; Fri, 21 Aug 2015 09:21:47 +0200
From: Zdenek Kabelac <zdenek.kabelac@gmail.com>
Date: Fri, 21 Aug 2015 09:21:39 +0200
Message-ID: <mr6ji3$nsn$1@ger.gmane.org>
References: <CALtW_aiWxdJnNgUzCyYC_WjsRoEUUtGpnrVp9VwP60r63R+yRQ@mail.gmail.com>
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
In-Reply-To: <CALtW_aiWxdJnNgUzCyYC_WjsRoEUUtGpnrVp9VwP60r63R+yRQ@mail.gmail.com>
Subject: Re: [linux-lvm] Uncache a LV when a cache PV is gone, bug ?
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
Content-Type: text/plain; charset="windows-1252"; format="flowed"
To: linux-lvm@redhat.com

Dne 20.8.2015 v 18:09 Dragan Milivojevi=C4=87 napsal(a):
> Hi all
>
> I'm testing a recovery scenario for a NAS server which uses an SSD as
> a PV for the LVM cache (dm-cache).
> When I remove the SSD and try to uncache the LV I get this:
>
>   [root@storage ~]# lvconvert -v --force --uncache /dev/total_storage/test
>    WARNING: Device for PV yJvPgB-aPlc-wFG2-DL9U-MOKI-2F93-XlzHyf not
> found or rejected by a filter.
>      There are 1 physical volumes missing.
>    Cannot change VG total_storage while PVs are missing.
>    Consider vgreduce --removemissing.
>      There are 1 physical volumes missing.
>
> [root@storage ~]# vgreduce -v --force --removemissing total_storage
>      Finding volume group "total_storage"
>    WARNING: Device for PV yJvPgB-aPlc-wFG2-DL9U-MOKI-2F93-XlzHyf not
> found or rejected by a filter.
>      There are 1 physical volumes missing.
>      There are 1 physical volumes missing.
>      Trying to open VG total_storage for recovery...
>    WARNING: Device for PV yJvPgB-aPlc-wFG2-DL9U-MOKI-2F93-XlzHyf not
> found or rejected by a filter.
>      There are 1 physical volumes missing.
>      There are 1 physical volumes missing.
>      Archiving volume group "total_storage" metadata (seqno 9).
>    Removing partial LV test.
>      activation/volume_list configuration setting not defined: Checking
> only host tags for total_storage/test
>      Executing: /usr/sbin/modprobe dm-cache
>      Creating total_storage-cache_pool00_cdata-missing_0_0
>      Loading total_storage-cache_pool00_cdata-missing_0_0 table (253:3)
>      Resuming total_storage-cache_pool00_cdata-missing_0_0 (253:3)
>      Creating total_storage-cache_pool00_cdata
>      Loading total_storage-cache_pool00_cdata table (253:4)
>      Resuming total_storage-cache_pool00_cdata (253:4)
>      Creating total_storage-cache_pool00_cmeta-missing_0_0
>      Loading total_storage-cache_pool00_cmeta-missing_0_0 table (253:5)
>      Resuming total_storage-cache_pool00_cmeta-missing_0_0 (253:5)
>      Creating total_storage-cache_pool00_cmeta
>      Loading total_storage-cache_pool00_cmeta table (253:6)
>      Resuming total_storage-cache_pool00_cmeta (253:6)
>      Creating total_storage-test_corig
>      Loading total_storage-test_corig table (253:7)
>      Resuming total_storage-test_corig (253:7)
>      Executing: /usr/sbin/cache_check -q
> /dev/mapper/total_storage-cache_pool00_cmeta
>
> vgreduce gets stuck at the last step: /usr/sbin/cache_check
>
> If I run cache_check manually I get this:
>
> [root@storage ~]# /usr/sbin/cache_check
> /dev/mapper/total_storage-cache_pool00_cmeta
> examining superblock
>    superblock is corrupt
>      incomplete io for block 0, e.res =3D 18446744073709551611, e.res2 =3D
> 0, offset =3D 0, nbytes =3D 4096
>
> and it waits indefinitely.
>
> If a replace the /usr/sbin/cache_check with a shell script that returns 0=
 or 1
> vgreduce just errors out. It seems that there is no way to uncache the
> LV without
> replacing the missing PV (which could pose a problem in production use).
> The origin LV (test_corig) is fine, I can mount it and use it, there
> are no file-system issues etc.
>
> Is this an intended behaviour or a bug?

It's unhandled yet scenario.

Feel free to open BZ at bugzilla.redhat.com


Zdenek
