From: Tim <tim@connectlive.com>
Subject: Re: [linux-lvm] System Suggestions
Message-Id: <20020306175147.A12548@connectlive.com>
References: <20020306210600.JKKL21197.imf11bis.bellsouth.net@taz>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20020306210600.JKKL21197.imf11bis.bellsouth.net@taz>;
    from freemyer@NorcrossGroup.com on Wed, Mar 06, 2002 at 03:59:50PM -0500
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
Date: Wed Mar  6 16:52:01 2002
List-Id: <linux-lvm.redhat.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: linux-lvm@sistina.com

If you're going with Promise consider an enclosure.  The UltraTrak100TX4
and 100TX8 both act like standard hardware RAID arrays, hot swap + hot
spare, but appear to the system as an Ultra2 LVD-SE SCSI device.  With
the Symbios cards we use (kernel patch supplied by Symbios as source --
LSI Logic is a TERRIFIC company to work with) we have not had any
problems and throughput has been exceptional.

Promise makes good cheap hardware, but I prefer a more specialized
vendor for my SCSI controllers, especially with the torture I put our
systems through.  (how many other people do you know running RAIDframe
on OpenBSD for example -- LSI/Symbios even attempts to help with THAT!)



Quoth Greg Freemyer:
> Anthony,
> 
> I'd be careful with the IDE Raid controller.
> 
> We just built a lab machine with a Promise IDE Raid controller and the assumption that we could get it and XFS to co-exist.
> 
> I'm not doing the work, but the engineer that is tells me that the Promise Patch Kit only works with a very limited number of stock Redhat Kernels, and that we are NOT free to add the XFS patch.  Even worse, promise does not supply their patch in source, so we are not free to tweak it ourselves.
> 
> I'm not sure I really believe that, but that is what I'm told.
> 
> If you do get the 3Ware IDE RAID controller to work with XFS, please let me know.
> 
> Greg Freemyer
> Internet Engineer
> Deployment and Integration Specialist
> The Norcross Group
> www.NorcrossGroup.com
> 
>  >>  On Wednesday 06 March 2002 02:40 pm, Petro wrote:
>  >>  > On Wed, Mar 06, 2002 at 11:52:30AM -0500, Anthony W. Marino wrote:
>  >>  > > Could someone, please, provide me with a link and/or facilitate some
>  >>  > > suggestons for configuration of the following components for a new DB
>  >>  > > server hosting MySQL 4.01MAX?  I'm only looking to get a start and
>  >>  don't
>  >>  > > expect "THE" answer since all things are relative and I will have to
>  >>  > > further test the various scenarios.
>  >>  > > SuSE 7.3-2.4.18
>  >>  > > 512MB RAM
>  >>  > > 4x40GB Maxtor IDE (7200RPM) drives
>  >>  > > 3Ware 7800 RAID Controller
>  >>  > > LVM
>  >>  > > XFS
>  >>  >
>  >>  >     You really don't provide us with enough information here.
>  >>  >
>  >>  >     How big is your database, both in total size and in number of
>  >>  >     tables. How are those tables utilized, when they get used do you
>  >>  >     primarily open one table, manipulate it, then close it, or do you go
>  >>  >     across a bunch of tables?
>  >>  >
>  >>  >     All of these, and more will have a dramatic impact on how you set
>  >>  >     this stuff up.
> 
>  >>  Thanks.  I'm more concerned about any specifics as it applies to MySQL Max
>  >>  
>  >>  and XFS, RAID and LVM as a whole.  Are there any nuances as it applies to
>  >>  the 
>  >>  whole?
> 
>  >>  Anthony
> 
> 
> 
> _______________________________________________
> linux-lvm mailing list
> linux-lvm@sistina.com
> http://lists.sistina.com/mailman/listinfo/linux-lvm
> read the LVM HOW-TO at http://www.sistina.com/lvm/Pages/howto.html

-- 
     "To be suspended from the legal profession is the moral equivalent of 
      being ostracized by child molesters."
                                                           --Ian Rowan
