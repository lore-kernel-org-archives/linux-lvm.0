Received: from mx1.redhat.com (mx1.redhat.com [172.16.48.31])
	by int-mx1.corp.redhat.com (8.12.11.20060308/8.12.11) with ESMTP id
	k7I0X0ZE029343
	for <linux-lvm@redhat.com>; Thu, 17 Aug 2006 20:33:00 -0400
Received: from mail.eecs.harvard.edu (bowser.eecs.harvard.edu [140.247.60.24])
	by mx1.redhat.com (8.12.11.20060308/8.12.11) with ESMTP id
	k7I0Wwrd003071
	for <linux-lvm@redhat.com>; Thu, 17 Aug 2006 20:32:58 -0400
Received: from labrador.eecs.harvard.edu (labrador.eecs.harvard.edu
	[140.247.60.247])
	by mail.eecs.harvard.edu (Postfix) with ESMTP id 78D141A3CAD
	for <linux-lvm@redhat.com>; Thu, 17 Aug 2006 20:32:54 -0400 (EDT)
Subject: Re: [linux-lvm] how to learn number of stripes on logical volume? 
In-reply-to: <1155847586.12486.131.camel@joesgrill.cc.vt.edu> 
References: <20060817201917.1EF8E1EB6B8@labrador.eecs.harvard.edu>
	<1155847586.12486.131.camel@joesgrill.cc.vt.edu>
Date: Thu, 17 Aug 2006 20:32:54 -0400
From: Norman Ramsey <nr@eecs.harvard.edu>
Message-Id: <20060818003254.61FEB1EB6B8@labrador.eecs.harvard.edu>
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
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: LVM discussion list <linux-lvm@redhat.com>

 > On Thu, 2006-08-17 at 16:19 -0400, Norman Ramsey wrote:
 > > I'm using LVM2 under Debian.  I have a logical volume 
 > > created by the Debian installer, and I'd like to know if it
 > > is striped.  How can I find out?
 > > 
 > > I tried 'lvdisplay -v' and 'vgdisplay -v', but neither
 > > shows the number of stripes on a logical volume (I tried
 > > with a newly created LV with two stripes, but the information
 > > is not shown).
 > 
 > Have you tried 'lvs -v' ?
 > It has something called "segments" but since I don't have a striped
 > volumes to test it with I can't be sure that's what you want.

I'm afraid 'segments' is not it. 
No information about stripes is there.


Norman
