Received: from mimecast-mx02.redhat.com
	(mimecast04.extmail.prod.ext.rdu2.redhat.com [10.11.55.20])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 680602166BA2
	for <linux-lvm@redhat.com>; Thu,  9 Jul 2020 15:36:14 +0000 (UTC)
Received: from us-smtp-1.mimecast.com (us-smtp-delivery-1.mimecast.com
	[207.211.31.120])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-SHA384 (256/256 bits))
	(No client certificate requested)
	by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 59C1E10DCE81
	for <linux-lvm@redhat.com>; Thu,  9 Jul 2020 15:36:14 +0000 (UTC)
From: B&A Consultants <infos+dmcrypt@ba-consultants.fr>
References: <b6dd0ff9-402c-d2f7-8a15-672207953f99@ba-consultants.fr>
	<f5f8d9ab-09c4-8328-2155-7d24b85c99e5@redhat.com>
Message-ID: <7fa5c7ab-67a5-9740-84e8-6ae3a7693b46@ba-consultants.fr>
Date: Thu, 9 Jul 2020 17:26:22 +0200
MIME-Version: 1.0
In-Reply-To: <f5f8d9ab-09c4-8328-2155-7d24b85c99e5@redhat.com>
Content-Language: en-US
Content-Transfer-Encoding: 8bit
Subject: Re: [linux-lvm] [dm-crypt] LuksOpen hangs ?
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
Content-Type: text/plain; charset="utf-8"
To: Ondrej Kozina <okozina@redhat.com>, dm-crypt@saout.de
Cc: linux-lvm@redhat.com

Hello,

Sorry for the delay. Since the locking problem means we then have to
reboot the machine, we had to wait for a slot without too much activity.

On 29/06/2020 16:34, Ondrej Kozina wrote:
> Could you please send debug output also for particular hanging lvm2
> command? Just add -vvvv to the command. Syslog output would also help.
>
> I can't tell you more than the cryptsetup command is stuck in I/O.
> Perhaps hosting LV is suspended due to some error but I can't tell for
> sure.

So... First the cryptsetup command on the « relevant » LV :

cryptsetup --verbose --debug open /dev/v03/E192-X E192
# cryptsetup 2.3.2 processing "cryptsetup --verbose --debug open
/dev/v03/E192-X E192"
# Running command open.
# Locking memory.
# Installing SIGINT/SIGTERM handler.
# Unblocking interruption on signal.
# Allocating context for crypt device /dev/v03/E192-X.
# Trying to open and read device /dev/v03/E192-X with direct-io.
# Initialising device-mapper backend library.
# Trying to load any crypt type from device /dev/v03/E192-X.
# Crypto backend (OpenSSL 1.1.1g  21 Apr 2020) initialized in cryptsetup
library version 2.3.2.
# Detected kernel Linux 5.4.38-gentoo-LTS x86_64.
# PBKDF pbkdf2-sha256, time_ms 2000 (iterations 0).
# Reading LUKS header of size 1024 from device /dev/v03/E192-X
# Key length 32, device size 2147483648 sectors, header size 2050 sectors.
# Activating volume E192 using token -1.
# Interactive passphrase entry requested.
Enter passphrase for /dev/v03/E192-X:
# Activating volume E192 [keyslot -1] using passphrase.
# dm version   [ opencount flush ]   [16384] (*1)
# dm versions   [ opencount flush ]   [16384] (*1)
# Detected dm-ioctl version 4.41.0.
# Detected dm-crypt version 1.19.0.
# Device-mapper backend running with UDEV support enabled.
# dm status E192  [ opencount noflush ]   [16384] (*1)
# Trying to open key slot 0 [ACTIVE_LAST].
# Reading key slot 0 area.
# Using userspace crypto wrapper to access keyslot area.
# Reusing open ro fd on device /dev/v03/E192-X

The command does not give control back, last displayed message as above.

Syslog gives this very quickly after the cryptsetup :

kernel: [31628.245265] usb 4-1.3.4: reset SuperSpeed Gen 1 USB device
number 7 using xhci_hcd

So there may be some hardware problem.

We did a simple lvscan -vvvv (names have been altered for
confidentiality, and we have suppressed a lot of the disk scanning
messages) :

#device/dev-cache.c:761           Found dev 253:3
/dev/disk/by-id/dm-name-X-E246-X- - new alias.
#device/dev-cache.c:761           Found dev 253:3
/dev/disk/by-id/dm-uuid-LVM-TOUXYrO3Bntbs45SGEDLrcjT1fqwDLfpflLwNkbvdkJLiZXBov0W3CrVcY30XXMd
- new alias.
#device/dev-cache.c:761           Found dev 253:3
/dev/disk/by-uuid/30cb5aef-c58f-40e9-9e44-d37e113c3ea6 - new alias.
#device/dev-cache.c:761           Found dev 253:3 /dev/mapper/X-E246--X
- new alias.
#device/dev-cache.c:721           Found dev 253:4 /dev/dm-4 - new.
#device/dev-cache.c:761           Found dev 253:4
/dev/disk/by-id/dm-name-v03-E192-X - new alias.
#device/dev-cache.c:761           Found dev 253:4
/dev/disk/by-id/dm-uuid-LVM-ppvRwREaX6hj9inWWjaKEsTnvT42WhF2MCddbrQjgxA2n3gOQByeWjqdD43kJFbZ
- new alias.
#device/dev-cache.c:761           Found dev 253:4
/dev/disk/by-uuid/9bcee5de-aa79-42f1-bcd2-9ecfc0acc30f - new alias.
#device/dev-cache.c:761           Found dev 253:4 /dev/mapper/v03-E192-X
- new alias.
#device/dev-cache.c:761           Found dev 253:4 /dev/v03/E192-X - new
alias.
#filters/filter-persistent.c:346           filter caching good /dev/sdf
#cache/lvmcache.c:2080          lvmcache /dev/sdf: now in VG
#orphans_lvm2 (#orphans_lvm2) with 0 mda(s).
#filters/filter-persistent.c:346           filter caching good /dev/sde
#cache/lvmcache.c:2080          lvmcache /dev/sde: now in VG
#orphans_lvm2 (#orphans_lvm2) with 0 mda(s).
#filters/filter-persistent.c:346           filter caching good /dev/sdg
#cache/lvmcache.c:2080          lvmcache /dev/sdg: now in VG
#orphans_lvm2 (#orphans_lvm2) with 0 mda(s).
#metadata/vg.c:67            Allocated VG v03 at 0x55bec1b74110.
#format_text/import_vsn1.c:591           Importing logical volume
v03/E192-X.
#format_text/import_vsn1.c:591           Importing logical volume v03/P50-X.
#cache/lvmcache.c:754           lvmcache has no info for vgname "v03"
with VGID ppvRwREaX6hj9inWWjaKEsTnvT42WhF2.
#cache/lvmcache.c:754           lvmcache has no info for vgname "v03".
#cache/lvmcache.c:2080          lvmcache /dev/sdf: now in VG v03 with 1
mda(s).
#cache/lvmcache.c:1908          lvmcache /dev/sdf: VG v03: set VGID to
ppvRwREaX6hj9inWWjaKEsTnvT42WhF2.
#cache/lvmcache.c:2080          lvmcache /dev/sde: now in VG v03
(ppvRwREaX6hj9inWWjaKEsTnvT42WhF2) with 1 mda(s).
#cache/lvmcache.c:2080          lvmcache /dev/sdg: now in VG v03
(ppvRwREaX6hj9inWWjaKEsTnvT42WhF2) with 1 mda(s).
#cache/lvmetad.c:2510          Sending lvmetad vg_clear_outdated_pvs

And nothing more, lvscan hangs there.

Sincerely,
-- 
B&A Consultants - Sécurité informatique - Conseils et audits
www.ba-consultants.fr
Tél : (0) 563 277 241 - Fax : (0) 567 737 829
