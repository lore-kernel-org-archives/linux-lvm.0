Received: from mx3.redhat.com (mx3.redhat.com [172.16.48.32])
	by int-mx1.corp.redhat.com (8.12.11.20060308/8.12.11) with ESMTP id
	k6J65raE014098
	for <linux-lvm@redhat.com>; Wed, 19 Jul 2006 02:05:53 -0400
Received: from third-rock.net (ns2.globe-dns.com [82.195.149.71] (may be
	forged))
	by mx3.redhat.com (8.13.1/8.13.1) with ESMTP id k6J65bgT026216
	for <linux-lvm@redhat.com>; Wed, 19 Jul 2006 02:05:43 -0400
Message-ID: <1153289412.44bdccc4e750a@mail.third-rock.net>
Date: Tue, 18 Jul 2006 23:10:12 -0700
From: Paul Reilly <paul@astropaul.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: [linux-lvm] lvm2/dm hangs - ioctl cmd 9 failed
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
Content-Type: text/plain; charset="us-ascii"
To: linux-lvm@redhat.com



I'm getting various lvm/devmapper errors when creating and removing
snapshots on debian Sarge.

  device-mapper - ioctl cmd 9 failed: Cannot allocate memory
  Couldn't load device 'myvg-www2_snapshot'.
  Unable to deactivate logical volume "myvg-www2_snapshot"

I am using:

  LVM version:     2.01.04 (2005-02-09)
  Library version: 1.01.00-ioctl (2005-01-17)
  Driver version:  4.3.0

or package names on sarge:

 lvm2                            2.01.04-5
 libdevmapper1.01                1.01.00-4
 kernel 2.6.10

My lvm subsystem is now locked by an unkillable process.
I think the only option is to reboot, but I have a lot of
data in LVM volumes, and don't want to risk losing it.

Has anyone else experienced these types of errors?
Is there a bug fix for this?

There do not appear to be any updated packages for debian sarge.
I could install from source, if I know this is a known problem
with a known fix.

Thanks
Paul
