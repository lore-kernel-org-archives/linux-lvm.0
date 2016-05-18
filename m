Received: from deadbeef.usersys.redhat.com (dhcp130-141.brq.redhat.com
	[10.34.130.141])
	by int-mx14.intmail.prod.int.phx2.redhat.com (8.14.4/8.14.4) with ESMTP
	id u4IDJRZZ025229
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-SHA bits=256 verify=NO)
	for <linux-lvm@redhat.com>; Wed, 18 May 2016 09:19:28 -0400
References: <20160518002234.GA13276@bdmcc-us.com>
From: Marian Csontos <mcsontos@redhat.com>
Message-ID: <573C6BDF.4090209@redhat.com>
Date: Wed, 18 May 2016 15:19:27 +0200
MIME-Version: 1.0
In-Reply-To: <20160518002234.GA13276@bdmcc-us.com>
Content-Transfer-Encoding: 7bit
Subject: Re: [linux-lvm] Unable to find device with UUID XXX.
Reply-To: LVM general discussion and development <linux-lvm@redhat.com>
List-Id: LVM general discussion and development <linux-lvm.redhat.com>
List-Unsubscribe: <https://www.redhat.com/mailman/options/linux-lvm>,
	<mailto:linux-lvm-request@redhat.com?subject=unsubscribe>
List-Archive: <https://www.redhat.com/archives/linux-lvm>
List-Post: <mailto:linux-lvm@redhat.com>
List-Help: <mailto:linux-lvm-request@redhat.com?subject=help>
List-Subscribe: <https://www.redhat.com/mailman/listinfo/linux-lvm>,
	<mailto:linux-lvm-request@redhat.com?subject=subscribe>
List-Id: <linux-lvm.redhat.com>
Content-Type: text/plain; charset="us-ascii"; format="flowed"
To: LVM general discussion and development <linux-lvm@redhat.com>

On 05/18/2016 02:22 AM, Brian McCullough wrote:
> I have an issue that I hope that the group can save me from.
>
> I have found the Thin discussions interesting, but I am still doing the
> Thick thing.
>
>
> OK, I had a drive that started to cause problems, would not boot without
> fsck, etc., and decided to replace it using pvmove.
>
> I made myself a CD with SystemRescueCD ( sp? ) and booted the system
> with that.
>
> I attached the new drive to the system before I booted.  It had no PVs
> on it, but a set of partitions ( GPT table ) ready to be assigned.
>
> ( skipping a couple of steps )
>
> I ran pvmove for about half of the PVs on the drive that was failing,
> sending them to the new drive.  All seemed to be well.
>
> THEN, the data cable on the old drive ( USB 3 ) was disturbed, and
> pvmove stopped, complaining that it couldn't see the drive.  OK, I can
> fix this.  I plugged the cable back in, but things didn't seem to be any
> better.

BTW, pvmove is not a data rescue tool. It does not keep persistent log 
and it is necessary to resume synchronization between drives from 
scratch on reboot.

Use ddrescue to get data from disks with errors.

>
> I stopped the system, and rebooted.
>
> I have rebooted several times, with not completely consistent results.
>
> A couple of times it stopped when it said that it was loading the MD
> drivers.

We need to know more to help.

Are you using  md raid? If so is not using mdadm to replce and 
synchronize the drive better?

What distribution, version of LVM and kernel?

`lsblk` output would help us to see what's there.
`blkid` output would help us to see other bits and pieces.
Also `vgs`, `lvs -avo+devices`, `pvs` output, too, please.


>
> When I seem to have got the system booted properly, I do a pvs and it
> complains about missing UUIDs.

My guess is some of the PVs (those on the old drive) were marked missing 
and would have to be readded to the VG using `vgextend --restoremissing` 
before you can continue.

Another possibility is, is lvmetad enabled and running?
If so it may be possible, there are some duplicates there, and older 
versions of LVM did not always warn about that.

-- Martian

>
> I did a "pvscan -u" and thought that I was seeing the UUIDs in the
> bottom part of the display, after it had complained about the missing
> ones, but I think that I was just seeing what it wanted to see, not what
> it was actually finding.
>
> At this point, I seem to be dead in the water, and can't resume the
> pvmove process.
>
> Can you guide me back to the light, and help me finish what I started to
> do, so that I can get this machine back to work?
>
>
> Thank you,
> Brian
>
>
> _______________________________________________
> linux-lvm mailing list
> linux-lvm@redhat.com
> https://www.redhat.com/mailman/listinfo/linux-lvm
> read the LVM HOW-TO at http://tldp.org/HOWTO/LVM-HOWTO/
>
