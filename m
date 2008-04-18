Date: Fri, 18 Apr 2008 13:45:40 +0100
From: Stephane Chazelas <stephane.chazelas@emerson.com>
Subject: Re: [linux-lvm] snapshotting to a different volume group
Message-ID: <chaz20080418124540.GF20413@artesyncp.com>
References: <chaz20080417145809.GA20413@artesyncp.com>
	<20080418082436.GA7331@redhat.com>
	<chaz20080418115315.GE20413@artesyncp.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <chaz20080418115315.GE20413@artesyncp.com>
Reply-To: LVM general discussion and development <linux-lvm@redhat.com>
List-Id: LVM general discussion and development <linux-lvm.redhat.com>
List-Unsubscribe: <https://www.redhat.com/mailman/listinfo/linux-lvm>,
	<mailto:linux-lvm-request@redhat.com?subject=unsubscribe>
List-Archive: <https://www.redhat.com/archives/linux-lvm>
List-Post: <mailto:linux-lvm@redhat.com>
List-Help: <mailto:linux-lvm-request@redhat.com?subject=help>
List-Subscribe: <https://www.redhat.com/mailman/listinfo/linux-lvm>,
	<mailto:linux-lvm-request@redhat.com?subject=subscribe>
List-Id: <linux-lvm.redhat.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: mauelshagen@redhat.com, LVM general discussion and development <linux-lvm@redhat.com>

2008-04-18 12:53:15 +0100, Stephane Chazelas:
[...]
> By bypassing LVM2 and using dmsetup directly, would I
> theoretically be able to setup a snapshot outside of LVM2
> managed volume groups, is it worth me trying to dig that way?
> Something like: having a LVM (or not) volume group with only
> /dev/md0 and creating snapshots of that elsewhere while leaving
> the VG containing /dev/md0 undisturbed?
[...]

[replying to myself]

OK, I get it.

When one creates a snapshot, he changes the original block
device to be a "snapshot-origin" so that every write to the
device is forked into:
  - copying the original block to the snapshot device(s) COW(s)
  - writing to the original device.

So, if I've got the COWs on a failed disk, I suspect this might
degrade the performances or even stop the snapshot-origin from
working altogether wouldn't it?

I'll keep testing...

-- 
Stephane
