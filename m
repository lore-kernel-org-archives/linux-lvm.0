Message-ID: <39F21939.682BCCF7@tls.msk.ru>
Date: Sun, 22 Oct 2000 02:31:21 +0400
From: "Michael Ju. Tokarev" <mjt@tls.msk.ru>
MIME-Version: 1.0
Subject: Re: [linux-lvm] Is LVM dead ?
References: <39F0B45C.6735D447@tls.msk.ru> <20001020220300.B22203@homer.sistina.com>
Content-Transfer-Encoding: 7bit
Sender: owner-linux-lvm
Errors-To: owner-linux-lvm
List-Id: <linux-lvm.redhat.com>
Content-Type: text/plain; charset="us-ascii"
To: Heinz Mauelshagen <mauelshagen@sistina.com>
Cc: linux-lvm@msede.com

Heinz Mauelshagen wrote:
> 
> Michael,
> 
> as mentioned on this list a couple of days ago, LVM 0.9 is going to be
> released early november.

I follow this list for about a year now.  There was some references
last month to 0.9, two of them was yours.  But that 0.9 is like a
cloud that maybe here or maybe not.  In contrast, demands for
bugfixes are high for some months already.  Most important for
many users are bugfixes -- with current features lvm already
very useful, but probably not so useful with bugs and great features.
I say here about already well-known bugs that are serious enouth.
Can someone count how many people debugged existing bugs that
was already fixed in some 0.9 code? :(  Look to list: there is
a loop like:

  can someone point me to lvm for kernel 2.2.15 (2.2.16, 2.2.17,...)?
    -- yes, it is there and there
       -- thanks
  oh, there is a bug in lvm there and there.  Here is a patch.
    -- yes, it is a known bug, patch already there and there and there.
  oh, there is another bug, patch included.
    -- yes, it is also a known bug, patch can be found...

And so on.  Most people just stuck on applying kernel patches, as
current kernel is different compared to 2.2.13 one...

Great thanks to Andeas Dilger who maintains his version of all
needed stuff -- I'm shure that this work saved a lot of the above
cycles.

> It will for eg. contain persistent and resizable snapshots.
> 
> If you have any feature enhancements, bug fixes or code to supply,
> Please feel free to discuss them on this list.

What really needed is a collection of all patches or, preferrably,
one (maybe inetrim) release, with a point to it from
linux.msede.com/lvm.

[my flaws skipped]
> > I'm sorry, I'm really very sorry for this all if I'm wrong.
> > This is just my impression, nothing more.  And I apologize,
> > really, if I'm wrong.
> 
> You should.
>
> > But -- who can demonstrate that I'm wrong ??? :(((((((((
> 
> Hopefully i was.

Ok.  I greatly apologize, Heinz!  Excuse me please.

But you should agree that from "outside" view things
_may_ looks like I described.  I has some talks with
my friends today, and some of them have the same
impressions...  And look -- situation is trivial
to reslove, and many people will be glad to help.

Also I'm shure that someone will be glad/interested
to help with 0.9 release implementation...

Again, Excuse me please, Heinz and all!

Regards,
 Michael.
