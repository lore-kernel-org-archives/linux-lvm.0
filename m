Return-Path: <Heinz.Mauelshagen@t-online.de>
Date: Sun, 3 Dec 2000 14:29:01 +0000
From: Heinz J. Mauelshagen <Heinz.Mauelshagen@t-online.de>
Subject: Re: [linux-lvm] lvm
Message-ID: <20001203142901.H3984@srv.t-online.de>
References: <000d01c05b69$6b5ca020$3f06fea9@licht1>
Mime-Version: 1.0
In-Reply-To: <000d01c05b69$6b5ca020$3f06fea9@licht1>; from ABehler@t-online.de on Fri, Dec 01, 2000 at 08:36:28AM +0100
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

On Fri, Dec 01, 2000 at 08:36:28AM +0100, andreas wrote:
> hi guys,
> 
> after a hdisc crash i got only data (various logical volumes) on one of three physical volumes.
> could someone tell me, if there is a way to use this physical volume and it's logical volumes in my new created volume group without having
> any backup of my old one.

There's no way to use it in a new created VG.
But you can restore the VG metadata (VGDA) of the disapeared disk(s)
using vgcfgrestore(8) in order to make use of the available data.

Please remember that in case you had eg. filesystem data in LVs on the dead
disk(s), you can't make use of it any longer.

> 
> 
> thank you guys for your support,
> 
>     andreas behler

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
