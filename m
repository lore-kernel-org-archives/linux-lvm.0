Date: Thu, 1 Apr 2004 10:21:33 -0800
From: Dave Olien <dmo@osdl.org>
Subject: Re: [linux-lvm] character device creation
Message-ID: <20040401182133.GA25669@osdl.org>
References: <BAY16-DAV26wjCGSzHV0000c6da@hotmail.com>
	<20040401085223.GC29222@redhat.com>
Mime-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20040401085223.GC29222@redhat.com>
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
Content-Transfer-Encoding: 7bit
To: mauelshagen@redhat.com, LVM general discussion and development <linux-lvm@redhat.com>


If I'm not mistaken, the raw(8) character device in 2.6 is
considered obsolete.  The same semantics can be gotten by
doing an open(2) on the block special file with the O_DIRECT
flag set.

On Thu, Apr 01, 2004 at 10:52:23AM +0200, Heinz Mauelshagen wrote:
> On Thu, Apr 01, 2004 at 12:26:39PM -0800, sachin wrote:
> > Hi
> > Can i Create a character device for a logical volume of lvm
> > If yes how to create and how lvm driver manage it or supports it
> 
> Yes. Have a look at 'man raw'.
> 
> > Thanks ,
> > Sachin
> 
> > _______________________________________________
> > linux-lvm mailing list
> > linux-lvm@redhat.com
> > https://www.redhat.com/mailman/listinfo/linux-lvm
> > read the LVM HOW-TO at http://tldp.org/HOWTO/LVM-HOWTO/
> 
> -- 
> 
> Regards,
> Heinz    -- The LVM Guy --
> 
> *** Software bugs are stupid.
>     Nevertheless it needs not so stupid people to solve them ***
> 
> =-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-
> 
> Heinz Mauelshagen                                 Red Hat GmbH
> Consulting Development Engineer                   Am Sonnenhang 11
>                                                   56242 Marienrachdorf
>                                                   Germany
> Mauelshagen@RedHat.com                            +49 2626 141200
>                                                        FAX 924446
> =-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-
> _______________________________________________
> linux-lvm mailing list
> linux-lvm@redhat.com
> https://www.redhat.com/mailman/listinfo/linux-lvm
> read the LVM HOW-TO at http://tldp.org/HOWTO/LVM-HOWTO/
