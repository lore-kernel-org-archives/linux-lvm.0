Received: from mx1.redhat.com (mx1.redhat.com [172.16.48.31])
	by int-mx1.corp.redhat.com (8.11.6/8.11.6) with ESMTP id k0PEqL103071
	for <linux-lvm@redhat.com>; Wed, 25 Jan 2006 09:52:21 -0500
Received: from oxhp.com (mx2.oxhp.com [199.97.64.17])
	by mx1.redhat.com (8.12.11/8.12.11) with ESMTP id k0PEqK3r007428
	for <linux-lvm@redhat.com>; Wed, 25 Jan 2006 09:52:21 -0500
Content-class: urn:content-classes:message
MIME-Version: 1.0
Subject: RE: [linux-lvm] file descriptor 3 left open
Date: Wed, 25 Jan 2006 09:51:49 -0500
Message-ID: <CF88E297901EB040B49935FE71B99A2D01F4A281@CTTRBEXVS01.oxhp.com>
From: "Kapadia, Nayan U." <nkapadia@oxhp.com>
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

That works! Thanks.
 

-----Original Message-----
From: linux-lvm-bounces@redhat.com [mailto:linux-lvm-bounces@redhat.com]
On Behalf Of Alasdair G Kergon
Sent: Wednesday, January 25, 2006 9:36 AM
To: LVM general discussion and development
Subject: Re: [linux-lvm] file descriptor 3 left open

On Wed, Jan 25, 2006 at 09:33:35AM -0500, Kapadia, Nayan U. wrote:
> How do I fix this bug in nash ? 
 
Upgrade your mkinitrd package and rebuild your initrd.

Alasdair
--
agk@redhat.com

_______________________________________________
linux-lvm mailing list
linux-lvm@redhat.com
https://www.redhat.com/mailman/listinfo/linux-lvm
read the LVM HOW-TO at http://tldp.org/HOWTO/LVM-HOWTO/
