Received: from mx3.redhat.com (mx3.redhat.com [172.16.48.32])
	by int-mx1.corp.redhat.com (8.12.11.20060308/8.12.11) with ESMTP id
	k7AIoLSs019057
	for <linux-lvm@redhat.com>; Thu, 10 Aug 2006 14:50:21 -0400
Received: from smtp-rok.spirentcom.com (smtp-rok.spirentcom.com
	[208.22.58.135])
	by mx3.redhat.com (8.13.1/8.13.1) with ESMTP id k7AIoF6V027920
	for <linux-lvm@redhat.com>; Thu, 10 Aug 2006 14:50:15 -0400
Content-class: urn:content-classes:message
MIME-Version: 1.0
Subject: RE: [linux-lvm] converting PV from md to non-md
Date: Thu, 10 Aug 2006 14:50:09 -0400
Message-ID: <700E4C1906A0F34DB4C6ABC47B3E8FA5125E83@spcrokexcbe01.AD.SPIRENTCOM.COM>
From: "Musard, Kris" <Kris.Musard@spirentcom.com>
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

Sorry,  I forgot to mention that I tried the zero-superblock option on
the mdadm command and I still got the error that the /dev/hda3 was apart
of a multiple device.  

-----Original Message-----
From: linux-lvm-bounces@redhat.com [mailto:linux-lvm-bounces@redhat.com]
On Behalf Of Luca Berra
Sent: Thursday, August 10, 2006 2:47 PM
To: linux-lvm@redhat.com
Subject: Re: [linux-lvm] converting PV from md to non-md

On Thu, Aug 10, 2006 at 02:13:57PM -0400, Musard, Kris wrote:
>I am trying to "undo" the software raid setup on a system.  I have been
>able to simply change the partition type from "linux raid auto detect"
>to "linux" and mount the filesystems which were previously formatted on
>top of the md device directly to the underlying /dev/hda[0-9] device.
>The PV was originally added as /dev/md1 to the VG.  I tried setting the
>partition type from "linux raid autodetect" to "linux LVM" but vgscan
>and vgimport both give an error about the PV is part of a multiple
>device.  Does anyone have a procedure for going from LVM on top of
linux
>md software raid to LVM without md?  Any help would be much
appreciated.

mdadm --zero-superblock /dev/hdaX

L.


-- 
Luca Berra -- bluca@comedia.it
        Communication Media & Services S.r.l.
 /"\
 \ /     ASCII RIBBON CAMPAIGN
  X        AGAINST HTML MAIL
 / \

_______________________________________________
linux-lvm mailing list
linux-lvm@redhat.com
https://www.redhat.com/mailman/listinfo/linux-lvm
read the LVM HOW-TO at http://tldp.org/HOWTO/LVM-HOWTO/

<DIV><FONT size="1">

E-mail confidentiality.
--------------------------------
This e-mail contains confidential and / or privileged information belonging to Spirent Communications plc, its affiliates and / or subsidiaries. If you are not the intended recipient, you are hereby notified that any disclosure, copying, distribution and / or the taking of any action based upon reliance on the contents of this transmission is strictly forbidden. If you have received this message in error please notify the sender by return e-mail and delete it from your system. If you require assistance, please contact our IT department at helpdesk@spirentcom.com.

Spirent Communications plc,
Spirent House, Crawley Business Quarter, Fleming Way, Crawley, West Sussex, RH10 9QL, United Kingdom.
Tel No. +44 (0) 1293 767676
Fax No. +44 (0) 1293 767677

Registered in England Number 470893
Registered at Spirent House, Crawley Business Quarter, Fleming Way, Crawley, West Sussex, RH10 9QL, United Kingdom 

Or if within the US,

Spirent Communications,
26750 Agoura Road, Calabasas, CA, 91302, USA.
Tel No. 1-818-676- 2300 

</FONT></DIV>
