Received: from o.ww.redhat.com (vpnuser2.stuttgart.redhat.com [172.16.4.2])
	by pobox.stuttgart.redhat.com (8.12.8/8.12.8) with ESMTP id
	i5K8mGqd020784
	for <linux-lvm@redhat.com>; Sun, 20 Jun 2004 10:48:16 +0200
Date: Sun, 20 Jun 2004 10:48:17 +0200
From: Heinz Mauelshagen <mauelshagen@redhat.com>
Subject: Re: [linux-lvm] volume group to another machine when system crashed
Message-ID: <20040620084817.GB3519@redhat.com>
References: <40D2C9BA.6080301@iosmd.com>
Mime-Version: 1.0
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <40D2C9BA.6080301@iosmd.com>
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
Content-Type: text/plain; charset="utf-8"
To: LVM general discussion and development <linux-lvm@redhat.com>

On Fri, Jun 18, 2004 at 12:53:46PM +0200, St�phane Danel wrote:
> Hi,
> bonjour,
> 
> I made a volume group with a SCSI tower of IBM  disk of 36 Go.
> 
> One disk is out and we are trying to restore the data.
> 
> AND the system disk crashed too.
> 
> Thus i can't do these commands to export my volume group:
> 
> http://tldp.org/HOWTO/LVM-HOWTO/recipemovevgtonewsys.html
> 
> # vgchange -an volumeGroup
> # vgexport volumeGroup
> 
> If I get the Datas.
> Is it possible without these commands to 
> create (or restore) my volume group to another system ?

If no disk was missing, you could actually just attach the drives
to the other system and vgscan.
With the missing disk, you need LVM2 (eg, in Fedora > 1) to access
the non-quorum VG.

> 
> thank you.
> 
> I am sorry for my english.... :-[ 
> 
> 
> 
> 
> 
> 
> 
> -- 
> 
> St�phane DANEL
> 
> 

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
