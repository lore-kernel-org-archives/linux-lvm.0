Received: from o.ww.redhat.com (vpnuser1.stuttgart.redhat.com [172.16.4.1])
	by pobox.stuttgart.redhat.com (8.12.8/8.12.8) with ESMTP id
	iB9C0K3u006002
	for <linux-lvm@redhat.com>; Thu, 9 Dec 2004 13:00:21 +0100
Date: Thu, 9 Dec 2004 13:00:20 +0100
From: Heinz Mauelshagen <mauelshagen@redhat.com>
Subject: Re: [linux-lvm] Steps for adding DASD to existing LVM group using
	SLES9
Message-ID: <20041209120020.GB30928@redhat.com>
References: <0F0A80F76F5AC046B9D428F09598451BB03DBA@mypxmail05.bco-home.com>
Mime-Version: 1.0
Content-Disposition: inline
In-Reply-To: <0F0A80F76F5AC046B9D428F09598451BB03DBA@mypxmail05.bco-home.com>
Reply-To: mauelshagen@redhat.com,
	LVM general discussion and development <linux-lvm@redhat.com>
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
Content-Transfer-Encoding: 7bit
To: LVM general discussion and development <linux-lvm@redhat.com>

On Mon, Dec 06, 2004 at 03:48:07PM -0800, dclark@bco.com wrote:
> Running SLES9 for S/390 (31-bit) in an LPAR > (no VM) using a shared IFL
> 
> Is there a "Howto" document for adding dasd to an existing LVM system volume
> group?
> 
> 
> /dev/system/home     /home                reiserfs   acl,user_xattr        1
> 2
> /dev/system/opt      /opt                 reiserfs   acl,user_xattr        1
> 2
> /dev/system/var      /var                 reiserfs   acl,user_xattr        1
> 2
> 
> I would like to add 3 more mod3 devices to my system and extend the capacity
> of the /opt and /var filesystems.  

Presumably the dasds are accessible in your Linux LPAR, pvcreate
them, vgextend system, lvextend /dev/system/opt and /dev/system/var to
your needs and run resize_reiserfs on both of them.

Documented in the lvm2 manual pages and in the howto.

You can use yast for those steps as well.

> 
> TIA
> 
> Doug
> -----Original Message-----
> From: linux-lvm-request@redhat.com [mailto:linux-lvm-request@redhat.com] 
> Sent: Wednesday, September 01, 2004 7:11 PM
> To: linux-lvm@redhat.com
> Subject: linux-lvm Digest, Vol 7, Issue 1
> 
<SNIP>
> https://www.redhat.com/mailman/listinfo/linux-lvm
> read the LVM HOW-TO at http://tldp.org/HOWTO/LVM-HOWTO/

-- 

Regards,
Heinz    -- The LVM Guy --

*** Software bugs are stupid.
    Nevertheless it needs not so stupid people to solve them ***

=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-

Heinz Mauelshagen                                 Red Hat GmbH
Consulting Development Engineer                   Am Sonnenhang 11
                                                  56242 Marienrachdorf
                                                  Germany
Mauelshagen@RedHat.com                            +49 2626 141200
                                                       FAX 924446
=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-
