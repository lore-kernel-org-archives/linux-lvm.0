Return-Path: <dmeyer@dmeyer.net>
Date: Tue, 6 Feb 2001 03:22:56 -0500
From: dmeyer@dmeyer.net
Subject: Re: [linux-lvm] 0.9.1 vgscan doesn't detect upgraded vg's
Message-ID: <20010206032256.A831@jhereg.dmeyer.net>
References: <3A7F6413.A80D1803@twisted.net>
Mime-Version: 1.0
Content-Disposition: inline
In-Reply-To: <200102060630.f166UYM32021@webber.adilger.net>
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

In article <200102060630.f166UYM32021@webber.adilger.net> you write:
> Michael McLinn writes:
> > My theory is each pv is supposed to have the the UUID's of 
> > itself, and all other pv's in it's vg within it's UUID 
> > datastructure.  Is this so?
> 
> Correct.  There was another user who reported the same bug, but after
> they were playing with the system a bit, it started to work (i.e. the
> UUIDs were filled in) so it was not looked at further.

That other user was me.  I eventually commented out the UUID check in
pv_read_all_pv_of_vg as the previous poster suggested.  This let me
run vgscan, vgchange -ay, and mount my LVs.  Just go to
pv_read_all_pv_of_vg.c and get rid of the code after the
    if ( uuids > 0 ) {
check.

> > If this is the case, it seems it would be possible to write the 
> > correct UUID's to the datastructure on disk, and potentially 
> > improve (maybe even fix) my situation.

After getting vgscan to find my VGs, I pretty much just lucked into my
UUIDs getting set correctly and I'm still not sure what did it.  All I
did was activate my VGs (which I'm told couldn't have fixed the
UUIDs), run vgck (ditto), and run vgscan after the VGs were active.
vgscan at least _calls_ pv_write_uuidlist, so it is a possibility.
However, running vgscan on the non-active VGs definitely didn't update
the UUIDs for me.

> > One more note that might be of interest, these volume groups were
> > created with a much earlier version of lvm, 0.6 or 0.7 I believe.
> 
> I don't know what the situation was with the other person who had
> this same bug, but it is good to know anyways.

Mine were originally created with 0.8final.

-- 
Dave Meyer
dmeyer@dmeyer.net
