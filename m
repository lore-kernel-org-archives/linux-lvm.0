Received: from mx1.redhat.com (ext-mx03.extmail.prod.ext.phx2.redhat.com
	[10.5.110.7])
	by int-mx08.intmail.prod.int.phx2.redhat.com (8.13.8/8.13.8) with ESMTP
	id n87IdFvZ013090
	for <linux-lvm@redhat.com>; Mon, 7 Sep 2009 14:39:15 -0400
Received: from wavehammer.waldi.eu.org (wavehammer.waldi.eu.org
	[82.139.201.20])
	by mx1.redhat.com (8.13.8/8.13.8) with ESMTP id n87Id4mZ005201
	for <linux-lvm@redhat.com>; Mon, 7 Sep 2009 14:39:05 -0400
Resent-Message-ID: <20090907183910.GA26084@wavehammer.waldi.eu.org>
Resent-To: linux-lvm@redhat.com
From: Bastian Blank <waldi@debian.org>
Message-ID: <20090819151513.GA23929@wavehammer.waldi.eu.org>
References: <20090819145009.4865.25675.reportbug@swivel.zugschlus.de>
MIME-Version: 1.0
Content-Type: multipart/mixed; boundary="huq684BweRXVnRxX"
Content-Disposition: inline
In-Reply-To: <20090819145009.4865.25675.reportbug@swivel.zugschlus.de>
Subject: [linux-lvm] Re: Bug#542422: dmsetup: I would like to have speaking
	device names back
Reply-To: LVM general discussion and development <linux-lvm@redhat.com>
List-Id: LVM general discussion and development <linux-lvm.redhat.com>
List-Unsubscribe: <https://www.redhat.com/mailman/listinfo/linux-lvm>,
	<mailto:linux-lvm-request@redhat.com?subject=unsubscribe>
List-Archive: <https://www.redhat.com/archives/linux-lvm>
List-Post: <mailto:linux-lvm@redhat.com>
List-Help: <mailto:linux-lvm-request@redhat.com?subject=help>
List-Subscribe: <https://www.redhat.com/mailman/listinfo/linux-lvm>,
	<mailto:linux-lvm-request@redhat.com?subject=subscribe>
Date: Mon, 07 Sep 2009 18:39:17 -0000
List-Id: <linux-lvm.redhat.com>
To: Marc Haber <mh+debian-bugs@zugschlus.de>, 542422@bugs.debian.org, agk@redhat.com


--huq684BweRXVnRxX
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline

On Wed, Aug 19, 2009 at 04:50:09PM +0200, Marc Haber wrote:
> Since the last update, my crypto devices are recognized by the system as
> /dev/dm-xx, for example in fsck and in df's output:
> /dev/dm-15             12G   11G  565M  96% /mnt/home
> /dev/dm-13            7,9G  7,0G  532M  94% /mnt/usr
> /dev/dm-14            3,0G  1,4G  1,5G  50% /mnt/var
> 
> lrwxrwxrwx  1 root root      8 19. Aug 09:06 home -> ../dm-15
> lrwxrwxrwx  1 root root      8 19. Aug 09:06 usr -> ../dm-13
> lrwxrwxrwx  1 root root      8 19. Aug 09:06 var -> ../dm-14
> 
> I'd like them to show up as /dev/mapper/home, /dev/mapper/usr and
> /dev/mapper/var again.

This means that the real devices needs to be named this way as mount
always dereferences symlinks.

Patch which does this against the Debian package is attached.

Alasdair: Does Red Hat solve that problem somehow?

Bastian

-- 
Humans do claim a great deal for that particular emotion (love).
		-- Spock, "The Lights of Zetar", stardate 5725.6

--huq684BweRXVnRxX
Content-Type: text/plain; charset=utf-8
Content-Disposition: attachment; filename=diff

Index: debian/contrib/dmsetup/lib/udev/rules.d/55-dm.rules
===================================================================
--- debian/contrib/dmsetup/lib/udev/rules.d/55-dm.rules	(revision 711)
+++ debian/contrib/dmsetup/lib/udev/rules.d/55-dm.rules	(working copy)
@@ -39,6 +39,6 @@
 ENV{DM_SUSPENDED}=="Active", ENV{DM_SUSPENDED}="0"
 ENV{DM_SUSPENDED}=="Suspended", ENV{DM_SUSPENDED}="1"
 
-ENV{DM_NAME}=="?*", SYMLINK+="mapper/$env{DM_NAME}"
+ENV{DM_NAME}=="?*", NAME="mapper/$env{DM_NAME}", SYMLINK+="$kernel"
 
 LABEL="dm_end"

--huq684BweRXVnRxX--
