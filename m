Received: from mx1.redhat.com (ext-mx11.extmail.prod.ext.phx2.redhat.com
	[10.5.110.16])
	by int-mx01.intmail.prod.int.phx2.redhat.com (8.13.8/8.13.8) with ESMTP
	id p9J2OrBJ015400
	for <linux-lvm@redhat.com>; Tue, 18 Oct 2011 22:24:53 -0400
Received: from p02c11o149.mxlogic.net (p02c11o149.mxlogic.net [208.65.144.82])
	by mx1.redhat.com (8.14.4/8.14.4) with ESMTP id p9J2OqYM026598
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-SHA bits=256 verify=NO)
	for <linux-lvm@redhat.com>; Tue, 18 Oct 2011 22:24:52 -0400
From: Robert Gormley <rgormley@mgcare.com>
Date: Tue, 18 Oct 2011 19:24:52 -0700
Message-ID: <3389678474F1634EA260EC27A3C10968025C381E00A3@EXCHMBXSVR.corp.ad>
References: <3389678474F1634EA260EC27A3C10968025C381E00A1@EXCHMBXSVR.corp.ad>
	<20111018202745.40776deb@bettercgi.com>
In-Reply-To: <20111018202745.40776deb@bettercgi.com>
Content-Language: en-US
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: Re: [linux-lvm] Attempting to salvage data from a PV on a damaged
 disk
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
To: LVM general discussion and development <linux-lvm@redhat.com>

It hasn't, and that's my plan for now, to correct the metadata (UUID may be different), and then do that restore.


-----Original Message-----
From: linux-lvm-bounces@redhat.com [mailto:linux-lvm-bounces@redhat.com] On Behalf Of Ray Morris
Sent: Tuesday, October 18, 2011 6:28 PM
To: linux-lvm@redhat.com
Subject: Re: [linux-lvm] Attempting to salvage data from a PV on a damaged disk


> Question: if I do a 'vgcreate tempvolgroup /dev/sdc2', is it going to 
> be destructive to the LVs inside the PV?

Don't do that. Had the LVM structure changed since the "mirror" disk last synced? If not, it should have the LVM metatadata, which can be restored, preferably to an image of the recent disk. Ideally, the only thing that would be done with the failed disk is to make an image of it on another drive. Then work with the image. dd_rescue may be useful for making the image.
