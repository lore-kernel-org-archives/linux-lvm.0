Received: from mx1.redhat.com (ext-mx14.extmail.prod.ext.phx2.redhat.com
	[10.5.110.19])
	by int-mx11.intmail.prod.int.phx2.redhat.com (8.14.4/8.14.4) with ESMTP
	id r632Cu7V027005
	for <linux-lvm@redhat.com>; Tue, 2 Jul 2013 22:12:56 -0400
Received: from nm21-vm2.access.bullet.mail.gq1.yahoo.com
	(nm21-vm2.access.bullet.mail.gq1.yahoo.com [216.39.63.49])
	by mx1.redhat.com (8.14.4/8.14.4) with ESMTP id r632Ct9P001344
	for <linux-lvm@redhat.com>; Tue, 2 Jul 2013 22:12:55 -0400
References: <039e01ce7749$7874c6c0$695e5440$@deriva.de>
Message-ID: <1372817573.68865.YahooMailNeo@web181501.mail.ne1.yahoo.com>
Date: Tue, 2 Jul 2013 19:12:53 -0700 (PDT)
From: matthew patton <pattonme@yahoo.com>
In-Reply-To: <039e01ce7749$7874c6c0$695e5440$@deriva.de>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: Re: [linux-lvm] Is cLVM necessary when accessing different logical
	volumes on a shared iSCSI target?
Reply-To: matthew patton <pattonme@yahoo.com>,
	LVM general discussion and development <linux-lvm@redhat.com>
List-Id: LVM general discussion and development <linux-lvm.redhat.com>
List-Unsubscribe: <https://www.redhat.com/mailman/options/linux-lvm>,
	<mailto:linux-lvm-request@redhat.com?subject=unsubscribe>
List-Archive: <https://www.redhat.com/archives/linux-lvm>
List-Post: <mailto:linux-lvm@redhat.com>
List-Help: <mailto:linux-lvm-request@redhat.com?subject=help>
List-Subscribe: <https://www.redhat.com/mailman/listinfo/linux-lvm>,
	<mailto:linux-lvm-request@redhat.com?subject=subscribe>
List-Id: <linux-lvm.redhat.com>
Content-Type: text/plain; charset="utf-8"
To: LVM general discussion and development <linux-lvm@redhat.com>

> directions, i.e. I can create a logical volume in one client or the other,

> and it is always visible, but unavailable to the other client.
> So far, everything seems to work fine. Now my question is: Is this setup
> sufficient or do I need cLVM?

You don't need cLVM just as long as you never screw up. It's been a while since I played with just such a setup but,

1) edit lvm.conf and disable all metadata caching
2) edit lvm.conf and set the locking style to '4' and set wait_for_locks=0

"locking_type�- What type of locking to use. 1 is the default, which use flocks on files in�locking_dir�(see below) to avoid conflicting LVM2 commands running concurrently on a single machine. 0 disables locking and risks corrupting your metadata. If set to 2, the tools will load the external�locking_library�(see below). If the tools were configured�--with-cluster=internal�(the default) then 3 means to use built-in cluster-wide locking. Type 4 enforces read-only metadata and forbids any operations that might want to modify Volume Group metadata. All changes to logical volumes and their states are communicated using locks.
wait_for_locks�- When set to 1, the default, the tools wait if a lock request cannot be satisfied immediately. When set to 0, the operation is aborted instead."

You can approximate cLVM by using a lightway quorum daemon like CARP and issue your LVM commands by SSHing to the shared virtual IP host (just an alias on one of your 2 or N boxes). You could even in jest make it a shell function/alias named 'clvm' which uses an alternate "lvm.conf" that has locking_type=1.

The main complication is with (de)activating LV and assigning it to the other host. I forget what happens if you do an 'lvchange -ay ' on a common LV and the other host has already done so. In any event you'll want to make sure all LVs are NOT automatically activated (default) on bootup.

The best option is to implement your own locking module (ie. repurpose the negotiation/handshake/quorum code from eg. CARP) and your locking module just checks to see if "am I master? T or F" and punts if not. More than a handful of hosts and I would spend the energy getting cLVM working. Though it took me way longer than it should have to get things to stop hanging for all eternity (kernel messages about stalled threads and what not) and for it to behave correctly even if I willy-nilly power-reset the boxes.
