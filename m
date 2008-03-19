Received: from [10.33.0.40] (breeves.fab.redhat.com [10.33.0.40])
	by pobox.fab.redhat.com (8.13.1/8.13.1) with ESMTP id m2JDW8pe002605
	for <linux-lvm@redhat.com>; Wed, 19 Mar 2008 09:32:08 -0400
Message-ID: <47E113C4.1050503@redhat.com>
Date: Wed, 19 Mar 2008 13:23:16 +0000
From: "Bryn M. Reeves" <breeves@redhat.com>
MIME-Version: 1.0
Subject: Re: [linux-lvm] Characters allowed for vg name
References: <A78DB34D00374344A0AB65B6523C05DC02CDCF5D@marsden.win.datacash.com>
In-Reply-To: <A78DB34D00374344A0AB65B6523C05DC02CDCF5D@marsden.win.datacash.com>
Content-Transfer-Encoding: 7bit
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
To: LVM general discussion and development <linux-lvm@redhat.com>

-----BEGIN PGP SIGNED MESSAGE-----
Hash: SHA1

Gerrard Geldenhuis wrote:
> Hi
> 
> I have a kickstart file which fails if I use an - character in the
> vgname. Using a _ works fine. I did not see any reference to allowable
> characters in the man pages. The man pages only makes mention off
> allowable characters for tags.
> 
> Does anybody know what the allowable characters are for vg, pv and lv names?

The '-' character is allowed:

# vgrename t0 t0-foo
  Volume group "t0" successfully renamed to "t0-foo"

Sounds like this is the installer enforcing an additional restriction.

What distribution/version are you using?

Regards,
Bryn.

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1.4.7 (GNU/Linux)
Comment: Using GnuPG with Fedora - http://enigmail.mozdev.org

iD8DBQFH4RPE6YSQoMYUY94RAmfaAJ9ogAt9lRovgG+DvcGchebhl5BdTQCfTG+T
MIBhZhsiADR5+FWUugXZtj0=
=s/6+
-----END PGP SIGNATURE-----
