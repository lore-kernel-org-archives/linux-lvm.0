From: Craig Tierney <ctierney@hpti.com>
Subject: Re: [linux-lvm] Can no longer mount lvm striped volume
Message-Id: <20020502130722.E4053@hpti.com>
References: <20020502121825.B3956@hpti.com>
    <Pine.SGI.4.33.0205021333290.5694922-100000@erc2000.erc.wisc.edu>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <Pine.SGI.4.33.0205021333290.5694922-100000@erc2000.erc.wisc.edu>;
    from jmoser@erc.wisc.edu on Thu, May 02, 2002 at 01:34:40PM -0500
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
Date: Thu May  2 14:09:02 2002
List-Id: <linux-lvm.redhat.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: linux-lvm@sistina.com

Things are getting better.  I found 2 of the
3 lv's that were missing.  I am trying to find the last
one.  

All of the vg's and lv's were created under lvm 1.0.2.
I am now using 1.1-rc2.

If I type either:

   vgdisplay -v sdd_vol4

or 

   vgdisplay -v sdd2_vol12

I get the same results, both for sdd2_vol12.
That vg does not yet have a lv.  I get the same
results from different nodes (storage is fiber attached).

Is there a maximum number of vg's that are supported?
Is there a maximum length that a vg name can be?
  
When I first configured the new disks I had some problems
where trying to run vgdisplay on the volumes named 'sdd_vol1?' 
I would only get the results for sdd_vol1.  Is there an
8 character max built in?

Craig

On Thu, May 02, 2002 at 01:34:40PM -0500, John Moser wrote:
> 
> > [root@x06 /root]# mount -t ext3 /dev/sdd_vol2/ /export/sdd_vol2
> > mount: /dev/sdd_vol2/ is not a block device
> >
> > IO nodes have gone down in the past due to
> > power interruptions, but I have never had
> > this catastrophic of a problem.  I have 16 volume
> > groups, and 3 or 4 appear to be affected.
> 
> Have you tried a simple:
> 
> vgchange -a y
> 
> ?  Similar situation happened to me before, and I just needed to activate
> the volume group.
> 
> -John
> 
> 
> _______________________________________________
> linux-lvm mailing list
> linux-lvm@sistina.com
> http://lists.sistina.com/mailman/listinfo/linux-lvm
> read the LVM HOW-TO at http://www.sistina.com/lvm/Pages/howto.html

-- 
Craig Tierney (ctierney@hpti.com)
