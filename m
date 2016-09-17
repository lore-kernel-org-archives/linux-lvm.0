Received: from mx1.redhat.com (ext-mx08.extmail.prod.ext.phx2.redhat.com
	[10.5.110.32])
	by int-mx11.intmail.prod.int.phx2.redhat.com (8.14.4/8.14.4) with ESMTP
	id u8H7TKiV025857
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256
	verify=NO)
	for <linux-lvm@redhat.com>; Sat, 17 Sep 2016 03:29:20 -0400
Received: from smtp1.dds.nl (smtp1.dds.nl [83.96.147.43])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mx1.redhat.com (Postfix) with ESMTPS id B2D01C05AA70
	for <linux-lvm@redhat.com>; Sat, 17 Sep 2016 07:29:17 +0000 (UTC)
Received: from webmail.dds.nl (app1.dds.nl [81.21.136.61])
	by smtp1.dds.nl (Postfix) with ESMTP id 6A29FA6807
	for <linux-lvm@redhat.com>; Sat, 17 Sep 2016 09:29:18 +0200 (CEST)
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Date: Sat, 17 Sep 2016 09:29:16 +0200
From: Xen <list@xenhideout.nl>
Message-ID: <7e54ddf6638609d4e521287b51964ebd@dds.nl>
Subject: [linux-lvm] creating DD copies of disks
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
To: Linux lvm <linux-lvm@redhat.com>

I want to ask again:

What is the proper procedure when duplicating a disk with DD?

- after duplication you cannot update a PV with pvchange -u because it 
will supersede your duplicate with the original and not do anything

So to do that you need to boot off a different system, deactivate loaded 
vgs (if any) and then pvchange -u the duplicate PV.

- my experience indicates that pvchange -ay on a PV that contains a 
duplicate VG, even if it has a different UUID, but with an identical 
name, creates problems.

I mean that anytime you load a VG with the same name you get issues. VG 
names are often standardized between installs, so that Ubuntu might have 
"ubuntu-vg" as the name and kubuntu might have "kubuntu-vg" as the name.

So if you then load two of those disks in the same system, you instantly 
have issues.

If the system were to auto- or temporary-rename an offending 2nd VG it 
wouldn't be so bad. But usually you have to vgrename rename your current 
VG in advance of loading a second disk.

Which isn't exactly as intended, because now you are changing your local 
name to make room for a second system, when it should really be the 
other way around.

In the end I feel I have to do:

pvchange -u
vgchange -u
vgrename

To get something that will at least not bug me when both systems are 
loaded at the same time.

This then renders it impossible to use it as a backup because any other 
disk referencing the PV will not find it because the UUID has changed.

Now you would first have to reverse these operations (particularly the 
vgrename and pvchange -u) towards the data of the first disk (the 
original) to be able to use the device again.

All of that is not very resilient. Now both PV UUIDs and VG names have 
to be unique.

Particularly I wonder how easy it is to point an existing VG to a disk 
that has a new (duplicate) PV and tell it: use that one from now on.

I mean: how can I add a disk that has a duplicate PV with a different 
UUID and add it to the VG in such a way that it replaces the references 
that VG has for the old PV?

But also: what ought you to do if creating a mirror copy? (duplicate 
copy).
