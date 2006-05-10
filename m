Date: Wed, 10 May 2006 12:48:44 +0200
From: Heinz Mauelshagen <mauelshagen@redhat.com>
Subject: Re: [linux-lvm] Snapshot segfaults lvremove + bug kernel
Message-ID: <20060510104844.GR31579@redhat.com>
References: <01b701c66dcb$5176d9d0$0101000a@jack>
	<20060509094146.GA2708@redhat.com>
	<4460DC3D.3090008@robinbowes.com>
Mime-Version: 1.0
Content-Disposition: inline
In-Reply-To: <4460DC3D.3090008@robinbowes.com>
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
To: Robin Bowes <robin-lists@robinbowes.com>
Cc: LVM general discussion and development <linux-lvm@redhat.com>, mauelshagen@redhat.com

On Tue, May 09, 2006 at 07:15:25PM +0100, Robin Bowes wrote:
> Heinz Mauelshagen wrote:
> > 
> > this is a known issue with tearing down kcopyd jobs we're working on.
> > 
> 
> Heinz,
> 
> Do you have any idea when we might see a fix for this? Is the bug
> present in later versions?

A fix has been provided ~2 weeks ago to lkml and was tested ok.
It is in the recent stable kernels.

> 
> For example, I've got a box running FC4 that has this problem. If I
> upgrade to FC5 am I likely to still see the problem?

Yes.

> 
> Also, what's the best way to get rid of the snapshot volumes? I'm
> currently planning to boot from a recovery disk that supports lvm and
> run lvremove from there.

That or using a n actual stable kernel *should* work,
because tearing down kcopyd jobs dies with the bug under load.

> 
> Thanks for any suggestions/advice,
> 
> R.

Regards,
Heinz    -- The LVM Guy --

=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-

Heinz Mauelshagen                                 Red Hat GmbH
Consulting Development Engineer                   Am Sonnenhang 11
Storage Development                               56242 Marienrachdorf
                                                  Germany
Mauelshagen@RedHat.com                            PHONE +49  171 7803392
                                                  FAX   +49 2626 924446
=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-
