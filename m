Received: from mx1.redhat.com (ext-mx12.extmail.prod.ext.phx2.redhat.com
	[10.5.110.17])
	by int-mx01.intmail.prod.int.phx2.redhat.com (8.13.8/8.13.8) with ESMTP
	id pAUI9xmI028812
	for <linux-lvm@redhat.com>; Wed, 30 Nov 2011 13:09:59 -0500
Received: from mail.bmsi.com (www.bmsi.com [24.248.44.156])
	by mx1.redhat.com (8.14.4/8.14.4) with ESMTP id pAUI9wwB023105
	for <linux-lvm@redhat.com>; Wed, 30 Nov 2011 13:09:58 -0500
Received: from bmsred.bmsi.com (bmsred.bmsi.com [192.168.9.50])
	by mail.bmsi.com (8.14.3/8.14.3) with ESMTP id pAUI9Opv000933
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-SHA bits=256 verify=NO)
	for <linux-lvm@redhat.com>; Wed, 30 Nov 2011 13:09:24 -0500
Received: from bmsred (bmsred [192.168.9.50])
	by bmsred.bmsi.com (8.14.3/8.14.3) with ESMTP id pAUI9Olj015881
	for <linux-lvm@redhat.com>; Wed, 30 Nov 2011 13:09:24 -0500
Date: Wed, 30 Nov 2011 13:09:24 -0500 (EST)
From: "Stuart D. Gathman" <stuart@bmsi.com>
In-Reply-To: <20111129104607.GA8239@hulk.dreamhost.com>
Message-ID: <alpine.LRH.2.00.1111301306190.31249@bmsred.bmsi.com>
References: <20111129104607.GA8239@hulk.dreamhost.com>
MIME-Version: 1.0
Subject: Re: [linux-lvm] Recovering a volume after lost disk
Reply-To: LVM general discussion and development <linux-lvm@redhat.com>
List-Id: LVM general discussion and development <linux-lvm.redhat.com>
List-Unsubscribe: <https://www.redhat.com/mailman/options/linux-lvm>,
	<mailto:linux-lvm-request@redhat.com?subject=unsubscribe>
List-Archive: <https://www.redhat.com/archives/linux-lvm>
List-Post: <mailto:linux-lvm@redhat.com>
List-Help: <mailto:linux-lvm-request@redhat.com?subject=help>
List-Subscribe: <https://www.redhat.com/mailman/listinfo/linux-lvm>,
	<mailto:linux-lvm-request@redhat.com?subject=subscribe>
List-Id: <linux-lvm.redhat.com>
Content-Type: TEXT/PLAIN; charset="us-ascii"; format="flowed"
Content-Transfer-Encoding: 7bit
To: LVM general discussion and development <linux-lvm@redhat.com>

On Tue, 29 Nov 2011, shtegtari wrote:

> I think I have run these commands before but all that hapens is:
>
> #vgreduce --removemissing video # ; vgchange -ay
>  Volume group "video" is already consistent
> # lvs|grep video
> # <nothng returend>
>
> So, the problem is that I can see the voumee grop with vgs but not volume with lvs.
>
> Anything else to try?

If you removed the dead disk, and the LV is now gone, then that LV was
entirely stored on the dead disk.

You could try to copy any remaining good sectors from the dead disk
to a new disk.  Try using a USB enclosure and putting the dead drive in
USB enclosure in a freezer, then do the copy using dd_rescue (don't
try to activate any volume groups or mount any filesystems).

--
 	      Stuart D. Gathman <stuart@bmsi.com>
     Business Management Systems Inc.  Phone: 703 591-0911 Fax: 703 591-6154
"Confutatis maledictis, flammis acribus addictis" - background song for
a Microsoft sponsored "Where do you want to go from here?" commercial.
