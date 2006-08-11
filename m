Received: from mx3.redhat.com (mx3.redhat.com [172.16.48.32])
	by int-mx1.corp.redhat.com (8.12.11.20060308/8.12.11) with ESMTP id
	k7BAWUq8030127
	for <linux-lvm@redhat.com>; Fri, 11 Aug 2006 06:32:30 -0400
Received: from smtp-rok.spirentcom.com (smtp-rok.spirentcom.com
	[208.22.58.135])
	by mx3.redhat.com (8.13.1/8.13.1) with ESMTP id k7BAWL0m018718
	for <linux-lvm@redhat.com>; Fri, 11 Aug 2006 06:32:21 -0400
Content-class: urn:content-classes:message
MIME-Version: 1.0
Subject: RE: [linux-lvm] converting PV from md to non-md
Date: Fri, 11 Aug 2006 06:32:16 -0400
Message-ID: <700E4C1906A0F34DB4C6ABC47B3E8FA5125EC4@spcrokexcbe01.AD.SPIRENTCOM.COM>
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

I see no /etc/lvm/lvm.conf on my system.  This is a RedHat 9.0 system
running LVM1.  

-----Original Message-----
From: linux-lvm-bounces@redhat.com [mailto:linux-lvm-bounces@redhat.com]
On Behalf Of Luca Berra
Sent: Friday, August 11, 2006 2:24 AM
To: linux-lvm@redhat.com
Subject: Re: [linux-lvm] converting PV from md to non-md

On Thu, Aug 10, 2006 at 02:50:09PM -0400, Musard, Kris wrote:
>Sorry,  I forgot to mention that I tried the zero-superblock option on
>the mdadm command and I still got the error that the /dev/hda3 was
apart
>of a multiple device.  
>
this is strange...

if you are sure you will never use md anymore you can disable
md_component_detection in /etc/lvm/lvm.conf

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
