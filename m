Received: from agk.surrey.redhat.com (agk.surrey.redhat.com [172.16.10.74])
	by pobox.surrey.redhat.com (8.12.11.20060308/8.12.11) with ESMTP id
	l1HIYV4e032377
	for <linux-lvm@redhat.com>; Sat, 17 Feb 2007 18:34:31 GMT
Received: from agk by agk.surrey.redhat.com with local (Exim 4.34)
	id 1HIUOF-0003oc-2Y
	for linux-lvm@redhat.com; Sat, 17 Feb 2007 18:34:31 +0000
Date: Sat, 17 Feb 2007 18:34:31 +0000
From: Alasdair G Kergon <agk@redhat.com>
Subject: Re: [linux-lvm] vgdisplay - checksum error - what does it mean?
Message-ID: <20070217183431.GW7201@agk.surrey.redhat.com>
References: <45D448F5.3000301@wpkg.org> <45D47AF5.2040106@wpkg.org>
	<20070216074737.GA14119@percy.comedia.it>
	<45D57D16.8060902@wpkg.org>
	<20070217125644.GC11919@percy.comedia.it>
Mime-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20070217125644.GC11919@percy.comedia.it>
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
Content-Transfer-Encoding: 7bit
To: linux-lvm@redhat.com

On Sat, Feb 17, 2007 at 01:56:44PM +0100, Luca Berra wrote:
> On Fri, Feb 16, 2007 at 10:44:54AM +0100, Tomasz Chmielewski wrote:
> >BTW, the machine is running Debian etch (ARM port).
> mmm i don't have an arm maybe this is the issue why lvm does not
> understand that sda2 is a md component?!?
 
I've not followed this thread, but you must use version 2.02.21 or later
for the ARM architecture with md (or backport the patch).

Alasdair
-- 
agk@redhat.com
