Return-Path: <lembark@wrkhors.com>
Date: Wed, 20 Jun 2001 21:29:05 -0500
From: Steven Lembark <lembark@wrkhors.com>
Subject: Re: [linux-lvm] Re: another nice feature for packagers ...
Message-ID: <34770000.993090545@dizzy>
In-Reply-To: <20010618103116.A32391@sistina.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline
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
Content-Type: text/plain; charset="us-ascii"; format="flowed"
To: linux-lvm@sistina.com


>> It would be nice if --prefix worked consistently for the new release.
>> Until some final kinks in devfs get worked over keeping the VG's out of
>> /dev without having to hack the source code would be helpful.
>
> Care to explain further?  I don't know what you're talking about here.
> --prefix works fine for me in all cases.

Try:

	./configure --prefix=/lvm;

build and install everything.  Notice where the vgXX directories go:  /dev,
not /lvm.  None of the configure switches (last time I compiled) were able
to keep the vg's out of devfs's clutches w/o hacking a #define in the code.
As a temporary fix until all the devfs glitches are worked out (some not lvm
related) it'd be nice to avoid problems. 
