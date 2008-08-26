Received: from pobox.fab.redhat.com (pobox.fab.redhat.com [10.33.63.12])
	by int-mx1.corp.redhat.com (8.13.1/8.13.1) with ESMTP id m7QAnubl008390
	for <linux-lvm@redhat.com>; Tue, 26 Aug 2008 06:49:56 -0400
Received: from [10.33.0.40] (breeves.fab.redhat.com [10.33.0.40])
	by pobox.fab.redhat.com (8.13.1/8.13.1) with ESMTP id m7QAnuHS007844
	for <linux-lvm@redhat.com>; Tue, 26 Aug 2008 06:49:56 -0400
Message-ID: <48B3DFD4.5030502@redhat.com>
Date: Tue, 26 Aug 2008 11:49:56 +0100
From: "Bryn M. Reeves" <bmr@redhat.com>
MIME-Version: 1.0
Subject: Re: [linux-lvm] VG won't activate upon reboot
References: <BAY107-W8ADCAC071D0CAF22B6B488F640@phx.gbl>
In-Reply-To: <BAY107-W8ADCAC071D0CAF22B6B488F640@phx.gbl>
Content-Transfer-Encoding: 7bit
Reply-To: bmr@redhat.com,
	LVM general discussion and development <linux-lvm@redhat.com>
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
To: LVM general discussion and development <linux-lvm@redhat.com>

-----BEGIN PGP SIGNED MESSAGE-----
Hash: SHA1

Mark Reardon wrote:
> Upon reboot, my VG will not activate, therefore I'm unable to mount the filesystem.
> 
> I have to run a vgchange -ay , then mount the filesystem manually.
> 
> I need the VG to activate on reboot, how do I do this?

You're not giving us any information with which to help you. What OS
distribution is this? How is the VG configured? What type of storage
does it use? Do you get any errors/warnings while booting? Etc.

Regards,
Bryn.

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1.4.7 (GNU/Linux)
Comment: Using GnuPG with Fedora - http://enigmail.mozdev.org

iD8DBQFIs9/T6YSQoMYUY94RAokuAJ9zb6178/dkiRETGhRFpeJC2CGcHQCggcLu
bQNHxr/qSKBBwMvuChwEcO4=
=4TBD
-----END PGP SIGNATURE-----
