Received: from mx1.redhat.com (mx1.redhat.com [172.16.48.31])
	by int-mx1.corp.redhat.com (8.13.1/8.13.1) with ESMTP id n55EYvxE025821
	for <linux-lvm@redhat.com>; Fri, 5 Jun 2009 10:34:57 -0400
Received: from mail.bmsi.com (www.bmsi.com [24.248.44.156])
	by mx1.redhat.com (8.13.8/8.13.8) with ESMTP id n55EYikD014154
	for <linux-lvm@redhat.com>; Fri, 5 Jun 2009 10:34:44 -0400
Received: from bmsred.bmsi.com (bmsred.bmsi.com [192.168.9.50])
	by mail.bmsi.com (8.14.3/8.14.3) with ESMTP id n55EYi04027102
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-SHA bits=256 verify=NO)
	for <linux-lvm@redhat.com>; Fri, 5 Jun 2009 10:34:44 -0400
Received: from localhost (localhost.localdomain [127.0.0.1])
	by bmsred.bmsi.com (8.14.3/8.14.3) with ESMTP id n55EYhsx027933
	for <linux-lvm@redhat.com>; Fri, 5 Jun 2009 10:34:43 -0400
Date: Fri, 5 Jun 2009 10:34:43 -0400 (EDT)
From: "Stuart D. Gathman" <stuart@bmsi.com>
Subject: Re: [linux-lvm] Exposing the same VG from two different disks
In-Reply-To: <24264124.2266451244207938283.JavaMail.servlet@kundenserver>
Message-ID: <Pine.LNX.4.64.0906051032110.27715@bmsred.bmsi.com>
References: <24264124.2266451244207938283.JavaMail.servlet@kundenserver>
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

On Fri, 5 Jun 2009, liam@landv.org.uk wrote:

> I have a volume group which consists of a LUN (/dev/emcpowerv1) in an EMC
> cabinet. To backup up the disk I use EMC technology to synchronise a second
> LUN (/dev/emcpoweraf1) with the first, when the synchronisation is complete I
> then break the connection. At this point I have two identical volume groups
> exposed to the same host. What I would like to do is rename the second volume
> group and mount its logical volumes. However I can't because (understandably)
> LVM doesn't like having two identical volume groups so when I issue pvchange
> -u I get...

This is doable but tricky.  Please read back a few weeks in the archives
to find a script that is being polished to automate this.  I forget
the name of the person who did the script, but when you find the posts,
give him a big thank you.  Test the script carefully in your situation
and report here.

-- 
	      Stuart D. Gathman <stuart@bmsi.com>
    Business Management Systems Inc.  Phone: 703 591-0911 Fax: 703 591-6154
"Confutatis maledictis, flammis acribus addictis" - background song for
a Microsoft sponsored "Where do you want to go from here?" commercial.
