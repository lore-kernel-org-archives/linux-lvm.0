Date: Tue, 7 Mar 2000 17:39:22 -0600 (CST)
From: Jay Weber <jay@lazy.accessus.net>
Subject: Re: [linux-lvm] building the binary utilities
In-Reply-To: <20000307213810.3824.qmail@web117.yahoomail.com>
Message-ID: <Pine.OSF.4.21.0003071738110.3136-100000@lazy.accessus.net>
MIME-Version: 1.0
Sender: owner-linux-lvm
Errors-To: owner-linux-lvm
List-Id: <linux-lvm.redhat.com>
Content-Type: TEXT/PLAIN; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Chris Campbell <dash_ampersand@yahoo.com>
Cc: linux-lvm@msede.com

Make sure /usr/src/linux is a link to the proper kernel your
editing/configuring.  I had the same problem but it turned out my linux
link was pointing back to my 2.2.14 kernel, which I was actively hacking
on at the time. :)

On Tue, 7 Mar 2000, Chris Campbell wrote:

> kernel location is what it should be, but I still get
> all these errors.  I'm not sure what's going on, other
> than it can't find the lvm and liblvm header files,
> which are in a directory below the current one:
> 
> 
> 
> --- Michael Marxmeier <mike@msede.com> wrote:
> > Chris Campbell wrote:
> > > I got a patched kernel to compile ok, but now I
> > have
> > > problems building the binary lvm utilities.  There
> > are
> > > errors about not being about to find lvm.h and
> > > liblvm.h.  I copied them to /usr/include, and then
> > it
> > > got farther but complained about gnu/types.h. 
> > After
> > > symlinking that, I got an error about lots of
> > > redeclarations.  What's going on?  Thanks.
> > 
> > At least for glibc2.1 you need a patch for the user
> > mode tools,
> > otherwise compile fails. Please install patch
> > patch-lvm_0.8final-2
> > 
> > For a list of know issues please have a look at
> > http://linux.msede.com/lvm/doc/BUGS
> > 
> > Instead of copying lvm.h to /usr/include you should
> > modify the
> > KERNEL_LOCATION in make.tmpl. By default it assumes
> > your kernel 
> > sources in /usr/src/linux.
> 
> __________________________________________________
> Do You Yahoo!?
> Talk to your friends online with Yahoo! Messenger.
> http://im.yahoo.com
