Received: from mx3.redhat.com (mx3.redhat.com [172.16.48.32])
	by int-mx1.corp.redhat.com (8.11.6/8.11.6) with ESMTP id j9V3rxV20873
	for <linux-lvm@redhat.com>; Sun, 30 Oct 2005 22:53:59 -0500
Received: from karen.nerdshack.com (karen.nerdshack.com [209.189.235.41])
	by mx3.redhat.com (8.13.1/8.13.1) with ESMTP id j9V3rqrE012529
	for <linux-lvm@redhat.com>; Sun, 30 Oct 2005 22:53:53 -0500
Received: from dispatchd.nerdshack.com (julie.nerdshack.com [209.189.235.39])
	by karen.nerdshack.com (Postfix) with SMTP id 075571E3DE3
	for <linux-lvm@redhat.com>; Sun, 30 Oct 2005 21:49:20 -0600 (CST)
Date: Mon, 31 Oct 2005 07:50:09 +0300
From: Dmitry Comoda <asterius@nerdshack.com>
Subject: Re: [linux-lvm] Possible probings of my CDROM?
Message-Id: <20051031075009.3510e27d.asterius@nerdshack.com>
In-Reply-To: <20051022170233.1977d524.norbi@nix.hu>
References: <20051020172654.3b938fd0.asterius@nerdshack.com>
	<20051021175115.0f7769dd.norbi.lists@nix.hu>
	<20051021230804.003d8d8d.asterius@nerdshack.com>
	<20051022170233.1977d524.norbi@nix.hu>
Mime-Version: 1.0
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

yes, it is:

ls -l /dev/cdrom
lrwxrwxrwx  1 root root 3 Oct 31 06:39 /dev/cdrom -> hdb

any ideas? I don't remember exactly, but I was playing with
couple of lvm tools, and I have always has some sort of wornings about
CDROM, so it might be likely that I have this problem because of LVM.
Thanks again.

Dmitry.


On Sat, 22 Oct 2005 17:02:33 +0200
BUCHMULLER Norbert <norbi@nix.hu> wrote:

> On Fri, 21 Oct 2005 23:08:04 +0400
> Dmitry Comoda <asterius@nerdshack.com> wrote:
> 
> > I would be greatful to find out how I can determine that.
> > Thanks fot the reply.
> 
> Type in a shell command line:
> 
> ls -l /dev/cdrom
> 
> If the symlink exists, it looks similar to this:
> 
> lrwxrwxrwx  1 root root 3 Oct  9 21:17 /dev/cdrom -> hdc
> 
> 
> norbi
> 
> _______________________________________________
> linux-lvm mailing list
> linux-lvm@redhat.com
> https://www.redhat.com/mailman/listinfo/linux-lvm
> read the LVM HOW-TO at http://tldp.org/HOWTO/LVM-HOWTO/
