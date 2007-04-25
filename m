Received: from mx2.redhat.com (mx2.redhat.com [10.255.15.25])
	by int-mx2.corp.redhat.com (8.13.1/8.13.1) with ESMTP id l3PElDsU004720
	for <linux-lvm@redhat.com>; Wed, 25 Apr 2007 10:47:14 -0400
Received: from mexforward.lss.emc.com (mexforward.lss.emc.com [128.222.32.20])
	by mx2.redhat.com (8.13.1/8.13.1) with ESMTP id l3PElBvC028158
	for <linux-lvm@redhat.com>; Wed, 25 Apr 2007 10:47:12 -0400
Received: from mailhub.lss.emc.com (nirah.lss.emc.com [10.254.144.13])
	by mexforward.lss.emc.com (Switch-3.2.5/Switch-3.1.7) with ESMTP id
	l3PEl5Pw027280
	for <linux-lvm@redhat.com>; Wed, 25 Apr 2007 10:47:06 -0400 (EDT)
Received: from corpussmtp3.corp.emc.com (corpussmtp3.corp.emc.com
	[10.254.64.53])
	by mailhub.lss.emc.com (Switch-3.2.5/Switch-3.1.7) with ESMTP id
	l3PEl1Ei002742
	for <linux-lvm@redhat.com>; Wed, 25 Apr 2007 10:47:04 -0400 (EDT)
From: Lin_ChiiShing@emc.com
Content-class: urn:content-classes:message
MIME-Version: 1.0
Subject: Re: [linux-lvm] clusteredVG+mirroredLV
Date: Wed, 25 Apr 2007 10:46:59 -0400
Message-ID: <97982DAF1EA1494DB6C65C2EEAA6296105EAA2D1@CORPUSMX40B.corp.emc.com>
In-Reply-To: <20070425121838.70D3A732E7@hormel.redhat.com>
References: <20070425121838.70D3A732E7@hormel.redhat.com>
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
Content-Type: text/plain; charset="iso-8859-1"
To: linux-lvm@redhat.com


I am using source with cvs tag RHEL4U4, and was able to go into
cmirror-kernel directory to build the module dm-cmirror.ko

After loading dm_cmirror module, the system-config-lvm tool
configured a mirrored LV in a clustered VG successfully.

Can someone in RedHat shed light on what's the current status of source
for cmirror-kernel and clustered mirroring?=20
What's expected to work (such as normal IO), and
what's expected not to work yet ? For early bird developers who are interes=
ted in=20
using this technology, do you have a recommended CVS tag for the source to =
do the prototype ?=20

    Thanks,
    -ChiiSHing


-----Original Message-----
Date: Wed, 25 Apr 2007 10:29:52 +0200
From: Michael Eisenk?lbl <eisenkoe@cargo-partner.com>
Subject: Re: [linux-lvm] clusteredVG+mirroredLV
To: LVM general discussion and development <linux-lvm@redhat.com>
Message-ID: <462F1180.1010602@cargo-partner.com>
Content-Type: text/plain; charset=3DISO-8859-1; format=3Dflowed

Do you know when it will be released?
Will it work with with RHEL 5?

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



=20
