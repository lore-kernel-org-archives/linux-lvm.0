Received: from mx1.redhat.com (ext-mx06.extmail.prod.ext.phx2.redhat.com
	[10.5.110.30])
	by int-mx14.intmail.prod.int.phx2.redhat.com (8.14.4/8.14.4) with ESMTP
	id u5NGa3Zl010457
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256
	verify=NO)
	for <linux-lvm@redhat.com>; Thu, 23 Jun 2016 12:36:03 -0400
Received: from mail5.wrs.com (mail5.windriver.com [192.103.53.11])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mx1.redhat.com (Postfix) with ESMTPS id 7438E60A6
	for <linux-lvm@redhat.com>; Thu, 23 Jun 2016 16:36:02 +0000 (UTC)
Received: from ALA-HCA.corp.ad.wrs.com (ala-hca.corp.ad.wrs.com
	[147.11.189.40])
	by mail5.wrs.com (8.15.2/8.15.2) with ESMTPS id u5NGa1WD006209
	(version=TLSv1 cipher=AES128-SHA bits=128 verify=OK)
	for <linux-lvm@redhat.com>; Thu, 23 Jun 2016 09:36:01 -0700
Message-ID: <576C0FEF.7060301@windriver.com>
Date: Thu, 23 Jun 2016 10:35:59 -0600
From: Chris Friesen <chris.friesen@windriver.com>
MIME-Version: 1.0
References: <5768578E.2010608@windriver.com>	<CAFTDQfCQpX18TEnu3i4BwnPuzn_ZyY=b3JJ_qWC2EzE3309wqA@mail.gmail.com>	<576865BC.4020400@windriver.com>
	<57687182.8030309@windriver.com>	<57687891.1090001@windriver.com>	<4094fb9b-01d7-8358-8a91-fa65719af0e4@redhat.com>	<57695BC4.3040205@windriver.com>	<8771709a-3ab2-e485-ce87-5a6c51e8a9a9@redhat.com>	<576AA614.6050800@windriver.com>
	<ae18c007-f3ed-5115-b563-8a1074f27151@redhat.com>
In-Reply-To: <ae18c007-f3ed-5115-b563-8a1074f27151@redhat.com>
Content-Transfer-Encoding: 7bit
Subject: Re: [linux-lvm] what creates the symlinks in /dev/<volgroup> ?
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
Content-Type: text/plain; charset="us-ascii"; format="flowed"
To: linux-lvm@redhat.com

On 06/23/2016 02:34 AM, Zdenek Kabelac wrote:
> Dne 22.6.2016 v 16:52 Chris Friesen napsal(a):
>> On 06/22/2016 03:23 AM, Zdenek Kabelac wrote:
>>> Dne 21.6.2016 v 17:22 Chris Friesen napsal(a):
>>>> I'm using the stock CentOS7 version, I think.
>>>>
>>>>   LVM version:     2.02.130(2)-RHEL7 (2015-12-01)
>>>>   Library version: 1.02.107-RHEL7 (2015-12-01)
>>>>   Driver version:  4.33.0
>>>>
>>>> So are you saying that nobody should run "vgscan --mknodes" on a system where
>>>> udev is managing the symlinks?
>>>
>>> Yes - on such system this command should be used only in case of 'emergency',
>>> udev doesn't work properly and you need links.
>>>
>>> The links however will not be known to udev and likely whole system is
>>> going to be crashing soon or is misconfigured in major way.
>>
>> Okay, I'll see if I can get the call to vgscan removed.  But even so wouldn't
>> it make sense to have vgscan use the same logic as udev in terms of what
>> symlinks to make and where to make them to?
>
> It *IS* using same logic.
>
> If the link is not there - the bug is in your udev rules.
>
> When udev is properly configured, vgscan should not show missing link.

It doesn't seem to work this way in practice on a stock CentOS system.  Here's 
the sequence:

1) create a volume group:
"vgcreate chris-volumes /dev/loop2"
At this point there is no /dev/chris-volumes directory.

2) Create a thin pool in the volume group:
"lvcreate -L 1.8GB -T chris-volumes/chris-volumes-pool"

Now udev creates a /dev/chris-volumes directory with a link for the thin pool:
[root@centos7 centos]# ls -l /dev/chris-volumes
total 0
lrwxrwxrwx. 1 root root 7 Jun 23 12:22 chris-volumes-pool -> ../dm-9

3) Create a thin volume in the thin pool:
"lvcreate -V1G -T chris-volumes/chris-volumes-pool -n thinvolume"

Now the link for the thin pool itself has disappeared:
[root@centos7 centos]# ls -l /dev/chris-volumes
total 0
lrwxrwxrwx. 1 root root 8 Jun 23 12:23 thinvolume -> ../dm-11

(At this point /dev/mapper/chris--volumes-chris--volumes--pool-tpool points to 
dm-9 and /dev/mapper/chris--volumes-chris--volumes--pool points to dm-10.)


4) If I run "vgscan --mknodes", it re-creates the thin pool link, but pointing 
to the /dev/mapper name instead of directly to the /dev/dm-*.  Also, it's 
indirectly pointing to /dev/dm-10 where before it was pointing to /dev/dm-9:

[root@centos7 centos]# vgscan --mknodes
   Configuration setting "snapshot_autoextend_percent" invalid. It's not part of 
any section.
   Configuration setting "snapshot_autoextend_threshold" invalid. It's not part 
of any section.
   Reading all physical volumes.  This may take a while...
   Found volume group "chris-volumes" using metadata type lvm2
   Found volume group "centos" using metadata type lvm2
   Found volume group "cinder-volumes" using metadata type lvm2
   The link /dev/chris-volumes/chris-volumes-pool should have been created by 
udev but it was not found. Falling back to direct link creation.
[root@centos7 centos]# ls -l /dev/chris-volumes
total 0
lrwxrwxrwx. 1 root root 47 Jun 23 12:25 chris-volumes-pool -> 
/dev/mapper/chris--volumes-chris--volumes--pool
lrwxrwxrwx. 1 root root  8 Jun 23 12:23 thinvolume -> ../dm-11


5) If I run "vgchange -an chris-volumes", I'm left with a /dev/chris-volumes 
directory containing a broken symlink (broken because 
/dev/mapper/chris--volumes-chris--volumes--pool doesn't exist anymore):

[root@centos7 centos]# ls -l /dev/chris-volumes
total 0
lrwxrwxrwx. 1 root root 47 Jun 23 12:25 chris-volumes-pool -> 
/dev/mapper/chris--volumes-chris--volumes--pool



It looks like /usr/lib/udev/rules.d/11-dm-lvm.rules is what makes the 
/dev/<VG>/<LV> symlink for normal devices, but for a thin pool with a thin 
volume in it it will exit without making a symlink because 
DM_UDEV_DISABLE_SUBSYSTEM_RULES_FLAG=1 is set.

[root@centos7 centos]# udevadm info /dev/chris-volumes/chris-volumes-pool
P: /devices/virtual/block/dm-10
N: dm-10
E: DM_UDEV_DISABLE_SUBSYSTEM_RULES_FLAG=1


Chris
