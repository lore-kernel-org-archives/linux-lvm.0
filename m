MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Message-ID: <16272.21933.838510.310433@gargle.gargle.HOWL>
From: "John Stoffel" <stoffel@lucent.com>
Subject: Re: [linux-lvm] RAID 1 on Device Mapper - best practices?
In-Reply-To: <200310172128.10259.mike@gaima.co.uk>
References: <16272.19483.577313.115811@gargle.gargle.HOWL>
	<200310172128.10259.mike@gaima.co.uk>
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
Date: Fri Oct 17 15:51:01 2003
List-Id: <linux-lvm.redhat.com>
Content-Type: text/plain; charset="us-ascii"
To: linux-lvm@sistina.com

Mike> Wouldn't it be more sensible to mirror the disks, then stick
Mike> your LVs on top of that? This is what I have done with a
Mike> software RAID5 array.

Well, it could make more sense that way, but I was trying to get it do
that I could move and expand/shrink the filesystems as needed on the
various volumes.  

The other downside of the MD underneath LVM is that when a MD RAID
goes bad, I need to resync the entire disk.  In my setup, if I don't
have it mounted (or being used) and I corrupt it, there's less data to
have to re-mirror.

At least that was my goal.  

Mike> At first this didn't work, as the startup scripts Gentoo provide
Mike> initialise LVM before MD, but that was easily changed.

Yeah, I thinking I need to just tweak the scripts under debian as
well, but I wanted to find out what people found to be the best way to
do this.

John
