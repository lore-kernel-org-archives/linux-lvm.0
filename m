Return-Path: <lembark@wrkhors.com>
Date: Sat, 14 Jul 2001 08:54:30 -0500
From: Steven Lembark <lembark@wrkhors.com>
Subject: Re: [linux-lvm] Re: [PATCH] 64 bit scsi read/write
Message-ID: <750880000.995118870@dizzy>
In-Reply-To: <E15LL3Y-0000yJ-00@the-village.bc.nu>
References: <E15LL3Y-0000yJ-00@the-village.bc.nu>
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
Content-Type: text/plain; charset="us-ascii"
To: linux-lvm@sistina.com

- Alan Cox <alan@lxorguk.ukuu.org.uk> on 07/14/01 09:45:44 +0100:

>> If, after a power outage, the IDE disk can keep going for long enough
>> to write its write cache out to the reserved vendor area (which will
>> only take 20-30 milliseconds) then the data may be considered *safe*
>> as soon as it hits writecache.
> 
> Hohohoho.

Don't laugh, it works.  A 10KRPM drive has enough inertia and
stored charge to write a full cyl in less time than the BFC's in 
the switcher can discharge.

>> If I'm right then the only open question is: which disks do and
>> do not do the right thing when the lights go out.
> 
> As far as I can tell none of them at least in the IDE world

Some SCSI's will use intertia to write a single cyl if the power
goes out.  I've never seen a spec for IDE's that allows for this.

One more reason to use SCSI.
