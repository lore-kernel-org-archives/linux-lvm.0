Received: from mx1.redhat.com (ext-mx02.extmail.prod.ext.phx2.redhat.com
	[10.5.110.26])
	by int-mx10.intmail.prod.int.phx2.redhat.com (8.14.4/8.14.4) with ESMTP
	id u7Q54sds011479
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256
	verify=NO)
	for <linux-lvm@redhat.com>; Fri, 26 Aug 2016 01:04:54 -0400
Received: from vm04-mail01.alteeve.ca (mail.alteeve.ca [65.39.153.71])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mx1.redhat.com (Postfix) with ESMTPS id 77D6BA0B64
	for <linux-lvm@redhat.com>; Fri, 26 Aug 2016 05:04:52 +0000 (UTC)
References: <CAN2gjWSEzL+M45UGFEkEA_i5bgNpKLXTQ+DAMPJjJJvBBvaTKQ@mail.gmail.com>
	<20160825155917.GA12789@redhat.com>
From: Digimer <lists@alteeve.ca>
Message-ID: <cf9ee87d-35bb-4cfe-a00b-a17ae180bd7b@alteeve.ca>
Date: Fri, 26 Aug 2016 01:04:45 -0400
MIME-Version: 1.0
In-Reply-To: <20160825155917.GA12789@redhat.com>
Content-Transfer-Encoding: quoted-printable
Subject: Re: [linux-lvm] lvm2 cluster aware
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
To: LVM general discussion and development <linux-lvm@redhat.com>, su liu <liusu8788@gmail.com>

On 25/08/16 11:59 AM, David Teigland wrote:
> On Thu, Aug 25, 2016 at 09:50:24AM +0800, su liu wrote:
>> I have a question about lvm2 cluster, The scene is that I try to imitate
>> FCSAN by mapping a rbd volume to two compute node, Then I using the rbd
>> volume to  create a PV and VG.I stoped the lvmetad daemon on the compute
>> nodes. Then I find that when I operating the VG on one compute node, the
>> changes can also be aware on another compute nodes.
>>
>> But this docment(http://www.tldp.org/HOWTO/LVM-HOWTO/sharinglvm1.html=EF=
=BC=89 says
>> that "*LVM is not cluster aware".*
>>
>> My question is that can I use the method to achieve the case that I crea=
te
>> or delete lv on one node whlie other compute node can using the lvs?
>>
>> Can anybody explain this?
>=20
> It's not safe to use lvm on shared storage without some extra mechanism to
> protect the data or coordinate access among hosts.  There are multiple
> ways, depending on what sort of sharing/coordination you want to use:
>=20
> - use system ID to protect VGs from other hosts,
>   http://man7.org/linux/man-pages/man7/lvmsystemid.7.html
>=20
> - use lvmlockd to coordinate sharing with sanlock or dlm (this is new),
>   http://man7.org/linux/man-pages/man8/lvmlockd.8.html
>=20
> - use clvm to coordinate sharing with dlm (this is old)
>   http://man7.org/linux/man-pages/man8/clvmd.8.html

It's not at all old. Or rather, it's not "old" in the sense that it's
not used or developed anymore. It's still an active part of the HA
cluster tool kit. DLM was just broken out to be stand-alone when
corosync went v2 as part of the merger of the old cman/rgmanager to
pacemaker migration.

--=20
Digimer
Papers and Projects: https://alteeve.ca/w/
What if the cure for cancer is trapped in the mind of a person without
access to education?
