Received: from mx3.redhat.com (mx3.redhat.com [172.16.48.32])
	by int-mx1.corp.redhat.com (8.11.6/8.11.6) with ESMTP id j9EKfJV10939
	for <linux-lvm@redhat.com>; Fri, 14 Oct 2005 16:41:19 -0400
Received: from host1.appws.com (host1.appws.com [216.136.72.3])
	by mx3.redhat.com (8.13.1/8.13.1) with ESMTP id j9EKf4I1023063
	for <linux-lvm@redhat.com>; Fri, 14 Oct 2005 16:41:13 -0400
Received: from grandmother.littlebald.com (localhost.localdomain [127.0.0.1])
	by grandmother.littlebald.com (8.13.1/8.13.1) with ESMTP id
	j9EKkNoV002893
	for <linux-lvm@redhat.com>; Fri, 14 Oct 2005 16:46:23 -0400
Received: (from david@localhost)
	by grandmother.littlebald.com (8.13.1/8.13.1/Submit) id j9EKkN9i002892
	for linux-lvm@redhat.com; Fri, 14 Oct 2005 16:46:23 -0400
Subject: Re: [linux-lvm] How to turn LVM off
From: David Johnston <david@littlebald.com>
In-Reply-To: <1129245104.28482.15.camel@pc7.dolda2000.com>
References: <26F201282709AA4895C203A194DA57DB4ED8EE@slcexch.cyberkineticsinc.com>
	<1129245104.28482.15.camel@pc7.dolda2000.com>
Content-Transfer-Encoding: 7bit
Date: Fri, 14 Oct 2005 16:46:22 -0400
Message-Id: <1129322782.2860.3.camel@grandmother.littlebald.com>
Mime-Version: 1.0
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

On Fri, 2005-10-14 at 01:11 +0200, Fredrik Tolf wrote:
> On Wed, 2005-10-12 at 11:59 -0600, Kirk Korver wrote:
> > Hello,
> 
> Hi!
> 
> [...]
> > I see it is asking about VolGroup00. This is LVM stuff. I don't want LVM
> > on the card. What is really weird is that all of this is happening
> > before the rc.sysinit is started.
> 
> As you can see from the fact that nash is running, it is the initrd
> running at this point. 
> > All of the LVM options are "modules" when I built my kernel.
> 
> Indeed, but they are probably on the initrd image and loaded by the nash
> script.
> > What do I have to do so that LVM is NOT used?? Any other options?
> 
> You'd probably have to rebuild the initrd to fit your liking. There is a
> script that comes with FC called "mkinitrd" that builds an initrd with
> the modules and programs necessary to mount to root filesystem. Probably
> that script detected that you're using LVM, and it is thus trying to
> recreate that environment.
> If I were you, I'd unzip the initrd image, mount it, and edit it manually.

Fredrik,
I'd do the same.  If you think you will need to update your system
frequently, then I suggest that you remove LVM from your development
system; then it shouldn't be an issue.

-David
