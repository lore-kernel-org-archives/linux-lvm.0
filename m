Received: from mx1.redhat.com (ext-mx13.extmail.prod.ext.phx2.redhat.com
	[10.5.110.18])
	by int-mx09.intmail.prod.int.phx2.redhat.com (8.14.4/8.14.4) with ESMTP
	id qA629uKR009372
	for <linux-lvm@redhat.com>; Mon, 5 Nov 2012 21:09:56 -0500
Received: from mail.bmsi.com (www.bmsi.com [24.248.44.156])
	by mx1.redhat.com (8.14.4/8.14.4) with ESMTP id qA629p3C021693
	for <linux-lvm@redhat.com>; Mon, 5 Nov 2012 21:09:54 -0500
Received: from melissa.gathman.org (ip72-205-26-231.dc.dc.cox.net
	[72.205.26.231]) (authenticated bits=0)
	by mail.bmsi.com (8.14.3/8.14.3) with ESMTP id qA629od0008351
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-SHA bits=256 verify=NO)
	for <linux-lvm@redhat.com>; Mon, 5 Nov 2012 21:09:50 -0500
Message-ID: <5098716E.4080605@bmsi.com>
Date: Mon, 05 Nov 2012 21:09:50 -0500
From: Stuart D Gathman <stuart@bmsi.com>
MIME-Version: 1.0
References: <alpine.BSF.2.00.1211051646040.1851@tdream.lly.earlham.edu>
In-Reply-To: <alpine.BSF.2.00.1211051646040.1851@tdream.lly.earlham.edu>
Content-Transfer-Encoding: 7bit
Subject: Re: [linux-lvm] how to swap a bad drive on a non-standard mirror
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
Content-Type: text/plain; charset="us-ascii"
To: linux-lvm@redhat.com

Long ago, Nostradamus foresaw that on 11/05/2012 04:59 PM, Randy Schultz
would write:
> Hey all,
>
> I have a system that somebody set up, reportedly during the RHEL
> install, to have the 2 on-board drives
> mirrored.  We lost the second drive.  I know how to do deal with this
> on a standard setup with 2 PV's, but it
> looks like there is only 1 PV and I cannot find any documentation on
> how to deal with this.
>
In case you decide to stick with the Intel raid, this is someone who
figured out how to rebuild it:


http://techie.org/Blog/2010/09/03/how-to-rebuild-intel-raid-isw-on-linux/
