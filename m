Return-Path: <patrick@tykepenguin.cix.co.uk>
Date: Mon, 29 Jan 2001 12:58:26 +0000
From: Patrick Caulfield <caulfield@sistina.com>
Subject: Re: [linux-lvm] Help recovering my volume groups
Message-ID: <20010129125826.E594@tykepenguin.com>
References: <Pine.LNX.4.30.0101271720570.2092-300000@tweetie.comstar.net>
Mime-Version: 1.0
Content-Disposition: inline
In-Reply-To: <Pine.LNX.4.30.0101271720570.2092-300000@tweetie.comstar.net>; from gregm@comstar.net on Sat, Jan 27, 2001 at 05:27:46PM -0500
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
Content-Transfer-Encoding: 7bit
To: linux-lvm@sistina.com

On Sat, Jan 27, 2001 at 05:27:46PM -0500, Gregory McLean wrote:
> 
> Hi,
>  I've been using the LVM quite happily for some time now, the other day
> one of the logical volumes in my volume group was getting full so I
> extended it, unmounted the fs, grew the fs, remounted it and went on my
> merry way. Today I got annoyed at the machine swapping constantly so I
> went and got some more mem to put in the machine, shutdown, install
> additional mem, powerup and:
> 
>  vgscan
> vgscan -- reading all physical volumes (this may take a while...)
> vgscan -- no volume groups found

Are you running beta3 ? If not then an upgrade would be helpful.

If you are then we really need to find out what's happening here. 
Do you have any snapshots defined ?

Can you do a pvdisplay on all the PVs and post the output, it might also 
be helpful if you can dd if=/dev/hd?? of=pv-dump.txt bs=1024 count=4 and send
those four files too so we can see what has actually happened to the on-disk
metadata.

After than(but not before please!) you could try

vfcfgrestore mmedia /dev/hda7
vfcfgrestore mmedia /dev/hda8
vfcfgrestore mmedia /dev/hdb1
vfcfgrestore mmedia /dev/hdc1
vgchange -ay

And see if that helps.

Thanks,

Patrick
