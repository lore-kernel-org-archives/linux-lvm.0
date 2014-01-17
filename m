Date: Fri, 17 Jan 2014 10:29:21 +0100
From: Karel Zak <kzak@redhat.com>
Message-ID: <20140117092921.GA5869@x2.net.home>
References: <87zjmxzmga.fsf@red.mvo.lan> <52D6B4AF.9010007@mglug.de>
	<CADxRZqwmcmqjM6qV184HtD5-X4WRxExhchAo7twWHEt7_Vuf4w@mail.gmail.com>
	<084301cf125a$d4b4a980$7e1dfc80$@acm.org>
	<52D7714F.3080105@redhat.com>
	<093401cf12fe$59e75640$0db602c0$@acm.org>
	<52D8E1A7.1080506@redhat.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <52D8E1A7.1080506@redhat.com>
Subject: Re: [linux-lvm] Identifying useable block devices
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
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Peter Rajnoha <prajnoha@redhat.com>
Cc: henson@acm.org, linux-lvm@redhat.com

On Fri, Jan 17, 2014 at 08:54:15AM +0100, Peter Rajnoha wrote:
> On 01/16/2014 10:03 PM, Paul B. Henson wrote:
> >> Peter Rajnoha
> >> Sent: Wednesday, January 15, 2014 9:43 PM
> >>
> >> This applies only if the symlinks/nodes are created directly with
> >> libdevmapper - which is the old classical way.
> >> If udev is used to manage /dev
> >> content for dm/lvm devices then the /dev/vg/vol is a symlink to /dev/dm-X
> >> (also /dev/mapper/vg-vol is a symlink to /dev/dm-X). And dm-X is not a
> > 
> > Hmm, yah, I see on my RHEL6 boxes that is indeed the case, as opposed to my
> > older RHEL5 boxes.
> > 
> >> As for mount, findmnt and other utilities from util-linux - they all use
> >> one common code which can handle this situation (e.g. if you call
> >> "findmnt /dev/vg/vol", it shows you /dev/mapper/vg-vol on output, not
> >> the dm-X the /dev/vg/vol is referencing actually).
> > 
> > IIRC, this thread started when somebody was being advised *not* to use the
> > /dev/mapper path, but rather to use the /dev/vg path. If there is special
> > case handling in util-linux, why isn't it returning what is being advertised
> > as the preferable path to use rather than the one that is said to be
> > internal and not to be referenced?
> 
> Well, that is probably an RFE for util-linux to give priority to
> /dev/<vgname>/<lvname> instead of /dev/mapper/<vgname>-<lvname>
> if it's available...
> 
> Karel, would that be possbible for you to add? (though I expect
> you probably don't want to add any additional and specific logic
> for dm devices :) )

I have spent years to move from /dev/dm-N to /dev/mapper/<name> ... :-)

Note that /dev/mapper/<name> paths are in many cases composed from
/sys/block/dm-<N>/dm/name and this sysfs file has been added (by
Milan) just to support conversion from random DM paths (or devno) to
the canonicalized /dev/mapper/<name>.

How I can convert maj:min or /dev/dm-N to /dev/vg/vol path? Is the
volume group name (always) in /sys/block/dm-<N>/dm/name and (always)
separated by "-" ?

It also seems that this is LVM specific, for non-LVM devices (for 
example LUKS) we want to use /dev/mapper/<name>.

    Karel

-- 
 Karel Zak  <kzak@redhat.com>
 http://karelzak.blogspot.com
