Received: from mx1.redhat.com (mx1.redhat.com [172.16.48.31])
	by int-mx1.corp.redhat.com (8.13.1/8.13.1) with ESMTP id l87HsBTN001216
	for <linux-lvm@redhat.com>; Fri, 7 Sep 2007 13:54:11 -0400
Received: from mail.linbit.com (aug.linbit.com [212.69.162.22])
	by mx1.redhat.com (8.13.1/8.13.1) with ESMTP id l87Hs2Ye019870
	for <linux-lvm@redhat.com>; Fri, 7 Sep 2007 13:54:03 -0400
Received: from soda.linbit (p548CCCD5.dip.t-dialin.net [84.140.204.213])
	(using TLSv1 with cipher DHE-RSA-AES128-SHA (128/128 bits))
	(No client certificate requested)
	by mail.linbit.com (LINBIT Mail Daemon) with ESMTP id C9D132E3A7A1
	for <linux-lvm@redhat.com>; Fri,  7 Sep 2007 19:53:53 +0200 (CEST)
Date: Fri, 7 Sep 2007 19:53:45 +0200
From: Lars Ellenberg <linux-lvm@linbit.com>
Subject: Re: [linux-lvm] Question on duplicating equally-sized HDs with dd and
	changing VG name and PV UUIDs
Message-ID: <20070907175345.GA5931@racke.local>
References: <20070907121306.GA27457@heitec.net>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20070907121306.GA27457@heitec.net>
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

On Fri, Sep 07, 2007 at 02:13:07PM +0200, Holger Rauch wrote:
> Hi,
> 
> I got a machine having two HDs of the same size (250 GB each), devices
> /dev/sda and /dev/sdb. /dev/sda contains VG rootvg which in turn contains
> several LVs. VG rootvg consists of one PV, /dev/sda5. All this was set up
> using LVM2.
> 
> I want to have the same HD partition/VG/LV layout on /dev/sdb with the
> following differences:
> 
> - A different VG name: backupvg instead of rootvg
> - A different UUID for PV /dev/sdb5 (since that's supposed to be the underlying
>   PV for VG backupvg)
> 
> Purpose of that setup is to be able to easily copy filesystem contents
> between filesystems located on LVs of the same name but in different VGs.
> (Apart from that, the filesystems are of the same type and size).

now, why would you want to dd the full disk,
and then change thr uuids?
what is wrong with
 sfdisk -d /dev/sda | sfdisk /dev/sdb
 lvs -o attr,name,size --noheadings rootvg |
 while read a n s; do
 	[[ $a == -* ]] || continue;
	lvcreate -L $s -n $n backupvg ;
	# dd bs=1M if=/dev/rootvg/$n of=/dev/backupvg/$n
 done
?

-- 
: Lars Ellenberg                            Tel +43-1-8178292-55 :
: LINBIT Information Technologies GmbH      Fax +43-1-8178292-82 :
: Vivenotgasse 48, A-1120 Vienna/Europe    http://www.linbit.com :
