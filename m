Received: from mx3.redhat.com (mx3.redhat.com [172.16.48.32])
	by int-mx1.corp.redhat.com (8.11.6/8.11.6) with ESMTP id j9LFpNV14689
	for <linux-lvm@redhat.com>; Fri, 21 Oct 2005 11:51:23 -0400
Received: from vger.nix.hu (norbi.axelero.com [195.228.243.93])
	by mx3.redhat.com (8.13.1/8.13.1) with ESMTP id j9LFpH0k028393
	for <linux-lvm@redhat.com>; Fri, 21 Oct 2005 11:51:17 -0400
Received: from vger.nix.hu (localhost [127.0.0.1])
	by vger.nix.hu (Postfix) with SMTP id 302E01C0AE
	for <linux-lvm@redhat.com>; Fri, 21 Oct 2005 17:51:15 +0200 (CEST)
Date: Fri, 21 Oct 2005 17:51:15 +0200
From: BUCHMULLER Norbert <norbi.lists@nix.hu>
Subject: Re: [linux-lvm] Possible probings of my CDROM?
Message-Id: <20051021175115.0f7769dd.norbi.lists@nix.hu>
In-Reply-To: <20051020172654.3b938fd0.asterius@nerdshack.com>
References: <20051020172654.3b938fd0.asterius@nerdshack.com>
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

On Thu, 20 Oct 2005 17:26:54 +0400
Dmitry Comoda <asterius@nerdshack.com> wrote:

> I wonder if that is something to do with LVM? When CD in CDROM drive, it
> boots just fine. I have uncommented the line in /etc/lvm/lvm.conf
> Just in case, here is my lvm.conf file:
>     # Exclude the cdrom drive
>       filter = [ "r|/dev/cdrom|" ]

Seems fine. (And  no filter lines redefine it later.) Does the /dev/cdrom
symlink actually exist?


norbi
