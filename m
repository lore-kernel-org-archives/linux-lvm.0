Date: Tue, 1 Mar 2005 20:19:23 +0100
From: Heinz Mauelshagen <mauelshagen@redhat.com>
Subject: Re: [linux-lvm] Raid1 only with LVM
Message-ID: <20050301191923.GA13742@redhat.com>
References: <200502281138.00112.stuebiger-lvm@cip.ifi.lmu.de>
Mime-Version: 1.0
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <200502281138.00112.stuebiger-lvm@cip.ifi.lmu.de>
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
Content-Type: text/plain; charset="utf-8"
To: LVM general discussion and development <linux-lvm@redhat.com>
Cc: hjm@redhat.com


Michael,

you can't do mirroring with LVM2 today but we'll suport it later this year.

On Mon, Feb 28, 2005 at 11:38:00AM +0100, Michael St�biger wrote:
> Hello.
> 
> I'm rather new to LVM2 and DM.
> After having read what I could find about it I got the impression that
> one should be able to get LVM to Mirror a Volume Group to 2 Physical Volumes with
> the mirror target just like it can do striping.
> 
> Alas I was unable to find any documentation on how to accomplish this.
> 
> Can anybody please help me with this?
> 
> Regards
> Michael St�biger
> 
> -- 
> | Dipl. Inf. Michael St�biger                   Michael.Stuebiger at rz.ifi.lmu.de |
> | Ludwig-Maximilians-Universitaet Muenchen                                         	|
> | Institut fuer Informatik                Zimmer Z 9      Tel: 2180-9137           	|
> 
> _______________________________________________
> linux-lvm mailing list
> linux-lvm@redhat.com
> https://www.redhat.com/mailman/listinfo/linux-lvm
> read the LVM HOW-TO at http://tldp.org/HOWTO/LVM-HOWTO/

Regards,
Heinz    -- The LVM Guy --

=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-

Heinz Mauelshagen                                 Red Hat GmbH
Consulting Development Engineer                   Am Sonnenhang 11
                                                  56242 Marienrachdorf
                                                  Germany
Mauelshagen@RedHat.com                            +49 2626 141200
                                                       FAX 924446
=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-
