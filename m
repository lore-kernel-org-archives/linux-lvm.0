Return-Path: <Heinz.Mauelshagen@t-online.de>
Date: Sun, 3 Dec 2000 14:25:54 +0000
From: Heinz J. Mauelshagen <Heinz.Mauelshagen@t-online.de>
Subject: Re: [linux-lvm] kernel hang
Message-ID: <20001203142554.G3984@srv.t-online.de>
References: <20001201020029.A1073@gondor.com>
Mime-Version: 1.0
In-Reply-To: <20001201020029.A1073@gondor.com>; from jan@gondor.com on Fri, Dec 01, 2000 at 02:00:29AM +0100
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
Cc: mge@sistina.com

On Fri, Dec 01, 2000 at 02:00:29AM +0100, Jan Niehusmann wrote:
> 
> Is there something wrong with doing 
> while true; do dd if=/dev/zero of=/dev/vg1/test; done
> and
> lvextend -L+90M /dev/vg1/test
> 
> at the same time?

No.
The extension of the LV is done in an atomic way.

> 
> It caused a system hang (no messages, no log) on linux-2.4.0-test12-pre3
> (with ext2 online resize patches, but there obviously was no filesystem 
> on the volume)

Did you experience other heavy load hangs in general?

> 
> Jan
> 
> 
> PS: Andreas, perhaps the errors I saw were not ext2 related. Maybe the 
> kernel doesn't like writing to the device and resizing it at the same time?
> 
> 
> _______________________________________________
> linux-lvm mailing list
> linux-lvm@sistina.com
> http://lists.sistina.com/mailman/listinfo/linux-lvm

-- 

Regards,
Heinz      -- The LVM guy --

=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-

Heinz Mauelshagen                                 Sistina Software Inc.
Senior Consultant/Developer                       Bartningstr. 12
                                                  64289 Darmstadt
                                                  Germany
Mauelshagen@Sistina.com                           +49 6151 7103 86
                                                       FAX 7103 96
=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-
