Return-Path: <tomlins@cam.org>
From: Ed Tomlinson <tomlins@cam.org>
Subject: Re: [linux-lvm] safe to ru-run vgscan after mounting LV root?
Date: Thu, 29 Mar 2001 07:34:00 -0500
References: <20010327161517.G993@tykepenguin.com> <Pine.LNX.4.30.0103271059250.25693-100000@bongo.fms.indiana.edu> <20010329163815.A30619@mail.wave.co.nz>
In-Reply-To: <20010329163815.A30619@mail.wave.co.nz>
MIME-Version: 1.0
Message-Id: <01032907340001.12064@oscar>
Content-Transfer-Encoding: 8bit
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
To: linux-lvm@sistina.com

On Wednesday 28 March 2001 23:38, you wrote:
> On Tue, 27 Mar 2001, Patrick Caulfield wrote:
> > You can run vgscan as many times as you like. The main reason you
> > wouldn't is the time it can take. But even that is small compared to the
> > initialisation time
>
> Thanks for the feedback.  That's what I figured, but ...
>
> On Tue, Mar 27, 2001 at 11:01:50AM -0500, Jay Sissom wrote:
> > Just a warning.  When I run vgscan on my system, it deletes my LV.  I
> > still don't know why.  There seems to be a terrible bug in vgscan.

What release of the utilities/patch?  I had this problem with beta2, which
is what ships with the kernel.  Upgrading to beta6 fixed it _here_.

> ... this worries me.

Me too...  Here hoping that beta6 is the answer.

> Could anyone else comment on this, please?  Is Jay's problem bizzare
> and irreproducable, or is there possibly a problem with replacing the
> lvmtab files from beneath the noses of the other tools?

Ed Tomlinson
