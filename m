Date: Mon, 26 Jul 1999 00:29:23 +0200
From: Luca Berra <bluca@comedia.it>
Subject: Re: [linux-lvm] RAID and LVM?
Message-ID: <19990726002923.C6315@colombina.comedia.it>
Reply-To: bluca@comedia.it
References: <19990721224923.C29742@colombina.comedia.it> <Pine.LNX.4.10.9907212218320.2202-100000@hibernia.spin.ie> <19990722094845.A529@colombina.comedia.it>
Mime-Version: 1.0
In-Reply-To: <19990722094845.A529@colombina.comedia.it>; from Luca Berra on Thu, Jul 22, 1999 at 09:48:45AM +0200
Sender: owner-linux-lvm
Errors-To: owner-linux-lvm
List-Id: <linux-lvm.redhat.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: linux-lvm@msede.com

On Thu, Jul 22, 1999 at 09:48:45AM +0200, Luca Berra wrote:
> On Wed, Jul 21, 1999 at 10:22:57PM +0100, Paul Jakma wrote:
> > Anyway, back to the RAID+LVM saga.
...
> > So this has to be fixed soon anyway, and i'd love to be the guinea
> > pig. :)
> me too, i'll try something this weekend.
i love replying to myself :)))

i checked alan cox's linux-2.2.10-ac12 pacth wich includes
a heavily modified raid and lvm0.6 patch.
i added my devfs patch 
http://www.comedia.it/bluca/lvm/devfs-patch-v99.4-2.2.10-ac12.gz
and i was able to create and use a vg on a raid 1 device

todo: adding the diffs to the latest raid and lvm patches,
		incremental diff for those can be found at
		http://www.comedia.it/bluca/lvm/
	checking autodetect, especially with both raid and
		lvm loaded as modules. raid autorun happens before
		and after initrd, now i need it during initrd.

but appling those is time consuming and i have to take a plane to
Amsterdam in six hours time, so i'll better get some sleep :))))
I'll try that next week when i am back in Italy.

Regards,
Luca

-- 
Luca Berra -- bluca@comedia.it
    Communications Media & Services S.r.l.
