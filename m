Received: from [10.34.32.183] (mazybook.englab.brq.redhat.com [10.34.32.183])
	by pobox.stuttgart.redhat.com (8.13.1/8.13.1) with ESMTP id
	m2JDWrXs018013
	for <linux-lvm@redhat.com>; Wed, 19 Mar 2008 09:32:53 -0400
Message-ID: <47E115FC.90802@redhat.com>
Date: Wed, 19 Mar 2008 14:32:44 +0100
From: Milan Broz <mbroz@redhat.com>
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

Gerrard Geldenhuis wrote:
> I have a kickstart file which fails if I use an - character in the
> vgname. Using a _ works fine. I did not see any reference to allowable
> characters in the man pages. The man pages only makes mention off
> allowable characters for tags.

It's bug in kickstart processing - lvm allows '-' in vgname.

If using Fedora/RHEL/CentOS see
https://bugzilla.redhat.com/show_bug.cgi?id=430907

Milan

--
mbroz@redhat.com
