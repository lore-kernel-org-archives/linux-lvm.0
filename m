Return-Path: <mauelshagen@sistina.com>
Date: Fri, 17 Aug 2001 16:56:01 +0200
From: "Heinz J . Mauelshagen" <mauelshagen@sistina.com>
Message-ID: <20010817165601.B11977@sistina.com>
References: <20010815175659.A29749@sistina.com> <20010815182548.U3941@gum01m.etpnet.phys.tue.nl> <20010815185005.A32239@sistina.com> <20010815191912.V3941@gum01m.etpnet.phys.tue.nl> <20010817111636.C10370@sistina.com> <20010817122326.F10580@gum01m.etpnet.phys.tue.nl>
Mime-Version: 1.0
In-Reply-To: <20010817122326.F10580@gum01m.etpnet.phys.tue.nl>; from garloff@suse.de on Fri, Aug 17, 2001 at 12:23:26PM +0200
Subject: [linux-lvm] Re: *** ANNOUNCEMENT *** LVM 1.0 available at www.sistina.com
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
To: Kurt Garloff <garloff@suse.de>
Cc: "Heinz J . Mauelshagen" <mauelshagen@sistina.com>, linux-lvm@sistina.com, lvm-devel@sistina.com, SuSE Kernel Developers <kernel@suse.de>

On Fri, Aug 17, 2001 at 12:23:26PM +0200, Kurt Garloff wrote:
> Hi Heinz,
> 
> thanks for your answer!
> 
> On Fri, Aug 17, 2001 at 11:16:36AM +0200, Heinz J . Mauelshagen wrote:
> > I just picked your e-mail standing for a couple to summarize:
> > 
> > - some people report, that the bi-directional upgrade path from
> >   <= LVM 0.9.1 Beta 7 to LVM 0.9.1 Beta 8 and beyond is fine
> 
> For individuals that are doing their installations manually, the approach
> offered by you is no serious obstacle, I think.
> 
> The problem is those relying on the distributor to handle such things and
> those are the vast majority of people. And, indeed, it's the distributor's
> job to handle the complexity involved in things as LVM.
> 
> Now, we have to offer a fail proof upgrade from all our deployed LVM
> versions for the customers. If we can't do it, we can't do the update,
> because customers just won't accept it.
> 
> Ideally, we would not need to worry, as new lvm utils and the new lvm code
> in kernel would handle old formats as well. 
> For an important piece of software that is used by a large user base, that
> would be an absolute requirement.
> 
> Now, I know that the world is not ideal, and people make mistakes.
> 
> Look at Berkeley db and guess why people more and more refrain from using it.
> reiserfs had a similar problems with on-disk format changes in the past and
> we really had to work hard with the reiser people to get it fixed. But it
> happened and we could continue recommending reiserfs, as it could be used
> without major pains.
> 
> I'm very unhappy to see that LVM has similar problems. On disk format
> changes should normally not be required, as you should use an extendable
> format that does only get new, added fields, which aren't required by old
> versions.

Exactly that's what we did.
One additional field in the PV structure.

> New versions would either fill them in automatically or be able to
> do without them, at least for a few revisions.

That 'automatically' is exactly the core of the problem.
We didn't have a solution so far but have a new idea and are
(as mentioned in my previous mail) working on one now...

Give us some time, please.

BTW: there have been a couple of user transparent automatic metadata upgrades
     already but this is the first one causing a headache ;-)

> 
> To give an example: reiserfs 3.6.x code (in kernel 2.4) can read and write
> the 3.5 on-disk format (in 2.2 SuSE kernels) without problems, so you can go
> forward and backward between 2.2 and 2.4 kernels without problems.
> If you need the new 3.6 features, you can convert by simply using a
> mount parameter and only then there's no way back.
> This is an ideal way of dealing with updating file/on-disk formats.
> 
> I hope you agree that this would be the desirable way to go.

Yes,
actually that's one major design goal in future LVM versions (I call
it virtual data layer) to address future major metadata changes wich aim
to offer enhanced reliability and redundancy.

> 
> People need to be confident that using a technology, such as reiser (or
> LVM), does not give them headaches in the future, because they can't
> upgrade any more.
> 
> So far for our concerns. I hope they are very clear now.

Yes, as mentioned before: we take those concerns seriously.
There's no bad intention or something behind *not* deploying it in the
first place.

We just weren't genious enough to find the possible solution we
hopefully have now ;-)

Regards,
Heinz    -- The LVM Guy --


> 
> Now, for some reasons, things are not so ideal.
> So we need to try to keep the damage as small as possible.
> 
> > - some people complain that there could be an easier solution
> >   and that there are just 2 cases to distinguish which could easily be covered
> >   by a better upgrade tool which is *not* true
> > 
> > As Joe stated easily and I tried to explain briefly a while ago:
> > there's multiple cases and the solution we have right now seemed to be the
> > cleanest approach to cover them all *without* hitting the trape of missing 
> > some!
> 
> Did I correctly understand him that there's no straight-forward way to
> determine the LVM on-disk version? Hard to believe ...
> You know what the next field to be added should be IMHO then, I guess?
> (In all of the file formats I've been designing recently, I put a magic
>  number to recognize the format plus a version number right at the
>  beginning.)
> 
> Now, we (SuSE) were using beta versions of LVM, as we wanted to push LVM
> development and testing on the one hand and wanted to provide the features
> for our users on the other hand.
> I would have assumed that this has been discussed with you before?
> If not, it was not such a good idea to use the beta versions.
> Maybe things also went wrong there :-(
> Hopefully this can be improved for the future then.
> 
> > Because we take your complaints seriously we are investigating, if there's a
> > well defined finite amount of cases that we actually can cover with a simple
> > tool. 
> 
> As far as I can see, there's 0.8, 0.9, 0.9.1b4 and 0.9.1b7 in widespread use
> out in the wild.
> Ideally, we could handle all of them easily. Less ideally, only a subset of
> them ...
> 
> > If so, you are going get it ;-)
> > 
> > Please stay tuned and give as some time...
> 
> Now, this sound very good. I'd be very happy if we find a solution which
> lets those people not alone that used older LVM versions relying on the
> distribution support.
> 
> I would offer you help with working on it, but as I personally do not have
> resources to do programming on LVM tools, I can't promise anything. But I'm
> optimistic some colleagues will also want to help if necessary.
> What we can and will do is testing.
> 
> > We'll keep you posted.
> > 
> > Thanks for your understanding!
> 
> Thanks for addressing our concerns!
> 
> Regards,
> -- 
> Kurt Garloff                   <kurt@garloff.de>         [Eindhoven, NL]
> Physics: Plasma simulations  <K.Garloff@Phys.TUE.NL>  [TU Eindhoven, NL]
> Linux: SCSI, Security          <garloff@suse.de>    [SuSE Nuernberg, DE]
>  (See mail header or public key servers for PGP2 and GPG public keys.)

=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-

Heinz Mauelshagen                                 Sistina Software Inc.
Senior Consultant/Developer                       Am Sonnenhang 11
                                                  56242 Marienrachdorf
                                                  Germany
Mauelshagen@Sistina.com                           +49 2626 141200
                                                       FAX 924446
=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-
