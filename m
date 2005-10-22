Received: from mx1.redhat.com (mx1.redhat.com [172.16.48.31])
	by int-mx1.corp.redhat.com (8.11.6/8.11.6) with ESMTP id j9MF2mV15922
	for <linux-lvm@redhat.com>; Sat, 22 Oct 2005 11:02:48 -0400
Received: from vger.nix.hu (dsl5400D6EE.pool.t-online.hu [84.0.214.238])
	by mx1.redhat.com (8.12.11/8.12.11) with ESMTP id j9MF2mUb013147
	for <linux-lvm@redhat.com>; Sat, 22 Oct 2005 11:02:48 -0400
Received: from vger.nix.hu (localhost [127.0.0.1])
	by vger.nix.hu (Postfix) with SMTP id 81AEC1C0B1
	for <linux-lvm@redhat.com>; Sat, 22 Oct 2005 17:02:33 +0200 (CEST)
Date: Sat, 22 Oct 2005 17:02:33 +0200
From: BUCHMULLER Norbert <norbi@nix.hu>
Subject: Re: [linux-lvm] Possible probings of my CDROM?
Message-Id: <20051022170233.1977d524.norbi@nix.hu>
In-Reply-To: <20051021230804.003d8d8d.asterius@nerdshack.com>
References: <20051020172654.3b938fd0.asterius@nerdshack.com>
	<20051021175115.0f7769dd.norbi.lists@nix.hu>
	<20051021230804.003d8d8d.asterius@nerdshack.com>
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

On Fri, 21 Oct 2005 23:08:04 +0400
Dmitry Comoda <asterius@nerdshack.com> wrote:

> I would be greatful to find out how I can determine that.
> Thanks fot the reply.

Type in a shell command line:

ls -l /dev/cdrom

If the symlink exists, it looks similar to this:

lrwxrwxrwx  1 root root 3 Oct  9 21:17 /dev/cdrom -> hdc


norbi
