Subject: Re: [linux-lvm] LVM2 setup notes and questions
From: "Nathan G. Grennan" <ngrennan@okcforum.org>
In-Reply-To: <20020807083823.GB1468@fib011235813.fsnet.co.uk>
References: <1028495668.1455.44.camel@cygnusx-1.okcforum.org> 
	<20020807083823.GB1468@fib011235813.fsnet.co.uk>
Content-Transfer-Encoding: 7bit
Message-Id: <1028749146.5949.15.camel@cygnusx-1.okcforum.org>
Mime-Version: 1.0
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
Date: Wed Aug  7 15:06:36 2002
List-Id: <linux-lvm.redhat.com>
Content-Type: text/plain; charset="us-ascii"
To: linux-lvm@sistina.com

On Wed, 2002-08-07 at 03:38, Joe Thornber wrote:
> Nathan,
> 
> Thanks for your mail, this sort of information is really helpful.
> 

You are welcome.

> 
> I think maybe we should disable readline support by default, very few
> people use it.
>

Good
 
> 
> I think this is more of a distro problem than an LVM2 prob.
> 

This could be fixed in the LVM2 tools, though is probably also fixable
in the distribution.

> > The next problem I ran into was a common one of vgscan trying to scan
> > cdrom drives at hda and hdc. After reading the man page for lvm.conf and
> > doing a little Google searching I figure out the correct format to
> > filter both. I think the man page could use some additional examples to
> > show the format for more than one filter.
> 
> Did you find the examples in LVM/doc/example.conf ?
>

locate example.conf  shows no LVM example.conf on the system, both in
the installed areas and the build directories.

 
> 
> There should automatically be a symbolic link from /dev/vg/data to
> /dev/device-mapper/vg-data.  Can you confirm that this isn't happening
> on your system please ?
>

No, but as I thought about it though I realized why. I think I had
device files left over from my LVM1 setup and so I have been using a
mixed up device setup. I will work on getting it setup correctly.
 
> Format2 hasn't been released yet, it's currently undergoing a lot of
> testing, we want to be confident it is correct before trusting peoples
> data to it.  The upgrade procedure will be in the form a little shell
> script which backs up your vgs in the normal text format, and then
> restores from this text format to new format2 metadata areas.
>

ok, I asked because I noticed the boot messages mentioned the metadata
was still LVM1.
 
> The partition will count as a PV, so just use vgextend, eg,
> 
> vgextend vg0 /dev/hdc2
> 
> Not sure what you mean here, if you are asking if LVM2 will
> automatically resize filesystems the answer is no.  We're just
> concentrating on volume management, not filesystem management.
>

I later figured this all out, and it was a little more complicated than
that. I also found there is a tool that is meant to expand the logical
volume and filesystem with one command, but it isn't implemented yet.

> I can't think of any major bug that would force you to upgrade.
> 
> We tend to work off an internal bitkeeper repository and occasionally
> sync up with CVS or the public bitkeeper.  So you shouldn't be shy
> about using the CVS version since it is very stable.
> 
> If you are a bitkeeper user the latest stable 2.4 version can be
> pulled from:
> 
> bk://device-mapper.bkbits.net/2.4-stable
> 
> This gets updated more frequently than cvs.  You can see the changeset log here:
> 
> http://device-mapper.bkbits.net:8080/2.4-stable
> 

ok, I will look into that and likely switch to a more recent version.

 
> /dev/device-mapper is being renamed to /dev/mapper (kernel hackers
> don't like typing).  So if you do pick up patches that implement this
> change (ie. from bitkeeper), please remember to rebuild libdevmapper.
> 

ok, good to hear it is being simplified even more.
