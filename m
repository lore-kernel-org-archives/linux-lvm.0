Return-Path: <root@srv.sistina.com>
Date: Mon, 30 Apr 2001 16:10:07 +0000
From: "Heinz J. Mauelshagen" <Mauelshagen@sistina.com>
Subject: Re: [linux-lvm] lowest spec LVM run on ? 
Message-ID: <20010430161007.J19810@sistina.com>
Mime-Version: 1.0
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

On Sun, Apr 29, 2001 at 06:47:48PM +0100, Kirth wrote:
> Hi,
> 
> 	I'm just wondering whats the lowest spec machine that anyone has an LVM 
> running (stable) on ?


TANSTA a lowest spec.

The hardware should just support Linux 2.2 or 2.4 including LVM ;-)

The only constraint is RAM which must be decently sized, because LVM keeps
metadata in the kernel.

If you play around with LVM test configurations and for eg. choose to have
*small* PE sizes you could eventually end up with large LVM mapping tables
leading to low memory.

Nevertheless the LVM driver checks for this and prevents you from loading
such amounts of metadata; IOW: you wouldn't be able to activate your VG(s)
or create/extend your LVs in this case and LVM still shouldn't crash on you.

Regards,
Heinz    -- The LVM Guy --


> 	The reason is, I have just built another one, but it's on a p100 with 
> 16megs of ram, I tried to reiserfs
> 	the drive but that crashed the kernel (still no idea why, same kernel as 
> my p133 with 128megs... which
> 	works fine). I have made the fs just ext2 for now (this is all testing NOT 
> live).
> 
> 	Any suggestions for ensuring it's stable ? I am trying to find some simm's 
> for the pc ;)
> 
> Kirth
> 
> _______________________________________________
> linux-lvm mailing list
> linux-lvm@sistina.com
> http://lists.sistina.com/mailman/listinfo/linux-lvm

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
