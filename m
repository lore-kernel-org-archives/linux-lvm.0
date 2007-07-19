Received: from mx2.redhat.com (mx2.redhat.com [10.255.15.25])
	by int-mx2.corp.redhat.com (8.13.1/8.13.1) with ESMTP id l6JDAZIs002942
	for <linux-lvm@redhat.com>; Thu, 19 Jul 2007 09:10:36 -0400
Received: from webmail.icp-qv1-irony3.iinet.net.au
	(webmail.icp-qv1-irony3.iinet.net.au [203.59.1.108])
	by mx2.redhat.com (8.13.1/8.13.1) with ESMTP id l6JDAXWw019396
	for <linux-lvm@redhat.com>; Thu, 19 Jul 2007 09:10:34 -0400
Message-ID: <469F62C2.4080709@iinet.net.au>
Date: Thu, 19 Jul 2007 23:10:26 +1000
From: David Timms <dtimms@iinet.net.au>
MIME-Version: 1.0
Subject: Re: [linux-lvm] lvm fails trying to expand an LV into available space
	in VG.
References: <469684EE.3030405@iinet.net.au> <46968AA5.40703@redhat.com>
In-Reply-To: <46968AA5.40703@redhat.com>
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

James Parsons wrote:
> Hi - I'm the s-c-lvm guy; this will take a bit to digest. Just wanted to 
> let you know you were heard.
> Yes, 3 minutes to scan for state seems a bit abnormal :)  
Actually, its more like 5-6 minutes (I get bored waiting and start doing 
other stuff). During boot up it takes about 8 seconds to activate the 
lvm volumes.

> Could you 
> strace it, please and attach output to bz247112? 
In case someone has the lvm skills and is willing to take a look to see 
if the system-config-lvm is generating a reasonable command, etc, note 
that I have provided the requested strace to 
https://bugzilla.redhat.com/bugzilla/show_bug.cgi?id=247112

Thanks, David Timms.
