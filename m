Return-Path: <jsissom@indiana.edu>
Date: Thu, 29 Mar 2001 09:46:01 -0500 (EST)
From: Jay Sissom <jsissom@indiana.edu>
Subject: Re: [linux-lvm] safe to ru-run vgscan after mounting LV root?
In-Reply-To: <01032907340001.12064@oscar>
Message-ID: <Pine.LNX.4.30.0103290944140.29639-100000@bongo.fms.indiana.edu>
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

Nope, I am running kernel 2.4.2 with the beta6 patch and the beta6
utilities.

This started after I resized a LV.  The answer from this list was, "don't
run vgscan".  Now people on the list say you can run it as many times as
you like.  If I run it once, all my LV's are gone.  I'd like to figure out
what the problem is, but don't know where to start looking.

On Thu, 29 Mar 2001, Ed Tomlinson wrote:

> On Wednesday 28 March 2001 23:38, you wrote:
> > On Tue, 27 Mar 2001, Patrick Caulfield wrote:
> > > You can run vgscan as many times as you like. The main reason you
> > > wouldn't is the time it can take. But even that is small compared to the
> > > initialisation time
> >
> > Thanks for the feedback.  That's what I figured, but ...
> >
> > On Tue, Mar 27, 2001 at 11:01:50AM -0500, Jay Sissom wrote:
> > > Just a warning.  When I run vgscan on my system, it deletes my LV.  I
> > > still don't know why.  There seems to be a terrible bug in vgscan.
>
> What release of the utilities/patch?  I had this problem with beta2, which
> is what ships with the kernel.  Upgrading to beta6 fixed it _here_.
>
> > ... this worries me.
>
> Me too...  Here hoping that beta6 is the answer.
>
> > Could anyone else comment on this, please?  Is Jay's problem bizzare
> > and irreproducable, or is there possibly a problem with replacing the
> > lvmtab files from beneath the noses of the other tools?
>
> Ed Tomlinson
> _______________________________________________
> linux-lvm mailing list
> linux-lvm@sistina.com
> http://lists.sistina.com/mailman/listinfo/linux-lvm
>
