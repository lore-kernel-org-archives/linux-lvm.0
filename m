Received: from o.ww.redhat.com (vpnuser2.stuttgart.redhat.com [172.16.4.2])
	by pobox.stuttgart.redhat.com (8.12.8/8.12.8) with ESMTP id
	i5K8oaqd020862
	for <linux-lvm@redhat.com>; Sun, 20 Jun 2004 10:50:37 +0200
Date: Sun, 20 Jun 2004 10:50:37 +0200
From: Heinz Mauelshagen <mauelshagen@redhat.com>
Subject: Re: [linux-lvm] How to extend a root LVM volume?
Message-ID: <20040620085037.GD3519@redhat.com>
References: <40D1CF06.7030202@miksis.com>
Mime-Version: 1.0
Content-Disposition: inline
In-Reply-To: <40D1CF06.7030202@miksis.com>
Reply-To: mauelshagen@redhat.com,
	LVM general discussion and development <linux-lvm@redhat.com>
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
Content-Transfer-Encoding: 7bit
To: LVM general discussion and development <linux-lvm@redhat.com>


I am guessing that rescue CD has a restrictive filter setup
which prevents vgscan from seeing the drives.


On Thu, Jun 17, 2004 at 10:04:06AM -0700, Mark Miksis wrote:
> I'm trying to extend a root LVM.  I'm using LVM2 on FC2.  Here is what 
> I've tried:
> 
> I ran lvextend when the system was booted normally and the volumes were 
> mounted.  This worked as expected and lvdisplay properly shows the new 
> larger size.
> 
> Then I booted into the FC2 rescue CD and instructed it to NOT search for 
> and mount Fedora installations.  I then ran:
> # resize2fs /dev/Volume00/LogVol00
> I don't have the specific error, but it basically says that the 
> specified volume doesn't exist.  Indeed if I look in /dev, my volume 
> group and volumes are nowhere to be found.
> 
> At that point I tried:
> # lvm
> lvm> vgscan
> After only about 1 second, it responds that no volumes are found.
> 
> I also tried rebooting from the CD and letting it mount my 
> installations.  In this case, the volume and volume groups are properly 
> discovered and mounted.  However, if I try to unmount the volume, it 
> always responds with "device busy".
> 
> Is this a problem with how the FC2 rescue disk scans for volumes?  Any 
> help would be appreciated.
> _______________________________________________
> linux-lvm mailing list
> linux-lvm@redhat.com
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
