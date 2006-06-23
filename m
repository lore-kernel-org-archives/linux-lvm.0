Received: from mx1.redhat.com (mx1.redhat.com [172.16.48.31])
	by int-mx1.corp.redhat.com (8.12.11.20060308/8.12.11) with ESMTP id
	k5NGIDLw001863
	for <linux-lvm@redhat.com>; Fri, 23 Jun 2006 12:18:13 -0400
Received: from mailgw1.fnal.gov (mailgw1.fnal.gov [131.225.111.11])
	by mx1.redhat.com (8.12.11.20060308/8.12.11) with ESMTP id
	k5NGIBcQ007994
	for <linux-lvm@redhat.com>; Fri, 23 Jun 2006 12:18:12 -0400
Received: from mailav1.fnal.gov (mailav1.fnal.gov [131.225.111.18])
	by mailgw1.fnal.gov
	(iPlanet Messaging Server 5.2 HotFix 2.06 (built Mar 28 2005))
	with SMTP id <0J1B00GZUMKZ0V@mailgw1.fnal.gov> for linux-lvm@redhat.com;
	Fri, 23 Jun 2006 11:18:11 -0500 (CDT)
Received: from mailgw2.fnal.gov ([131.225.111.12])
	by mailav1.fnal.gov (SAVSMTP 3.1.7.47) with SMTP id
	M2006062311181122860 for
	<linux-lvm@redhat.com>; Fri, 23 Jun 2006 11:18:11 -0500
Received: from conversion-daemon.mailgw2.fnal.gov by mailgw2.fnal.gov
	(iPlanet Messaging Server 5.2 HotFix 2.06 (built Mar 28 2005))
	id <0J1B00K01MIXFR@mailgw2.fnal.gov> (original mail from
	jdiamond@fnal.gov)
	for linux-lvm@redhat.com; Fri, 23 Jun 2006 11:18:11 -0500 (CDT)
Received: from [127.0.0.1] (adee94445.fnal.gov [131.225.129.110])
	by mailgw2.fnal.gov
	(iPlanet Messaging Server 5.2 HotFix 2.06 (built Mar 28 2005))
	with ESMTPSA id <0J1B0004NMMBJQ@mailgw2.fnal.gov> for
	linux-lvm@redhat.com; Fri, 23 Jun 2006 11:18:11 -0500 (CDT)
Date: Fri, 23 Jun 2006 11:18:11 -0500
From: John Diamond <jdiamond@fnal.gov>
Message-id: <449C1443.9000605@fnal.gov>
MIME-version: 1.0
Content-transfer-encoding: 7BIT
Subject: [linux-lvm] Rescuing a VG from a busted system
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

I'm kind of a LVM newbie, so please bear with me on this question.

I had a Fedora Core 3 box die on me last night.  The disk survived, and 
it has a VG on it called VolumeGroup00 (default for FC installs, I 
believe).  I'm not really interested in reusing the disk, I just want to 
get some of my data (2 weeks of coding!) off of it, so I put the disk 
into a FC 5 box as hdb and booted up, but it doesn't recognize the 
volume on hdb.  I did some research, and the reason for this seems to be 
that since the VG on hda is also named VolumeGroup00, it will not 
recognize the VolumeGroup00 on hdb.  So my question is, what's my best 
approach for getting at the data on hdb?  Is there a way that I can 
rename the VG on hdb, or is there an even better approach?

Thanks for your time,

John

-- 
John Diamond
Fermi National Accelerator Lab
Accelerator Division, EE/Support Department
630-840-4988 - jdiamond@fnal.gov

"If it can't be done in Emacs, it's not worth doing"
