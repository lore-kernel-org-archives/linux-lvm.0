Return-Path: <root@srv.sistina.com>
Date: Tue, 6 Mar 2001 17:15:27 +0000
From: "Heinz J. Mauelshagen" <Mauelshagen@sistina.com>
Subject: Re: [linux-lvm] Where is the limit on Max VGs coming from?
Message-ID: <20010306171527.F25332@sistina.com>
References: <200103060710.MAA08060@wipro.wipsys.sequent.com>
Mime-Version: 1.0
In-Reply-To: <200103060710.MAA08060@wipro.wipsys.sequent.com>; from kishore.sampathkumar@wipro.com on Tue, Mar 06, 2001 at 12:40:45PM +0530
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
List-Id: <linux-lvm.redhat.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: linux-lvm@sistina.com

On Tue, Mar 06, 2001 at 12:40:45PM +0530, Kishore wrote:
> Hi,
> 
> I wanted to know the reason for the limitation for Maximum number of
> VGs, which is 100 currently.

Just, what I've set in order to make a reasonable sized VG table in
the driver.

I did never see a volume manager configure system with more than a couple of
dozens of VGs.

> 
> If it was based on bits in minor number, I was under the impression that
> it should have been 255 (where /dev/lvm occupies minor number 0 for the
> LVM Character device interface).
> 
> Can someone clarify?
> 
> Thanks,
> - Kishore
> _______________________________________________
> linux-lvm mailing list
> linux-lvm@sistina.com
> http://lists.sistina.com/mailman/listinfo/linux-lvm

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
