From: "Heinz J . Mauelshagen" <mauelshagen@sistina.com>
Subject: Re: Fw: [linux-lvm] Any way to remove a PV from LV for backup?
Message-ID: <20020904121502.A26504@sistina.com>
References: <004601c253ba$da0701f0$6a01a8c0@bmoon>
Mime-Version: 1.0
In-Reply-To: <004601c253ba$da0701f0$6a01a8c0@bmoon>; from bo@sosnetwork.net on Tue, Sep 03, 2002 at 07:29:10PM -0700
Sender: linux-lvm-admin@sistina.com
Errors-To: linux-lvm-admin@sistina.com
Reply-To: linux-lvm@sistina.com
List-Help: <mailto:linux-lvm-request@sistina.com?subject=help>
List-Post: <mailto:linux-lvm@sistina.com>
List-Subscribe: <http://lists.sistina.com/mailman/listinfo/linux-lvm>,
	<mailto:linux-lvm-request@sistina.com?subject=subscribe>
List-Unsubscribe: <http://lists.sistina.com/mailman/listinfo/linux-lvm>,
	<mailto:linux-lvm-request@sistina.com?subject=unsubscribe>
List-Archive: <http://lists.sistina.com/pipermail/linux-lvm/>
Date: Wed Sep  4 05:31:01 2002
List-Id: <linux-lvm.redhat.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: linux-lvm@sistina.com

Bo,

please look into the list archive.

On Tue, Sep 03, 2002 at 07:29:10PM -0700, bmoon wrote:
> I lost the last 3 days' email and did not have any response yet.
> So sending the same question again.
> 
> > Hello,
> > 
> >  The system has 4 PVs, which belongs to one VG and one LV.
> >  I want to remove a disk and replace it with new when the system
> >  consumes all of its space then start to use next PV.
> >  
> >  Q1: Is it really possible by LVM concept?
> > Q2: If I have one extra PV I could use "pvmove", but I do not have.
> >         Any way to resolve it?
> > Q3: Are there any way to replay each PV(backup PV) independently on 
> >        the seperate system?
> >  
> >  Any other idea or hint?
> >  
> >  Thanks,
> >  
> >  Bo
> 
> 
> 
> _______________________________________________
> linux-lvm mailing list
> linux-lvm@sistina.com
> http://lists.sistina.com/mailman/listinfo/linux-lvm
> read the LVM HOW-TO at http://www.sistina.com/lvm/Pages/howto.html

-- 

Regards,
Heinz    -- The LVM Guy --

*** Software bugs are stupid.
    Nevertheless it needs not so stupid people to solve them ***

=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-

Heinz Mauelshagen                                 Sistina Software Inc.
Senior Consultant/Developer                       Am Sonnenhang 11
                                                  56242 Marienrachdorf
                                                  Germany
Mauelshagen@Sistina.com                           +49 2626 141200
                                                       FAX 924446
=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-
