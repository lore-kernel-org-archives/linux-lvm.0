Received: from mx1.redhat.com (mx1.redhat.com [172.16.48.31])
	by int-mx1.corp.redhat.com (8.11.6/8.11.6) with ESMTP id j22HjmK26452
	for <linux-lvm@redhat.com>; Wed, 2 Mar 2005 12:45:48 -0500
Received: from pastinakel.tue.nl (pastinakel.tue.nl [131.155.2.7])
	by mx1.redhat.com (8.12.11/8.12.11) with ESMTP id j22HjklG000954
	for <linux-lvm@redhat.com>; Wed, 2 Mar 2005 12:45:47 -0500
Received: from iris.tue.nl (iris.tue.nl [131.155.2.34])
	by pastinakel.tue.nl (Postfix) with ESMTP id 6815014BB40
	for <linux-lvm@redhat.com>; Wed,  2 Mar 2005 18:45:45 +0100 (CET)
Received: from [131.155.224.41] (t-26-41.athome.tue.nl [131.155.224.41])
	by iris.tue.nl (Postfix) with ESMTP id 9851210C0AF
	for <linux-lvm@redhat.com>; Wed,  2 Mar 2005 18:45:44 +0100 (CET)
Message-ID: <4225FBC8.9020904@are-b.org>
Date: Wed, 02 Mar 2005 18:45:44 +0100
From: oliver <oliver@are-b.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Subject: [linux-lvm] Partition table gone? Any way to restore?
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
Content-Type: text/plain; charset="us-ascii"; format="flowed"
To: linux-lvm@redhat.com

Hi,

I just moved my HDD's from the onboard IDE controller to a PCI 
controller, the HighPoint RocketRaid454. Since one of the harddisk once, 
a long time ago, was hooked up to an identical raid controller and had a 
raid created on it, the rocketraid for some reason found it. Even though 
it shouldn't have been there anymore to my knowlegde.

The raid controller complained about a corrupt volume and destroyed it. 
It was done within a blink of an eye. (So i don't think everything is wiped.

However LVM can't find my VG anymore. fdisk -l /dev/hde shows me that 
there simply isn't anything on it. Where as fdisk -l /dev/hdg tells me 
"Disk /dev/hdg doesn't contain a valid partition table" as I would have 
expected.

First thing came to mind was to check via vgcfgrestore if it could do 
anything. However I get this error:
root@enterprise:/etc/lvmconf# vgcfgrestore -l -n vg00
vgcfgrestore -- INFO: using backup file "/etc/lvmconf/vg00.conf"
vgcfgrestore -- ERROR: different structure size stored in 
"/etc/lvmconf/vg00.conf" than expected in file vg_cfgrestore.c [line 120]
vgcfgrestore -- ERROR "vg_cfgrestore(): read" restoring volume group "vg00"

I don't think I have ever changed the version installed so don't see 
where this error is coming from. (The *.conf files apprear to be from 
late last night, so are quite 'new')

I don't want to recreate the volume on /dev/hde because i don't want to 
loose the information on there. Since as mentioned the operation was 
over quite swiftly I doubt the entire disk is gone, only the partition 
table itself, or whatever LVM creates.

Thus my question, what can I do to restore my LVM!

Thanks a lot in advance,

oliver
