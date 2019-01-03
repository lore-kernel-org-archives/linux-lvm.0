Received: from mx1.redhat.com (ext-mx01.extmail.prod.ext.phx2.redhat.com
	[10.5.110.25])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id D75A31001F3C
	for <linux-lvm@redhat.com>; Thu,  3 Jan 2019 04:46:56 +0000 (UTC)
Received: from ipxavo.tcif.telstra.com.au (ipxavo.tcif.telstra.com.au
	[203.35.135.200])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mx1.redhat.com (Postfix) with ESMTPS id B7B46796FE
	for <linux-lvm@redhat.com>; Thu,  3 Jan 2019 04:46:52 +0000 (UTC)
From: "Davis, Matthew" <Matthew.Davis.2@team.telstra.com>
Date: Thu, 3 Jan 2019 04:46:44 +0000
Message-ID: <MEAPR01MB502904BB1C62BCAEDA77544FC28D0@MEAPR01MB5029.ausprd01.prod.outlook.com>
Content-Language: en-US
Content-Type: text/plain; charset="iso-8859-1"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Subject: [linux-lvm] how to copy a snapshot,
	or restore snapshot without deleting it
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
To: "linux-lvm@redhat.com" <linux-lvm@redhat.com>

Hi,

I want to restore a snapshot without deleting the snapshot.

My use case is that I'm experimenting with a lot of different drivers, kern=
el modules, and file modifications all over my machine.
I want to=20
1. take a snapshot of the working system
2. make changes
3. restore the snapshot (` sudo lvconvert --merge /dev/ubuntu-vg/$SNAPSHOT`=
 then reboot)
4. make new changes
5. restore to the snapshot again

The problem is that step 3 deletes the snapshot, so step 5 fails.

My current workaround is:
1. take a snapshot of the working system
2. make changes
3. restore the snapshot (` sudo lvconvert --merge /dev/ubuntu-vg/$SNAPSHOT`=
 then reboot)
4. Wait 1.5 hours, without making any changes to the machine
5. Take a new snapshot, with the same name as the original
6. make new changes
7. restore to the snapshot

This is not great because:
* I sometimes forget to do step 5
* I can't take a snapshot of the volume while it is still merging. This tak=
es 1.5 hours. I want to be able to restore my snapshots multiple times per =
day


Is there a flag I can add to `lvconvert` to make it not delete the snapshot?
Alternatively, is there a way I can make a copy of the snapshot before I re=
store it?

It looks like someone else asked this question 10 years ago.=20
https://www.redhat.com/archives/linux-lvm/2008-November/msg00000.html
Has this problem been solved since then?

Thanks,
Matt Davis

Technical Specialist
Telstra | Product Strategy & Innovation - Telstra Labs | Programmable Infra=
structure
E =EF=BF=BDMatthew.Davis.2@team.telstra.com=20
