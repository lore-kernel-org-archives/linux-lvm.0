Return-Path: <dparrish@excido.com>
Date: Mon, 29 Jan 2001 16:59:21 +1100 (EST)
From: David Parrish <dparrish@excido.com>
Subject: Re: [linux-lvm] [CVS LVM Mon Jan 29 16:18:57 EST 2001] Device
 /dev/hdc1 doesn't exist
In-Reply-To: <20010128234206.D17449@sistina.com>
Message-ID: <Pine.LNX.4.21.0101291657550.31555-100000@mordor.parrish.org.au>
MIME-Version: 1.0
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
Content-Type: TEXT/PLAIN; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: linux-lvm@sistina.com

On Sun, 28 Jan 2001 lewis@sistina.com wrote:

> On Mon, Jan 29, 2001 at 04:25:43PM +1100, David Parrish wrote:
> > I'm trying to get LVM going for the first, time.. I'm getting a few
> > errors, I've looked through the FAQs and can't find anything about these.
> > 
> > If this is a really stupid commonly found problem and it's just a stupid
> > luser doing it, please point me in the appropriate manual, otherwise,
> > any help would be appreciated.
> > 
> > LVM CVS checked out today Mon Jan 29 16:18:57 EST 2001
> 
> Looks to me like you didn't check out the CVS with the LVM_0-9-patches tag.
> Use 'cvs co -r LVM_0-9-patches LVM' and see if it does the same thing.  This
> is documented on the CVS checkout instructions page at
> http://www.sistina.com/Pages/cvs.html
> If you didn't specify the tag you got a combination of Cluster LVM and the
> old 0.9 stuff...which is pretty broken at this time.
> 
> Regards,
> 

You're right! I didn't include that tag. However, I still get the same
messages when I checkout and recompile with that tag.

I forgot to include this in my script, don't know if it helps.
By the way, I'm using devfs, which I am assuming is causing my problems?

[root@mordor LVM]# pvscan
pvscan -- reading all physical volumes (this may take a while...)
pvscan -- ERROR "pv_read(): PV identifier invalid" reading physical volumes

-- 
David Parrish
Brainbench MVP for Linux
http://www.brainbench.com/

All men are mortal.  Socrates was mortal.  Therefore, all men are Socrates.
                -- Woody Allen
