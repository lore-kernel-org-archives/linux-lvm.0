Return-Path: <thornber@btconnect.com>
Date: Tue, 24 Apr 2001 08:56:25 +0100
Subject: Re: [linux-lvm] LVM version of 2.4.2 kernel?
Message-ID: <20010424085625.B730@66bassett.freeserve.co.uk>
References: <20010423171726.A1837@66bassett.freeserve.co.uk> <Pine.LNX.4.33.0104231933220.17635-100000@duckman.distro.conectiva>
Mime-Version: 1.0
Content-Disposition: inline
In-Reply-To: <Pine.LNX.4.33.0104231933220.17635-100000@duckman.distro.conectiva>; from riel@conectiva.com.br on Mon, Apr 23, 2001 at 07:34:21PM -0300
From: Joe Thornber <thornber@btconnect.com>
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

On Mon, Apr 23, 2001 at 07:34:21PM -0300, Rik van Riel wrote:
> On Mon, 23 Apr 2001, Joe Thornber wrote:
> > On Mon, Apr 23, 2001 at 04:13:32PM +0200, David Vidal Rodriguez wrote:
> > > Hi!
> > > I want to know what version of LVM (beta_x etc.) is included within
> > > Kernel 2.4.2 and if I can use the fresh compiled beta7 tools with it.
> >
> > Beta2 is in the 2.4.2 kernel.  You are advised to upgrade both the
> > kernel and the userland tools to beta7.
> 
> Ummm ?
> 
> Weren't you people saying that the Linus tree would be the
> main LVM repository from now on?

Yes, we did.  I am working on it, as you would know if you read my
posts to the mailing list (I cross posted to your mailing list as
well).  It's going to take time to merge the patches together into a
form that is suitable for Alan and Linus, I'm sorry I'm not going fast
enough for you.  Work in progress is available for people to comment on.

The fact remains however that 2.4.3 contains equivalent code to Beta
level 2 (+ a couple of tidy ups from Andrea Arcangeli), and beta7 is
the version of the code that I would recommend people use - this
includes the user land tools, for which we will continue to use CVS as
the main repository.

> Would it be possible to get at least the important bugfixes
> merged in Linus' kernel ?

Of course, I hope to send a patch set to Alan at the end of Wednesday.

- Joe
