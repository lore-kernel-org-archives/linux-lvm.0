Received: from mx2.redhat.com (mx2.redhat.com [10.255.15.25])
	by int-mx2.corp.redhat.com (8.13.1/8.13.1) with ESMTP id l2A0OXaD031376
	for <linux-lvm@redhat.com>; Fri, 9 Mar 2007 19:24:33 -0500
Received: from sj-iport-4.cisco.com (sj-iport-4.cisco.com [171.68.10.86])
	by mx2.redhat.com (8.13.1/8.13.1) with ESMTP id l2A0OWDf030081
	for <linux-lvm@redhat.com>; Fri, 9 Mar 2007 19:24:32 -0500
Received: from sj-core-1.cisco.com (sj-core-1.cisco.com [171.71.177.237])
	by sj-dkim-4.cisco.com (8.12.11/8.12.11) with ESMTP id l2A0ONUE026771
	for <linux-lvm@redhat.com>; Fri, 9 Mar 2007 16:24:23 -0800
Received: from xbh-sjc-211.amer.cisco.com (xbh-sjc-211.cisco.com
	[171.70.151.144])
	by sj-core-1.cisco.com (8.12.10/8.12.6) with ESMTP id l2A0O6eB002925
	for <linux-lvm@redhat.com>; Sat, 10 Mar 2007 00:24:23 GMT
Content-class: urn:content-classes:message
MIME-Version: 1.0
Subject: RE: [linux-lvm] LVM and Windows
Date: Fri, 9 Mar 2007 16:24:10 -0800
Message-ID: <08A9A3213527A6428774900A80DBD8D8039FFF76@xmb-sjc-222.amer.cisco.com>
In-Reply-To: <45F1F47C.3060602@mdmiller.com>
From: "Lin Shen \(lshen\)" <lshen@cisco.com>
Content-Transfer-Encoding: 8bit
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
To: LVM general discussion and development <linux-lvm@redhat.com>

I'm not talking about Samba. If I create a FAT file system on top of
logic volume on a piece of Compact Flash in a Linux box, can I pull out
the Compact Flash and insert it into a Windows box and use it? I know
this should work if the FAT file system is created on a hard partition
instead of a logic volume?

Lin 

> -----Original Message-----
> From: linux-lvm-bounces@redhat.com 
> [mailto:linux-lvm-bounces@redhat.com] On Behalf Of Mitch Miller
> Sent: Friday, March 09, 2007 3:58 PM
> To: LVM general discussion and development
> Subject: Re: [linux-lvm] LVM and Windows
> 
> Are you talking about accessing it via Samba?  Samba can 
> share filesystems of any format (that I know of), and Windows 
> can connect to Samba shares.
> 
> Does that answer your question?
> 
> -- Mitch
> 
> 
> Lin Shen (lshen) wrote:
> 
> >If I format a FAT file system on top of a logic volume 
> created by using 
> >LVM, will this be accessible from Windows? In other words, 
> does Windows 
> >understand LVM?
> >
> >Lin
> >
> >_______________________________________________
> >linux-lvm mailing list
> >linux-lvm@redhat.com
> >https://www.redhat.com/mailman/listinfo/linux-lvm
> >read the LVM HOW-TO at http://tldp.org/HOWTO/LVM-HOWTO/
> >
> >  
> >
> 
> _______________________________________________
> linux-lvm mailing list
> linux-lvm@redhat.com
> https://www.redhat.com/mailman/listinfo/linux-lvm
> read the LVM HOW-TO at http://tldp.org/HOWTO/LVM-HOWTO/
> 
