Received: from mx1.redhat.com (mx1.redhat.com [172.16.48.31])
	by int-mx1.corp.redhat.com (8.11.6/8.11.6) with ESMTP id j9LJAoV23253
	for <linux-lvm@redhat.com>; Fri, 21 Oct 2005 15:10:50 -0400
Received: from karen.nerdshack.com (karen.nerdshack.com [209.189.235.41])
	by mx1.redhat.com (8.12.11/8.12.11) with ESMTP id j9LJAlSk013933
	for <linux-lvm@redhat.com>; Fri, 21 Oct 2005 15:10:48 -0400
Received: from dispatchd.nerdshack.com (julie.nerdshack.com [209.189.235.39])
	by karen.nerdshack.com (Postfix) with SMTP id 1529E1E3BEB
	for <linux-lvm@redhat.com>; Fri, 21 Oct 2005 14:07:38 -0500 (CDT)
Date: Fri, 21 Oct 2005 23:08:04 +0400
From: Dmitry Comoda <asterius@nerdshack.com>
Subject: Re: [linux-lvm] Possible probings of my CDROM?
Message-Id: <20051021230804.003d8d8d.asterius@nerdshack.com>
In-Reply-To: <20051021175115.0f7769dd.norbi.lists@nix.hu>
References: <20051020172654.3b938fd0.asterius@nerdshack.com>
	<20051021175115.0f7769dd.norbi.lists@nix.hu>
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

I would be greatful to find out how I can determine that.
Thanks fot the reply.

Dmitry.

On Fri, 21 Oct 2005 17:51:15 +0200
BUCHMULLER Norbert <norbi.lists@nix.hu> wrote:

> On Thu, 20 Oct 2005 17:26:54 +0400
> Dmitry Comoda <asterius@nerdshack.com> wrote:
> 
> > I wonder if that is something to do with LVM? When CD in CDROM drive, it
> > boots just fine. I have uncommented the line in /etc/lvm/lvm.conf
> > Just in case, here is my lvm.conf file:
> >     # Exclude the cdrom drive
> >       filter = [ "r|/dev/cdrom|" ]
> 
> Seems fine. (And  no filter lines redefine it later.) Does the /dev/cdrom
> symlink actually exist?
> 
> 
> norbi
> 
> _______________________________________________
> linux-lvm mailing list
> linux-lvm@redhat.com
> https://www.redhat.com/mailman/listinfo/linux-lvm
> read the LVM HOW-TO at http://tldp.org/HOWTO/LVM-HOWTO/
