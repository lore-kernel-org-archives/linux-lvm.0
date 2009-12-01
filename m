Received: from mx1.redhat.com (ext-mx08.extmail.prod.ext.phx2.redhat.com
	[10.5.110.12])
	by int-mx03.intmail.prod.int.phx2.redhat.com (8.13.8/8.13.8) with ESMTP
	id nB1IYEGJ006736
	for <linux-lvm@redhat.com>; Tue, 1 Dec 2009 13:34:14 -0500
Received: from mail.bmsi.com (www.bmsi.com [24.248.44.156])
	by mx1.redhat.com (8.13.8/8.13.8) with ESMTP id nB1IXw08015346
	for <linux-lvm@redhat.com>; Tue, 1 Dec 2009 13:33:59 -0500
Received: from bmsred.bmsi.com (bmsred.bmsi.com [192.168.9.50])
	by mail.bmsi.com (8.14.3/8.14.3) with ESMTP id nB1IXvSw013554
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-SHA bits=256 verify=NO)
	for <linux-lvm@redhat.com>; Tue, 1 Dec 2009 13:33:57 -0500
Received: from localhost (localhost.localdomain [127.0.0.1])
	by bmsred.bmsi.com (8.14.3/8.14.3) with ESMTP id nB1IXvkI029564
	for <linux-lvm@redhat.com>; Tue, 1 Dec 2009 13:33:57 -0500
Date: Tue, 1 Dec 2009 13:33:57 -0500 (EST)
From: "Stuart D. Gathman" <stuart@bmsi.com>
Subject: Re: [linux-lvm] show free space _inside_ logical volume
In-Reply-To: <20091201182835.GC14760@IUPUI.Edu>
Message-ID: <Pine.LNX.4.64.0912011330030.29511@bmsred.bmsi.com>
References: <4cd59bf50911301645l51c44579k978225d3fe9e71b0@mail.gmail.com>
	<20091201182835.GC14760@IUPUI.Edu>
MIME-Version: 1.0
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
Content-Type: TEXT/PLAIN; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: LVM general discussion and development <linux-lvm@redhat.com>

On Tue, 1 Dec 2009, Mark H. Wood wrote:

> Depending on what's most important to you, to have either set of tools
> work with the other's data would either be a layering violation, cause
> unnecessary and fragile coupling of unrelated tools, or make them
> needlessly complex.  Both toolsets need to remain small, light,
> rugged, and simple, because they're used for standing up and repairing
> systems that may not be ready for daily use.

The other option is the ZFS approach of integrating LVM and filesystem.
The drawback is that you can only ever use the one supported filesystem.
(Though there is probably a way to mount unsupported filesystems - but 
then you are back to having to use both tools and subtract.)

Linux LVM doesn't know or care what filesystem you use, which is super
for experimenting with filesystems - expecially in conjunction with
a virtual machine.

-- 
	      Stuart D. Gathman <stuart@bmsi.com>
    Business Management Systems Inc.  Phone: 703 591-0911 Fax: 703 591-6154
"Confutatis maledictis, flammis acribus addictis" - background song for
a Microsoft sponsored "Where do you want to go from here?" commercial.
