Received: from mx3.redhat.com (mx3.redhat.com [172.16.48.32])
	by int-mx1.corp.redhat.com (8.13.1/8.13.1) with ESMTP id n4BLaSKF018176
	for <linux-lvm@redhat.com>; Mon, 11 May 2009 17:36:28 -0400
Received: from mail.brunson.com (www.brunson.com [72.249.20.185])
	by mx3.redhat.com (8.13.8/8.13.8) with ESMTP id n4BLZnjP000816
	for <linux-lvm@redhat.com>; Mon, 11 May 2009 17:35:50 -0400
Received: from [172.20.11.71] (unknown [12.109.229.8])
	(using TLSv1 with cipher DHE-RSA-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mail.brunson.com (Postfix) with ESMTP id 7B5606C38C
	for <linux-lvm@redhat.com>; Mon, 11 May 2009 15:35:47 -0600 (MDT)
Message-ID: <4A089A33.7020102@brunson.com>
Date: Mon, 11 May 2009 15:35:47 -0600
From: Eric Brunson <brunson@brunson.com>
MIME-Version: 1.0
Subject: Re: [linux-lvm] Re: Script to import hardware snapshoted VGs
References: <461677.62017.qm@web87108.mail.ird.yahoo.com>	<20090508205312.GA7838@redhat.com>	<138875.59888.qm@web87112.mail.ird.yahoo.com>	<4A0889F0.7050100@brunson.com>
	<Pine.LNX.4.64.0905111710540.26072@bmsred.bmsi.com>
In-Reply-To: <Pine.LNX.4.64.0905111710540.26072@bmsred.bmsi.com>
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
Content-Type: text/plain; charset="us-ascii"; format="flowed"
To: LVM general discussion and development <linux-lvm@redhat.com>

On 05/11/2009 03:15 PM, Stuart D. Gathman wrote:
>
> He meant he hasn't configured a CVS repository yet.  That is
> relatively easy too, but if you just want diffs on a single file,
> RCS is very handy:
>
> $ ci -l filename
> $ vim filename
> $ rcsdiff filename
> $ ls filename*
> filename filename,v
>
> There is no repository, the versions are stored in ,v files.
>
>    

RCS is very handy for that.  I recently discovered Mercurial, which will 
turn any directory into a repository, it's awesome.
