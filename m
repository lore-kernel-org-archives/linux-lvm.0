From: Herbert Poetzl <herbert@13thfloor.at>
Subject: Re: [linux-lvm] lvm on a firewire harddisk
Message-ID: <20030517085956.GA26092@www.13thfloor.at>
References: <000701c31c3f$a42c2620$c600a8c0@hermanslaptop>
Mime-Version: 1.0
Content-Disposition: inline
In-Reply-To: <000701c31c3f$a42c2620$c600a8c0@hermanslaptop>
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
Date: Sat May 17 03:59:02 2003
List-Id: <linux-lvm.redhat.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: linux-lvm@sistina.com

On Sat, May 17, 2003 at 08:43:35AM +0200, Herman Kuster wrote:
> Hi,
> 
> I've got the following problem:
> I've a firewire harddisk (maxtor 5000xt), this disk works fine and is
> available as /dev/sda in my system.
> On this disk i have created one single pv (on /dev/sda, no partitioning)
> I have put this pv into a vg, and in this volume group i have created one
> lv.
> All seems to be working fine until the time comes when my computer restarts.
> On a boot somehow the lvm system forgets the pv on de firewire harddisk and
> only shows (on a pvscan for example) the pv/vg/lv's on my normal harddisks
> (/dev/hda and /dev/hdb). By the time the lvm system starts up i'm sure the
> ieee1394 system is up and running (i modified my rc.sysinit file so the
> ieee1394 system is startup before lvm).
> Even when i am logged in as a user the lvm system still doesn't know the pv
> on my firewire harddisk. But after I do a 'pvdisplay /dev/sda' the pv is
> shown correctly and now the lvm system knows about the pv (it shows up in
> pvscan and the vg/lv become available etc.). Does anyone know why my system
> behaves as it does (btw i'm using a redhat 9.0 clean install), is this some
> kind of bug in the lvm system, am i doing something wrong, please help.

My guess is, that either the lack of partitioning
prohibits the correct detection of your lvm
volume, or some drivers (eg. sd_mod) are not 
present at pvscan time, which get automagically
loaded when you explicitely access /dev/sda ...

HTH,
Herbert

> Thanks,
> 
> Herman
> 
> 
> 
> _______________________________________________
> linux-lvm mailing list
> linux-lvm@sistina.com
> http://lists.sistina.com/mailman/listinfo/linux-lvm
> read the LVM HOW-TO at http://tldp.org/HOWTO/LVM-HOWTO/
