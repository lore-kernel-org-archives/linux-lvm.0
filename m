Return-Path: <patrick@tykepenguin.cix.co.uk>
Date: Thu, 29 Mar 2001 15:21:32 +0100
From: Patrick Caulfield <caulfield@sistina.com>
Subject: Re: [linux-lvm] safe to ru-run vgscan after mounting LV root?
Message-ID: <20010329152132.B19110@tykepenguin.com>
References: <20010327161517.G993@tykepenguin.com> <Pine.LNX.4.30.0103271059250.25693-100000@bongo.fms.indiana.edu> <20010329163815.A30619@mail.wave.co.nz>
Mime-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20010329163815.A30619@mail.wave.co.nz>; from markv@wave.co.nz on Thu, Mar 29, 2001 at 04:38:16PM +1200
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

On Thu, Mar 29, 2001 at 04:38:16PM +1200, Mark van Walraven wrote:
> On Tue, 27 Mar 2001, Patrick Caulfield wrote:
> > You can run vgscan as many times as you like. The main reason you wouldn't is
> > the time it can take. But even that is small compared to the initialisation time
> 
> Thanks for the feedback.  That's what I figured, but ...
> 
> On Tue, Mar 27, 2001 at 11:01:50AM -0500, Jay Sissom wrote:
> > Just a warning.  When I run vgscan on my system, it deletes my LV.  I
> > still don't know why.  There seems to be a terrible bug in vgscan.
> 
> ... this worries me.
> 
> Could anyone else comment on this, please?  Is Jay's problem bizzare
> and irreproducable, or is there possibly a problem with replacing the
> lvmtab files from beneath the noses of the other tools?

I've never had vgscan do that to me, though I'm not denying that it happens.
There certainly have been some odd vgscan reports on the list over the last few
months. Most of them seem to be from systems that have been upgraded from 0.8 I
don't know if it is true in this case.

There is no fundamental problem with replacing the lvmtab files under the noses
of other tools because the LVM locking takes care of that. If stuff is getting
corrupted then it's a bug of course.

patrick
