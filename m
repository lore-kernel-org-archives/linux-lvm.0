Return-Path: <harvell@nortelnetworks.com>
Message-ID: <3A747121.973460C7@nortelnetworks.com>
Date: Sun, 28 Jan 2001 13:21:05 -0600
From: "Joe Harvell" <harvell@nortelnetworks.com>
MIME-Version: 1.0
Subject: Re: [linux-lvm] Follow-up 2: Help: lvm 0.9.1_beta3 oops (can't get my 
         data)
References: <Pine.LNX.4.30.0101281109100.7186-100000@beefcake.hdqt.valinux.com>
Content-Transfer-Encoding: 7bit
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
List-Id: <linux-lvm.redhat.com>
Content-Type: text/plain; charset="us-ascii"
To: linux-lvm@sistina.com

Jay:

Thanks for responding.  Yes, I have four snapshot LVs in this VG.  However, I don't think there was any I/O at all when I created the snapshot LVs.

So what's up with the af_packet module symbols in the traceback?

Jay Weber wrote:

> This problem you're experiencing sounds similar to what I hit after I have
> a machine hang while playing about with snapshots.  Did you by chance do
> anything with snapshots on w0 volume?
>
> I have machines from beta1, beta2 and beta3 with volumes that are stuck in
> the same state that you've run into that I haven't solved yet, granted I
> created the problem by messing with snapshots while heavy IO was involved.
>
> On Sun, 28 Jan 2001, Joe Harvell wrote:
>
> > Date: Sun, 28 Jan 2001 12:56:39 -0600
> > From: Joe Harvell <harvell@nortelnetworks.com>
> > Reply-To: linux-lvm@sistina.com
> > To: linux-lvm@sistina.com
> > Subject: [linux-lvm] Follow-up 2: Help: lvm 0.9.1_beta3 oops (can't get
> >     my data)
> >
> > When I do a 'vgdisplay -vD w0', I don't run into any problems.  Does this rule out the possibility of a vgcfgrestore helping?
> >
> > I looked at the man pages for vcfgrestore, but I don't know which destination I should specify.  Is it /dev/w0, or is it 'dev/hda8' and '/dev/hdb3'?
> > _______________________________________________
> > linux-lvm mailing list
> > linux-lvm@sistina.com
> > http://lists.sistina.com/mailman/listinfo/linux-lvm
> >
>
> _______________________________________________
> linux-lvm mailing list
> linux-lvm@sistina.com
> http://lists.sistina.com/mailman/listinfo/linux-lvm
