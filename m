Message-ID: <53F34C9D.7090601@redhat.com>
Date: Tue, 19 Aug 2014 15:09:49 +0200
From: Peter Rajnoha <prajnoha@redhat.com>
MIME-Version: 1.0
References: <53F33A68.2050203@mglug.de>
In-Reply-To: <53F33A68.2050203@mglug.de>
Content-Transfer-Encoding: 7bit
Subject: Re: [linux-lvm] Szenario for lvmetad
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
Content-Type: text/plain; charset="us-ascii"
To: rath@mglug.de
Cc: LVM general discussion and development <linux-lvm@redhat.com>

On 08/19/2014 01:52 PM, Oliver Rath wrote:
> Hi list,
> 
> does it make sense to use lvmetad in one pc with 4 disks, which are used
> for lvm? Are the metadata cached in a non-lvmetad environment?

Without lvmetad all the block devs are scanned (minus the ones that
are filtered) for each LVM command execution - there's no other persistent
cache. If you don't have numerous block disks in the system, you probably won't
lose much by switching off lvmetad.

However, LVM autoactivation depends on lvmetad use so if you disable lvmetad,
the LVM volumes must be always activated directly (either as part of bootup
script - which is normally left there in case someone disables lvmetad) or
the volumes must be activated on cmd line directly if you attach any PVs
when the system is already up and running (e.g. attaching iSCSI or FCoE
devices, flash disks, external storage...).

-- 
Peter
