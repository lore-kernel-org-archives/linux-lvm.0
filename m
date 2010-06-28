Received: from mx1.redhat.com (ext-mx08.extmail.prod.ext.phx2.redhat.com
	[10.5.110.12])
	by int-mx02.intmail.prod.int.phx2.redhat.com (8.13.8/8.13.8) with ESMTP
	id o5SFJsXZ010273
	for <linux-lvm@redhat.com>; Mon, 28 Jun 2010 11:19:54 -0400
Received: from usindmx01.hds.com (usindmx01.hds.com [207.126.252.12])
	by mx1.redhat.com (8.13.8/8.13.8) with ESMTP id o5SFJfrc002492
	for <linux-lvm@redhat.com>; Mon, 28 Jun 2010 11:19:42 -0400
Received: from usindmail02.hds.com (usindmail02.hds.com [207.126.252.21])
	by usindmx01.hds.com (8.14.1/8.14.1) with ESMTP id o5SFJfoE013432
	for <linux-lvm@redhat.com>; Mon, 28 Jun 2010 11:19:41 -0400 (EDT)
Received: from usindeht02.corp.hds.com (usindnetf5-vlan4float.corp.hds.com
	[10.74.12.196])
	by usindmail02.hds.com (8.14.1/8.14.1) with ESMTP id o5SFJaUp014294
	for <linux-lvm@redhat.com>; Mon, 28 Jun 2010 11:19:41 -0400 (EDT)
From: Takahiro Yasui <takahiro.yasui@hds.com>
Date: Mon, 28 Jun 2010 11:19:34 -0400
Message-ID: <5C30BE7ED8B03E448B2E104602D4848A59228864AC@USINDEVS02.corp.hds.com>
References: <117355.67457.qm@web38901.mail.mud.yahoo.com>,
	<749728.56536.qm@web38902.mail.mud.yahoo.com>
In-Reply-To: <749728.56536.qm@web38902.mail.mud.yahoo.com>
Content-Language: en-US
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: Re: [linux-lvm] rescue a lvm
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
To: LVM general discussion and development <linux-lvm@redhat.com>

Hello Octavio,

> I remove a PV from a GV on a umounted system and then I lost the whole group, now I just have the first HD and I want to read the data it has

> I have the pv without change the the VG is lost
> I have the backup of meta data in the PV so can I wondering to know if is safe to vgcfgrestore the file? or I could lost the data?

I'm not an expert of this area and not sure if you can rescue it or not,
but the following document might be helpful to you.

Chapter 6. LVM Troubleshooting
http://www.redhat.com/docs/en-US/Red_Hat_Enterprise_Linux/5.5/html/Logical_Volume_Manager_Administration/troubleshooting.html

6.4. Recovering Physical Volume Metadata
http://www.redhat.com/docs/en-US/Red_Hat_Enterprise_Linux/5.5/html/Logical_Volume_Manager_Administration/mdatarecover.html

Thanks,
Taka

-- 
Takahiro Yasui
Hitachi Data Systems
