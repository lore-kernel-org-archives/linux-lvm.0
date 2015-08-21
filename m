Received: from mx1.redhat.com (ext-mx02.extmail.prod.ext.phx2.redhat.com
	[10.5.110.26])
	by int-mx09.intmail.prod.int.phx2.redhat.com (8.14.4/8.14.4) with ESMTP
	id t7LE7MIV028920
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256
	verify=NO)
	for <linux-lvm@redhat.com>; Fri, 21 Aug 2015 10:07:22 -0400
Received: from mail-wi0-f177.google.com (mail-wi0-f177.google.com
	[209.85.212.177])
	by mx1.redhat.com (Postfix) with ESMTPS id 81DF28E926
	for <linux-lvm@redhat.com>; Fri, 21 Aug 2015 14:07:17 +0000 (UTC)
Received: by widdq5 with SMTP id dq5so17124069wid.0
	for <linux-lvm@redhat.com>; Fri, 21 Aug 2015 07:07:16 -0700 (PDT)
MIME-Version: 1.0
Sender: d.milivojevic@gmail.com
In-Reply-To: <mr6ji3$nsn$1@ger.gmane.org>
References: <CALtW_aiWxdJnNgUzCyYC_WjsRoEUUtGpnrVp9VwP60r63R+yRQ@mail.gmail.com>
	<mr6ji3$nsn$1@ger.gmane.org>
Date: Fri, 21 Aug 2015 14:26:42 +0200
Message-ID: <CALtW_agKEE794W5=AvzVJwRGVKc5c0yAOzyc_zM8N6VJZgydfA@mail.gmail.com>
From: =?UTF-8?Q?Dragan_Milivojevi=C4=87?= <galileo@pkm-inc.com>
Content-Transfer-Encoding: quoted-printable
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
Content-Type: text/plain; charset="windows-1252"
To: LVM general discussion and development <linux-lvm@redhat.com>

That's odd, RHEL 7.1 release notes state that LVM cache is production ready.
Thanks for the clarification, I will post a bugreport upstream.

Dragan

On Fri, Aug 21, 2015 at 9:21 AM, Zdenek Kabelac
<zdenek.kabelac@gmail.com> wrote:
> Dne 20.8.2015 v 18:09 Dragan Milivojevi=C4=87 napsal(a):
>
>> Hi all
>>
>> I'm testing a recovery scenario for a NAS server which uses an SSD as
>> a PV for the LVM cache (dm-cache).
>> When I remove the SSD and try to uncache the LV I get this:
>>
>>   [root@storage ~]# lvconvert -v --force --uncache /dev/total_storage/te=
st
>>    WARNING: Device for PV yJvPgB-aPlc-wFG2-DL9U-MOKI-2F93-XlzHyf not
>> found or rejected by a filter.
>>      There are 1 physical volumes missing.
>>    Cannot change VG total_storage while PVs are missing.
>>    Consider vgreduce --removemissing.
>>      There are 1 physical volumes missing.
>>
>> [root@storage ~]# vgreduce -v --force --removemissing total_storage
>>      Finding volume group "total_storage"
>>    WARNING: Device for PV yJvPgB-aPlc-wFG2-DL9U-MOKI-2F93-XlzHyf not
>> found or rejected by a filter.
>>      There are 1 physical volumes missing.
>>      There are 1 physical volumes missing.
>>      Trying to open VG total_storage for recovery...
>>    WARNING: Device for PV yJvPgB-aPlc-wFG2-DL9U-MOKI-2F93-XlzHyf not
>> found or rejected by a filter.
>>      There are 1 physical volumes missing.
>>      There are 1 physical volumes missing.
>>      Archiving volume group "total_storage" metadata (seqno 9).
>>    Removing partial LV test.
>>      activation/volume_list configuration setting not defined: Checking
>> only host tags for total_storage/test
>>      Executing: /usr/sbin/modprobe dm-cache
>>      Creating total_storage-cache_pool00_cdata-missing_0_0
>>      Loading total_storage-cache_pool00_cdata-missing_0_0 table (253:3)
>>      Resuming total_storage-cache_pool00_cdata-missing_0_0 (253:3)
>>      Creating total_storage-cache_pool00_cdata
>>      Loading total_storage-cache_pool00_cdata table (253:4)
>>      Resuming total_storage-cache_pool00_cdata (253:4)
>>      Creating total_storage-cache_pool00_cmeta-missing_0_0
>>      Loading total_storage-cache_pool00_cmeta-missing_0_0 table (253:5)
>>      Resuming total_storage-cache_pool00_cmeta-missing_0_0 (253:5)
>>      Creating total_storage-cache_pool00_cmeta
>>      Loading total_storage-cache_pool00_cmeta table (253:6)
>>      Resuming total_storage-cache_pool00_cmeta (253:6)
>>      Creating total_storage-test_corig
>>      Loading total_storage-test_corig table (253:7)
>>      Resuming total_storage-test_corig (253:7)
>>      Executing: /usr/sbin/cache_check -q
>> /dev/mapper/total_storage-cache_pool00_cmeta
>>
>> vgreduce gets stuck at the last step: /usr/sbin/cache_check
>>
>> If I run cache_check manually I get this:
>>
>> [root@storage ~]# /usr/sbin/cache_check
>> /dev/mapper/total_storage-cache_pool00_cmeta
>> examining superblock
>>    superblock is corrupt
>>      incomplete io for block 0, e.res =3D 18446744073709551611, e.res2 =
=3D
>> 0, offset =3D 0, nbytes =3D 4096
>>
>> and it waits indefinitely.
>>
>> If a replace the /usr/sbin/cache_check with a shell script that returns 0
>> or 1
>> vgreduce just errors out. It seems that there is no way to uncache the
>> LV without
>> replacing the missing PV (which could pose a problem in production use).
>> The origin LV (test_corig) is fine, I can mount it and use it, there
>> are no file-system issues etc.
>>
>> Is this an intended behaviour or a bug?
>
>
> It's unhandled yet scenario.
>
> Feel free to open BZ at bugzilla.redhat.com
>
>
> Zdenek
>
>
> _______________________________________________
> linux-lvm mailing list
> linux-lvm@redhat.com
> https://www.redhat.com/mailman/listinfo/linux-lvm
> read the LVM HOW-TO at http://tldp.org/HOWTO/LVM-HOWTO/
