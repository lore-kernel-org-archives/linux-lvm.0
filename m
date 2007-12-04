Received: from mx3.redhat.com (mx3.redhat.com [172.16.48.32])
	by int-mx1.corp.redhat.com (8.13.1/8.13.1) with ESMTP id lB42TPpY011377
	for <linux-lvm@redhat.com>; Mon, 3 Dec 2007 21:29:25 -0500
Received: from smtpoutwbe02.prod.mesa1.secureserver.net
	(smtpoutwbe02.prod.mesa1.secureserver.net [208.109.78.113])
	by mx3.redhat.com (8.13.1/8.13.1) with SMTP id lB42SmEB009771
	for <linux-lvm@redhat.com>; Mon, 3 Dec 2007 21:28:54 -0500
Date: Mon, 03 Dec 2007 19:02:03 -0700
From: Dave Scott <dave@mauidiver.com>
Message-ID: <20071203190203.51068ac31da99c5a25b4d9fb7ad88fd1.61b74e1b4b.wbe@email.secureserver.net>
MIME-Version: 1.0
Subject: [linux-lvm] lvm amnesia (Incorrect metadata area header checksum)
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
Content-Type: TEXT/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: linux-lvm@redhat.com

Hi all,

I have a RAID5 array that lost a disk during an upgrade to Fedora Core8.

After the upgrade, only parts of the array made it back up. I removed
the disk from the array and replaced it and the rebuilding process began
(and finished).

If I 'cat' the device, I can see that my data is still there (whew).

But, the physical volume, the (single) volume group, and the logical
volumes (3) did not seem to be there any more.

'pvscan' showed no pv's, so I recreated 'pv0' using the uuid from the VG
archive file, a la:

# pvcretae --force --uuid "sbqK9..." --restorefile
/etc/lvm/archive/raid5a_00007.vg pv0

Now, 'pvscan' spits out three 'Incorrect metadata area header checksum'
messages and the PV data. I.e.,

# pvscan
Incorrect metadata area header checksum
Incorrect metadata area header checksum
Incorrect metadata area header checksum
PV /dev/md1        lvm2 [255.89 GB]
Total: 1 [255.89 GB] / in use: 0 [0   ] / in no VG: 1 [255.89 GB]
# vgscan -v
  Wiping cache of LVM-capable devices
  Wiping internal VG cache
Reading all physical volumes.  This may take a while...
  Finding all volume groups
Incorrect metadata area header checksum
# lvscan -v
  Finding all volume groups
Incorrect metadata area header checksum
#
 
I have the archive file and the data. How do I get the lvm to see it
once again?

Please, please help...   :(

If you need more info, let me know. I've got little else to try.

--dave;
