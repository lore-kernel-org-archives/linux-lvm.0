content-class: urn:content-classes:message
MIME-Version: 1.0
Subject: RE: [linux-lvm] How to associate two paths for each EMC device?
Date: Fri, 19 Mar 2004 14:43:54 -0600
Message-ID: <2C6A063A33DEEE4FBC20FBBEA3DD9ED204E445@ausx2kmpc115.aus.amer.dell.com>
From: <Dan_Caulfield@Dell.com>
Content-Transfer-Encoding: 8bit
Reply-To: LVM general discussion and development <linux-lvm@redhat.com>
List-Id: LVM general discussion and development <linux-lvm.redhat.com>
List-Unsubscribe: <https://www.redhat.com/mailman/listinfo/linux-lvm>,
	<mailto:linux-lvm-request@redhat.com?subject=unsubscribe>
List-Archive: </archives/linux-lvm>
List-Post: <mailto:linux-lvm@redhat.com>
List-Help: <mailto:linux-lvm-request@redhat.com?subject=help>
List-Subscribe: <https://www.redhat.com/mailman/listinfo/linux-lvm>,
	<mailto:linux-lvm-request@redhat.com?subject=subscribe>
List-Id: <linux-lvm.redhat.com>
Content-Type: text/plain; charset="us-ascii"
To: linux-lvm@redhat.com
Cc: linux-lvm-bounces@redhat.com

This is normal behavior for multipath devices.  The OS will "see" the 22
luns on all available paths.  The is the way EMC PowerPath, Veritas DMP
and LVM work.  Each of these products rely on the OS detecting all
available paths to the luns.  EMC PowerPath uses the device the
Symmetrix pdev id of each lun to identify multiple paths to a device.
LVM will use the PV UUIDs to identify the multipath devices.  

For EMC arrays, there is a version of inq that will run on Linux.  You
will just need to make enough sg devices for it to recognize all 44
devices.  The inq utility will help you to determine which pdev is
associated to which sd device. See EMC Powerlink Doc emc59180 for all of
the details.


Regards,
Dan

-----Original Message-----
From: linux-lvm-bounces@redhat.com [mailto:linux-lvm-bounces@redhat.com]
On Behalf Of Shan Jing
Sent: Friday, March 19, 2004 1:01 PM
To: LVM general discussion and development
Cc: LVM general discussion and development; linux-lvm-bounces@redhat.com
Subject: Re: [linux-lvm] How to associate two paths for each EMC device?


The very basic way to identify the pair is to lvm each of the first 22
luns in a sequence and see which lun in the other 22 set is also lvm'ed.

However, there must be a more technical way to resolve this and
eventually make the disk represent only once.  Any guru out there can
help?

Regards,
Shan Jing

Unix Group - Americas
Deutsche Bank
2 Gatehall Drive, 3rd Floor
Parsippany, New Jersey, USA
shan.jing@db.com
973.682.3463




 

                      Theo Van Dinter

                      <felicity@kluge.n        To:       LVM general
discussion and development <linux-lvm@redhat.com>                 
                      et>                      cc:

                      Sent by:                 Subject:  Re: [linux-lvm]
How to associate two paths for each EMC device?               
                      linux-lvm-bounces

                      @redhat.com

 

 

                      03/19/2004 12:44

                      PM

                      Please respond to

                      LVM general

                      discussion and

                      development

 

 





On Fri, Mar 19, 2004 at 12:21:51PM -0500, Shan Jing wrote:
> I have 22  EMC symmetrix disks on two HBA links.  At this moment,
there is no working copy of EMC powerpath or HP Securepath available for
my kernel (2.4.21-112-itanium2-smp); therefore, I have to use the luns
directly with lvm without any DMP software in the middle.
>
> Without DMP software, there are two set of 22 luns, each representing
one HBA path.  See blow.

Can you set your HBA driver to do failover?   ie: something like this
in modules.conf:

options qla2300 ql2xfailover=1 ql2xmaxqdepth=64


This works well for my servers connected to a CX-series array. :)   The
driver handles failing between HBAs (active-passive), and only has the
LUN presented once to the system.

--
Randomly Generated Tagline:
"I didn't know Allman was a stand-up comedian ..."
         - Theo about laughter from sendmail tutorial

_______________________________________________
linux-lvm mailing list
linux-lvm@redhat.com
https://www.redhat.com/mailman/listinfo/linux-lvm
read the LVM HOW-TO at http://tldp.org/HOWTO/LVM-HOWTO/

The following file(s) have been deleted by: Shan Jing on 3/19/2004
1:58:20 PM

C.DTF
attq5vht.dat





--

This e-mail may contain confidential and/or privileged information. If
you are not the intended recipient (or have received this e-mail in
error) please notify the sender immediately and destroy this e-mail. Any
unauthorized copying, disclosure or distribution of the material in this
e-mail is strictly forbidden.


_______________________________________________
linux-lvm mailing list
linux-lvm@redhat.com
https://www.redhat.com/mailman/listinfo/linux-lvm
read the LVM HOW-TO at http://tldp.org/HOWTO/LVM-HOWTO/
