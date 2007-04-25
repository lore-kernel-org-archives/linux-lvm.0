Received: from mx2.redhat.com (mx2.redhat.com [10.255.15.25])
	by int-mx2.corp.redhat.com (8.13.1/8.13.1) with ESMTP id l3PCIN2v012958
	for <linux-lvm@redhat.com>; Wed, 25 Apr 2007 08:18:23 -0400
Received: from emailgate2.cpvie.co.at (smtp.cargo-partner.com [195.234.151.28])
	by mx2.redhat.com (8.13.1/8.13.1) with ESMTP id l3PCIKIY002450
	for <linux-lvm@redhat.com>; Wed, 25 Apr 2007 08:18:21 -0400
Received: from localhost (localhost.localdomain [127.0.0.1])
	by emailgate2.cpvie.co.at (Postfix) with ESMTP id C61D240CB1
	for <linux-lvm@redhat.com>; Wed, 25 Apr 2007 14:18:14 +0200 (CEST)
Received: from cp.com (mail.cargo-partner.com [10.10.201.21])
	by emailgate2.cpvie.co.at (Postfix) with ESMTP id 195DE40C2C
	for <linux-lvm@redhat.com>; Wed, 25 Apr 2007 14:18:14 +0200 (CEST)
Received: from [81.5.235.182] (account eisenkoe@cargo-partner.com HELO
	[81.5.235.182]) by cp.com (CommuniGate Pro SMTP 5.1.8)
	with ESMTPA id 23264477 for linux-lvm@redhat.com;
	Wed, 25 Apr 2007 14:18:13 +0200
Message-ID: <462F4703.8040200@cargo-partner.com>
Date: Wed, 25 Apr 2007 14:18:11 +0200
From: =?ISO-8859-1?Q?Michael_Eisenk=F6lbl?= <eisenkoe@cargo-partner.com>
MIME-Version: 1.0
Subject: Re: [linux-lvm] clusteredVG+mirroredLV
References: <462332EF.5090505@cargo-partner.com>	<462E65D2.5070008@cargo-partner.com>	<462F07B8.9060205@cargo-partner.com>
	<47D4EAB4-1EA1-42DB-A8F9-C412B07E0005@engineyard.com>
In-Reply-To: <47D4EAB4-1EA1-42DB-A8F9-C412B07E0005@engineyard.com>
Content-Transfer-Encoding: quoted-printable
Reply-To: LVM general discussion and development <linux-lvm@redhat.com>
List-Id: LVM general discussion and development <linux-lvm.redhat.com>
List-Unsubscribe: <https://www.redhat.com/mailman/listinfo/linux-lvm>,
	<mailto:linux-lvm-request@redhat.com?subject=unsubscribe>
List-Archive: <https://www.redhat.com/archives/linux-lvm>
List-Post: <mailto:linux-lvm@redhat.com>
List-Help: <mailto:linux-lvm-request@redhat.com?subject=help>
List-Subscribe: <https://www.redhat.com/mailman/listinfo/linux-lvm>,
	<mailto:linux-lvm-request@redhat.com?subject=subscribe>
List-Id: <linux-lvm.redhat.com>
Content-Type: text/plain; charset="iso-8859-1"; format="flowed"
To: LVM general discussion and development <linux-lvm@redhat.com>

is there any other possibility the get a solution?

Jayson Vantuyl wrote:
> Mirroring (and snapshotting) does not currently work with clustered=20
> VGs.  This is because cmirror (and csnap) is not released yet.
>
> On Apr 25, 2007, at 2:48 AM, Michael Eisenk=EF=BF=BDlbl wrote:
>
>> Hi all,
>>
>> i want to create a two node cluster with three iSCSI devices.
>> the iSCSI devices should be mirrored (2mirror+1log) to be more secure.
>> I am going to configure 3 PVs and after a clustered volume group, so=20
>> this is no problem.
>> but when I am trying to create the mirrored logical volume (on this=20
>> clusteredVG), I got the following error message:
>>
>> lvcreate command failed.
>> Command attempted: "/usr/sbin/lvcreate -n mirrorLV -l 6 -m1 mirrorVG=20
>> /dev/sde1 /dev/sdb1 /dev/sdc1" - System Error Message:   Error=20
>> locking on node server4: Internal lvm error, check syslog
>> Aborting. Failed to activate mirror log. Remove new LVs and retry.
>> Failed to create mirror log.
>>
>> I deleted everything and retried it, but everytime the same error.
>> cluster is working good. clvmd is also started with locking mode 2.
>> if I try to create a normal VG with a mirrored LV everythings fine.
>> if I try to create a clustered VG with a normal LV everythings fine.
>> but not a clustered VG with a mirrored LV...... why?
>>
>> maybe somebody can help me with this situation.
>>
>> kind regards
>> Michael
>>
>> _______________________________________________
>> linux-lvm mailing list
>> linux-lvm@redhat.com <mailto:linux-lvm@redhat.com>
>> https://www.redhat.com/mailman/listinfo/linux-lvm
>> read the LVM HOW-TO at http://tldp.org/HOWTO/LVM-HOWTO/
>
>
>
> --=20
> Jayson Vantuyl
> Systems Architect
> *Engine Yard <http://www.engineyard.com>*
> jvantuyl@engineyard.com <mailto:jvantuyl@engineyard.com>
>
>
> ------------------------------------------------------------------------
>
> _______________________________________________
> linux-lvm mailing list
> linux-lvm@redhat.com
> https://www.redhat.com/mailman/listinfo/linux-lvm
> read the LVM HOW-TO at http://tldp.org/HOWTO/LVM-HOWTO/
