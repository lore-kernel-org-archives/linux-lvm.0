Received: from jeltz.chrissie.net (vpn-4-33.str.redhat.com [10.32.4.33])
	by ns3.rdu.redhat.com (8.13.8/8.13.8) with ESMTP id m9S8UtgI007713
	for <linux-lvm@redhat.com>; Tue, 28 Oct 2008 04:30:55 -0400
Message-ID: <4906CDBE.4000700@redhat.com>
Date: Tue, 28 Oct 2008 08:30:54 +0000
From: Christine Caulfield <ccaulfie@redhat.com>
MIME-Version: 1.0
Subject: Re: [linux-lvm] libdlm.h: No such file or directory
References: <17984.89.200.148.101.1224840790.squirrel@wmail.comarch.com>
	<4906B4AD.3030304@gk-software.com>
In-Reply-To: <4906B4AD.3030304@gk-software.com>
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

Stepan Kadlec wrote:
> hello list,
> I am trying to compile clustered LVM with OpenAIS (instead of cluster
> framework) using
> 
> ./configure --with-clvmd=openais --with-cluster=shared --libdir=/usr/lib64/
> 
> but it fails because of missing libdlm.h. I know this is part of the
> cluster framework, but I thought I don't need 'cluster' when using
> 'OpenAIS'.
> 
> what is the clean way for compiling clustered LVM with OpenAIS?
> 

openais support is not included in the configure script for clvmd yet.
This is mainly because the locking support in openais still needs some
work to make it totally reliable.

If you want to test clvmd over just openais then you will need to
hand-edit the Makefile for the moment ... or sweet-talk someone into
fixing the configure script ;-)

Chrissie
