Message-ID: <3955EE8D.15AE858A@inet.net.nz>
Date: Sun, 25 Jun 2000 23:35:41 +1200
From: Dale Kemp <dale@inet.net.nz>
MIME-Version: 1.0
Subject: Re: [linux-lvm] LVM /dev and /proc problems and change proposal
References: <3955A848.D5071D8E@inet.net.nz> <20000625103032.A3124@hmsysv.t-online.de> <3955D87A.590E9C2C@inet.net.nz> <20000625131619.A3679@hmsysv.t-online.de>
Content-Transfer-Encoding: 7bit
Sender: owner-linux-lvm
Errors-To: owner-linux-lvm
List-Id: <linux-lvm.redhat.com>
Content-Type: text/plain; charset="us-ascii"
To: Mauelshagen@Sistina.com
Cc: Linux LVM mailing list <linux-lvm@msede.com>

> > And we don't know
> > what users are going to call their volume groups and we don't know what
> > device names will be created in the future.
>
> vgrename(8) is able to address that.

That's not the point I'm making here.

    # vgcreate yup0
    # etc...

Creates /dev/yup0 and all is well...

Then an upgrade occurs with support for the new yup devices from Yups(tm)
technology. Devices /dev/yup[0-5] are created, or it fails(?). If your yup0 was
in /dev/lvm/yup0 then things would carry on like normal. We don't know
what the user will name the vg's and we don't know the names of new devices
to be added to linux. By using a sub directory:

    - You keep all the stuff together in one place (well almost /etc/lvm/ /dev/lvm/
...)
    - You get around any future name clash problems
    - Its easier to find what your looking for
    - Its just plain tidier
    - Its a simple to do

> > > There's a preprocessor definition LVM_DIR_PREFIX in the code, which
> > > supports this already.
> >
> > So I see. The simplest solution is to change this default prefix, and have the
> > lvm stuff self-contained in its own subdirectory.
>
> Yes.
> Please give it a try and tell me if it works.

Ok - I will. I suspect it will work fine looking at the code.

> > > Yep.
> > > Already on the TODO list.
> > > I share your point of view in regard to /proc.
> >
> > The need for /proc/lvm/... is simular to that for /dev/lvm/...
>
> More or less.
>
> /proc/* is for programs to parse the contained information.
>
> Therfore its not primarily addressing a real name clash problem
> but the answer to the request for easy parsing.

Yes for user and machine.

-- Dale.
