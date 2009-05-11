Received: from mx1.redhat.com (mx1.redhat.com [172.16.48.31])
	by int-mx1.corp.redhat.com (8.13.1/8.13.1) with ESMTP id n4BLFalJ002279
	for <linux-lvm@redhat.com>; Mon, 11 May 2009 17:15:36 -0400
Received: from mail.bmsi.com (www.bmsi.com [24.248.44.156])
	by mx1.redhat.com (8.13.8/8.13.8) with ESMTP id n4BLFMHd008820
	for <linux-lvm@redhat.com>; Mon, 11 May 2009 17:15:23 -0400
Received: from bmsred.bmsi.com (bmsred.bmsi.com [192.168.9.50])
	by mail.bmsi.com (8.14.3/8.14.3) with ESMTP id n4BLFMP8006215
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-SHA bits=256 verify=NO)
	for <linux-lvm@redhat.com>; Mon, 11 May 2009 17:15:22 -0400
Received: from localhost (localhost.localdomain [127.0.0.1])
	by bmsred.bmsi.com (8.14.3/8.14.3) with ESMTP id n4BLFMmW026106
	for <linux-lvm@redhat.com>; Mon, 11 May 2009 17:15:22 -0400
Date: Mon, 11 May 2009 17:15:22 -0400 (EDT)
From: "Stuart D. Gathman" <stuart@bmsi.com>
Subject: Re: [linux-lvm] Re: Script to import hardware snapshoted VGs
In-Reply-To: <4A0889F0.7050100@brunson.com>
Message-ID: <Pine.LNX.4.64.0905111710540.26072@bmsred.bmsi.com>
References: <461677.62017.qm@web87108.mail.ird.yahoo.com>
	<20090508205312.GA7838@redhat.com>
	<138875.59888.qm@web87112.mail.ird.yahoo.com>
	<4A0889F0.7050100@brunson.com>
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

On Mon, 11 May 2009, Eric Brunson wrote:

> > One day I will work out how to use CVS and do proper diffs :)
> >
> >    
> 
> cvs add filename
> cvs commit filename
> cvs diff filename

He meant he hasn't configured a CVS repository yet.  That is
relatively easy too, but if you just want diffs on a single file,
RCS is very handy:

$ ci -l filename
$ vim filename
$ rcsdiff filename
$ ls filename*
filename filename,v

There is no repository, the versions are stored in ,v files.

-- 
	      Stuart D. Gathman <stuart@bmsi.com>
    Business Management Systems Inc.  Phone: 703 591-0911 Fax: 703 591-6154
"Confutatis maledictis, flammis acribus addictis" - background song for
a Microsoft sponsored "Where do you want to go from here?" commercial.
