Message-ID: <1363117923.24725.242.camel@code.and.org>
From: James Antill <james@fedoraproject.org>
Date: Tue, 12 Mar 2013 15:52:03 -0400
In-Reply-To: <20130312180924.GA14883@redhat.com>
References: <1362932290-28679-1-git-send-email-msnitzer@fedoraproject.org>
	<1363037150-8757-1-git-send-email-msnitzer@fedoraproject.org>
	<1363037150-8757-2-git-send-email-msnitzer@fedoraproject.org>
	<1363095972.24725.231.camel@code.and.org>
	<20130312144129.GA13459@redhat.com>
	<1363106460.24725.236.camel@code.and.org>
	<20130312180924.GA14883@redhat.com>
Mime-Version: 1.0
Sender: James Antill <james@mail.and.org>
Content-Transfer-Encoding: 8bit
Subject: Re: [linux-lvm] [Yum-devel] [PATCH 4/2] fs snapshot plugin: add LVM
 tag to allow tools to link pre and post snapshots
Reply-To: LVM general discussion and development <linux-lvm@redhat.com>
List-Id: LVM general discussion and development <linux-lvm.redhat.com>
List-Unsubscribe: <https://www.redhat.com/mailman/options/linux-lvm>,
	<mailto:linux-lvm-request@redhat.com?subject=unsubscribe>
List-Archive: <https://www.redhat.com/archives/linux-lvm>
List-Post: <mailto:linux-lvm@redhat.com>
List-Help: <mailto:linux-lvm-request@redhat.com?subject=help>
List-Subscribe: <https://www.redhat.com/mailman/listinfo/linux-lvm>,
	<mailto:linux-lvm-request@redhat.com?subject=subscribe>
List-Id: <linux-lvm.redhat.com>
Content-Type: text/plain; charset="us-ascii"
To: Mike Snitzer <msnitzer@fedoraproject.org>
Cc: okozina@fedoraproject.org, yum-devel@lists.baseurl.org, linux-lvm@redhat.com

On Tue, 2013-03-12 at 14:09 -0400, Mike Snitzer wrote:
> On Tue, Mar 12 2013 at 12:41pm -0400,
> James Antill <james@fedoraproject.org> wrote:
> >  Using globals should work, the only real problem is if some python API
> > creates multiple YumBase() instances (but although we've worried about
> > that, nothing has ever really done it AFAIK).
> 
> Just adding a single global caused the plugin to fail: global foo = None

 That's a syntax error, python is much more annoying about globals than
perl (or pretty much any other language :).
 Also note that you can pass "-d 9" (maybe even just -v) to yum get the
traceback from plugins, we suppress them on load, by default, as that's
much better for users.

> abs(hash(tsInfo)) should be sufficiently unique when coupled with
> futureRpmDBVersion().

 Probably, I was just worried that in some cases it might have similar
addresses (given it's doing mostly the same work each time, without some
kind of memory randomization it might well be at an identical memory
address).

>   But yeah, I didn't know how to store the timestamp.
> 
> I'll send a simpler v3 now.. thanks for your help!

 Looks fine, I've pushed it and built it in rawhide (on F19 branch too).
