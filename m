Received: from mx1.redhat.com (ext-mx13.extmail.prod.ext.phx2.redhat.com
	[10.5.110.42])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 6C84A96F83
	for <linux-lvm@redhat.com>; Wed, 10 Jul 2019 12:46:31 +0000 (UTC)
Received: from e2i64.smtp2go.com (e2i64.smtp2go.com [103.2.140.64])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mx1.redhat.com (Postfix) with ESMTPS id C79873082141
	for <linux-lvm@redhat.com>; Wed, 10 Jul 2019 12:46:29 +0000 (UTC)
From: Simon ELBAZ <selbaz@linagora.com>
References: <2c16a06f-271b-be18-a448-48acca16519c@linagora.com>
	<7b060cd7-a4b1-04ae-3a13-0fcd8637cad6@redhat.com>
	<40afe353-e750-1832-ba5a-1616695d46c4@linagora.com>
	<d8224c32-56bd-4e53-1090-d86b2e904678@redhat.com>
	<1f54874c-d4da-2579-955e-73e6caa8613b@linagora.com>
	<a89a98b3-3bde-96f0-7f31-3a9ca26ef203@gmail.com>
	<34f1f2af-cc02-6678-39d6-02323dd0236e@linagora.com>
Message-ID: <d8bce913-14b1-8f68-9fea-f4caf0bc9cb5@linagora.com>
Date: Wed, 10 Jul 2019 14:46:23 +0200
MIME-Version: 1.0
In-Reply-To: <34f1f2af-cc02-6678-39d6-02323dd0236e@linagora.com>
Content-Transfer-Encoding: 8bit
Content-Language: en-US-large
Subject: Re: [linux-lvm] lvdisplay "open" field computing
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
To: Zdenek Kabelac <zdenek.kabelac@gmail.com>, LVM general discussion and development <linux-lvm@redhat.com>

Veeambackup seems to access the volume (/var/log/veeam/veeamsvc.log):

[02.07.2019 00:01:18] <140503985145600> lpbcore| Found device: 
[/dev/dm-3]. Device number: [253:3]; Type: [dm].
[02.07.2019 00:01:18] <140503985145600> lpbcore|         Dm name: 
[vg_obm-var_spool_imap].
[02.07.2019 00:01:18] <140503985145600> lpbcore|         Dm UUID: 
[LVM-1i1v6pEjab2WslaDQRvkf8eLk6QfBW4J0oK7h0tDZHeUxEAyBwcK7xU9pSW7X4Uh].
[02.07.2019 00:01:18] <140503985145600> lpbcore| Slave of: [8:64].
[02.07.2019 00:01:18] <140503985145600> lpbcore| Link: [/dev/dm-3].
[02.07.2019 00:01:18] <140503985145600> lpbcore| Link: 
[/dev/vg_obm/var_spool_imap].
[02.07.2019 00:01:18] <140503985145600> lpbcore| Link: [/dev/block/253:3].
[02.07.2019 00:01:18] <140503985145600> lpbcore| Link: 
[/dev/mapper/vg_obm-var_spool_imap].
[02.07.2019 00:01:18] <140503985145600> lpbcore| Link: 
[/dev/disk/by-uuid/c9f9314e-4ce0-4138-b9b5-c745fdc22258].
[02.07.2019 00:01:18] <140503985145600> lpbcore| Link: 
[/dev/disk/by-id/dm-uuid-LVM-1i1v6pEjab2WslaDQRvkf8eLk6QfBW4J0oK7h0tDZHeUxEAyBwcK7xU9pSW7X4Uh].
[02.07.2019 00:01:18] <140503985145600> lpbcore| Link: 
[/dev/disk/by-id/dm-name-vg_obm-var_spool_imap].
[02.07.2019 00:01:18] <140503985145600> lpbcore| Filesystem UUID: 
[c9f9314e-4ce0-4138-b9b5-c745fdc22258]; Type: [ext4]; Mount points: 
[/var/spool/imap].

I wonder if veeam uses its own namespace.

Regards

On 10/07/2019 13:54, Simon ELBAZ wrote:
> Hi Zdenek,
>
> Thanks for your feedback.
>
> The kernel version is:
>
> [root@panoramix ~]# uname -a
> Linux panoramix.ch-perrens.fr 2.6.32-573.12.1.el6.x86_64 #1 SMP Tue 
> Dec 15 21:19:08 UTC 2015 x86_64 x86_64 x86_64 GNU/Linux
>
> This server is a corosync/pacemaker cluster node experiencing troubles 
> at failover.
>
> The error happening during the failover is:
>
> Jul  2 03:08:09 panoramix pgsql(pri_postgres)[18708]: INFO: Changing 
> pri_postgres-status on jolitorax.ch-perrens.fr : HS:alone->HS:async.
> Jul  2 03:08:10 panoramix LVM(pri_ISCSIVG0_vg_obm)[18618]: ERROR: 
> Logical volume vg_obm/var_spool_imap in use. Can't deactivate volume 
> group "vg_obm" with 1 open logical volume(s)
> Jul  2 03:08:10 panoramix LVM(pri_ISCSIVG0_vg_obm)[18618]: ERROR: LVM: 
> vg_obm did not stop correctly
> Jul  2 03:08:10 panoramix LVM(pri_ISCSIVG0_vg_obm)[18618]: WARNING: 
> vg_obm still Active
> Jul  2 03:08:10 panoramix LVM(pri_ISCSIVG0_vg_obm)[18618]: INFO: Retry 
> deactivating volume group vg_obm
>
> This is why I am trying to understand how the field is computed.
>
> The grep in mountinfo is attached to the mail.
>
> The volume is presented as a raw device by VMWare hypervisor and is 
> backuped by Veeam:
>
> [root@panoramix ~]# ps -ef | grep vee
> root      2877     1  0 Jul04 ?        00:01:10 /usr/sbin/veeamservice 
> --daemonize --pidfile=/var/run/veeamservice.pid
> root      5207     2  0 Jul05 ?        00:00:00 [veeamsnap_log]
> root     21475 21004  0 13:53 pts/2    00:00:00 grep vee
>
> Regards
>
>
> On 10/07/2019 12:51, Zdenek Kabelac wrote:
>> Dne 10. 07. 19 v 9:13 Simon ELBAZ napsal(a):
>>> Hi,
>>>
>>> This LV seems mounted on single mountpoint.
>>>
>>> The lsof output is:
>>
>>
>> Hmm
>>
>> Which kernel version is this - aren't we tracking issue for some 
>> ancient kernel ?
>>
>> Why have you actually started to hunt the reason for opencount 2 ?
>>
>> Has the machine experienced some troubles ?
>>
>> Aren't there some namespaces in use - so i.e. volume is used in 
>> different namespace ??
>>
>> grep 253:3  /proc/*/mountinfo  -  showing something unusual ?
>>
>>
>>
>> Zdenek
>>
-- 
Simon Elbaz
@Linagora
Mob: +33 (0) 6 38 99 18 34
Tour Franklin 31ème étage
100/101 Quartier Boieldieu
92042 La Défense
FRANCE
