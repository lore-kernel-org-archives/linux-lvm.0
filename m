Date: Thu, 24 Feb 2000 15:10:41 +0000 (GMT)
From: A James Lewis <james@fsck.co.uk>
Subject: Re: [linux-lvm] MD RAID DEVICES INFO
In-Reply-To: <38B53B4B.F6A7056B@mindless.com>
Message-ID: <Pine.LNX.4.20.0002241506230.18041-100000@vortex1.vrtx.net>
MIME-Version: 1.0
Sender: owner-linux-lvm
Errors-To: owner-linux-lvm
List-Id: <linux-lvm.redhat.com>
Content-Type: TEXT/PLAIN; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Michael Loftis <zop12@mindless.com>
Cc: "linux-lvm@msede.com" <linux-lvm@msede.com>, chrisp@intrepid.co.uk


The MD functionality has only just matured, how is this to be moved
forward into 2.4?  Is the MD functionality being rolled into LVM?  What
about duplication of effort.... I take it that large portions of code can
be shared?

I am told that LVM supports only linear and RAID0 which is hardly
useful... I appreciate that this is a work in progress but with 2.4 on the
horizon can we really justify dropping a well tested and functional system
for somthing without the major functionality of MD?

Perhaps somone can let me know how they see this moving forward?

On Thu, 24 Feb 2000, Michael Loftis wrote:

> MD has been unsupported since the 2.2 series of kernels (it wasn't
> marked as such because nobody realised this until the 2.2.13->2.2.14
> patch.
> 
> Since everyone has been asking about it I figured I'd let everyone know.
> 
> If someone wants to pick it up drop by l-k and check and see if anyone
> ahs yet.
> 
> --
> Michael Loftis
> zop12@mindless.com   ICQ: 15648280  AIM: DyJailBait
> Funny quip of the moment just happens to be....
> Linux is like a tent:
> no gates, no windows, and an Apache inside!
> 
> 
