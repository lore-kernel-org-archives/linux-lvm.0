Received: from mx1.redhat.com (ext-mx13.extmail.prod.ext.phx2.redhat.com
	[10.5.110.18])
	by int-mx09.intmail.prod.int.phx2.redhat.com (8.14.4/8.14.4) with ESMTP
	id p46F6UV2009270
	for <linux-lvm@redhat.com>; Fri, 6 May 2011 11:06:30 -0400
Received: from mail120.messagelabs.com (mail120.messagelabs.com
	[216.82.250.83])
	by mx1.redhat.com (8.14.4/8.14.4) with ESMTP id p46F6TYF014385
	for <linux-lvm@redhat.com>; Fri, 6 May 2011 11:06:29 -0400
Received: from enaf.sfdc.sbc.com (localhost.localdomain [127.0.0.1])
	by mlpd194.enaf.sfdc.sbc.com (8.14.4/8.14.4) with ESMTP id
	p46F5Pi8024686
	for <linux-lvm@redhat.com>; Fri, 6 May 2011 11:05:25 -0400
Received: from klpd017.kcdc.att.com (klpd017.kcdc.att.com [135.188.40.86])
	by mlpd194.enaf.sfdc.sbc.com (8.14.4/8.14.4) with ESMTP id
	p46F5JUP024587
	for <linux-lvm@redhat.com>; Fri, 6 May 2011 11:05:20 -0400
Received: from kcdc.att.com (localhost.localdomain [127.0.0.1])
	by klpd017.kcdc.att.com (8.14.4/8.14.4) with ESMTP id p46F6M4U016762
	for <linux-lvm@redhat.com>; Fri, 6 May 2011 10:06:22 -0500
Received: from misout7msgusr7e.ugd.att.com (misout7msgusr7e.ugd.att.com
	[144.155.43.107])
	by klpd017.kcdc.att.com (8.14.4/8.14.4) with ESMTP id p46F6G7Z016683
	for <linux-lvm@redhat.com>; Fri, 6 May 2011 10:06:19 -0500
Content-class: urn:content-classes:message
MIME-Version: 1.0
Date: Fri, 6 May 2011 11:05:09 -0400
Message-ID: <E0F8912A36C3C540B08D785634E611750BB6EC53@misout7msgusr7e.ugd.att.com>
In-Reply-To: <4DC40BFD.3080408@cfl.rr.com>
References: <4DC40BFD.3080408@cfl.rr.com>
From: "CHANDRASEKARAN, GIRIDHAR (GIRI) (ATTSI)" <gs3162@att.com>
Content-Transfer-Encoding: 8bit
Subject: Re: [linux-lvm] getting pe_start right
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
To: LVM general discussion and development <linux-lvm@redhat.com>

Try "--metadatasize 288k

-----Original Message-----
From: linux-lvm-bounces@redhat.com [mailto:linux-lvm-bounces@redhat.com]
On Behalf Of Phillip Susi
Sent: Friday, May 06, 2011 10:56 AM
To: linux-lvm@redhat.com
Subject: [linux-lvm] getting pe_start right

While trying to convert my mdadm raid5 array from metadata format 0.9 to

1.0, I forgot to specify the version and it defaulted to 1.2, which 
damaged the lvm metadata.  After correcting mdadm to 1.0, I decided to 
try to recreate the LVM after managing to locate the volume descriptions

in the metadata after manually dumping it.

The problem I now have is that pvcreate will not use the same pe_start 
as before.  It was 384 and it is now 3072.  I tried using --metadatasize

192k --dataalignmentsize 0 and it did not help.  What gives?

_______________________________________________
linux-lvm mailing list
linux-lvm@redhat.com
https://www.redhat.com/mailman/listinfo/linux-lvm
read the LVM HOW-TO at http://tldp.org/HOWTO/LVM-HOWTO/
