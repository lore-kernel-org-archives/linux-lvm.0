Date: Tue, 16 Oct 2001 12:16:34 +0200
From: Ulrich Wiederhold <U.Wiederhold@gmx.net>
Subject: Re: [linux-lvm] replace bad hard disc
Message-ID: <20011016121634.A2856@sky.net>
References: <110278234233.20011015163039@difi.de> <20011016105533.A4318@sistina.com>
Mime-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20011016105533.A4318@sistina.com>
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

* Heinz J . Mauelshagen <mauelshagen@sistina.com> [011016 10:55]:
> 
> Stefan,
> 
> add a new hard drive to your system and create (at least) an LVM partition
> (Type 0x8E) on it. Let's call the new one /dev/sde1 and your flaky one
> /dev/sdd1 just for the purpose of this example.
> 
> Then:
> 
> pvcreate /dev/sde1
> vgextend Stonki2 /dev/sde1
> pvmove /dev/sdd1 /dev/sde1
> vgreduce Stonki2 /dev/sdd1
> 

Hello,
will pvmove work if /dev/sde1 is already added to Stonki2 if there is
enough space available on /dev/sde1 ?

Reason: I have a vg containing 5 HDs that includes a small 4GB one. I
would like to remove this one without adding another HD. Enough space is
available.

Regards
Uli

-- 
'The box said, 'Requires Windows 95 or better', so i installed Linux - TKK 5
