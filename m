From: Heinz Mauelshagen <mauelsha@ez-darmstadt.telekom.de>
Message-Id: <200002241720.SAA08857@u9etz.ez-darmstadt.telekom.de>
Subject: Re: [linux-lvm] MD RAID DEVICES INFO
In-Reply-To: <Pine.LNX.4.20.0002241506230.18041-100000@vortex1.vrtx.net> from A James Lewis at "Feb 24, 2000  3:10:41 pm"
Date: Thu, 24 Feb 2000 18:20:25 +0100 (MET)
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Sender: owner-linux-lvm
Errors-To: owner-linux-lvm
List-Id: <linux-lvm.redhat.com>
Content-Type: text/plain; charset="us-ascii"
To: A James Lewis <james@fsck.co.uk>
Cc: mge@ez-darmstadt.telekom.de, linux-lvm@msede.com

> 
> The MD functionality has only just matured, how is this to be moved
> forward into 2.4?

Today there's MD concat and RAID0 only in 2.3.x.

> Is the MD functionality being rolled into LVM?

No.

I don't like to create moster ;-{)
A modular approach is better by far (see below).

> What
> about duplication of effort.... I take it that large portions of code can
> be shared?

No. It's not a question of large portions of code.
Basically supporting RAID0 in LVM is fairly simple and gives
you the choice for performance on which lower layer software
or hardware solution..

> 
> I am told that LVM supports only linear and RAID0 which is hardly
> useful...

This is a misleading statement.

Actually it's a question of how to layer several functional parts
on each other.
LVM basically gives you the flexibility of online resizing everything.

MD is the software solution which can be stacked below LVM to enable
software RAID1/4/5.

OTOH you are able to use dedicated hardware RAID subsystems instead
which are easier to administer and LVM on top of them to get the flexibility
to resize.

IOW: MD is one solution to address disk subsystem redundancy,
     hardware RAID subsystems is another.
     Volume Management sits on top of one of these
     (or even on mixed configurations).
     It can sit on top of multiple non redundant disks as well.

> I appreciate that this is a work in progress but with 2.4 on the
> horizon can we really justify dropping a well tested and functional system
> for somthing without the major functionality of MD?

Nobody wants to drop MD AFAIK!

Heinz

> 
> Perhaps somone can let me know how they see this moving forward?
> 
> On Thu, 24 Feb 2000, Michael Loftis wrote:
> 
> > MD has been unsupported since the 2.2 series of kernels (it wasn't
> > marked as such because nobody realised this until the 2.2.13->2.2.14
> > patch.
> > 
> > Since everyone has been asking about it I figured I'd let everyone know.
> > 
> > If someone wants to pick it up drop by l-k and check and see if anyone
> > ahs yet.
> > 
> > --
> > Michael Loftis
> > zop12@mindless.com   ICQ: 15648280  AIM: DyJailBait
> > Funny quip of the moment just happens to be....
> > Linux is like a tent:
> > no gates, no windows, and an Apache inside!
> > 
> > 
> 


-- 

=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-

Systemmanagement CS-TS                           T-Nova
                                                 Entwicklungszentrum Darmstadt
Heinz Mauelshagen                                Otto-Roehm-Strasse 71c
Senior Systems Engineer                          Postfach 10 05 41
                                                 64205 Darmstadt
mge@EZ-Darmstadt.Telekom.de                      Germany
                                                 +49 6151 886-425
                                                          FAX-386
=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-
