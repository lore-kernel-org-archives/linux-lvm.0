From: Craig Tierney <ctierney@hpti.com>
Subject: Re: [linux-lvm] Can no longer mount lvm striped volume
Message-Id: <20020502124850.B4053@hpti.com>
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
Date: Thu May  2 13:50:02 2002
List-Id: <linux-lvm.redhat.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: linux-lvm@sistina.com

As Homer would say 'Doh!'.

I am still having some other problems, but this error
was fixed by mounting the logical volume and not the
volume group.

Wrong:  mount -t ext3 /dev/sdd_vol2 /export/sdd_vol2
Correct: mount -t ext3 /dev/sdd_vol2/lv1 /export/sdd_vol2

I was still having problems with the scan message, but
after I fixed that I didn't run the mounting scripts I
mounted by hand and messed up.

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
