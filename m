Return-Path: <patrick@tykepenguin.cix.co.uk>
Date: Wed, 25 Apr 2001 16:07:22 +0100
From: Patrick Caulfield <caulfield@sistina.com>
Subject: Re: [linux-lvm] K=2.4.3 - LVM0.9.1.B7 compiling problem.
Message-ID: <20010425160722.H1711@tykepenguin.com>
References: <01042412353404.07748@pc-silva> <20010424104505.F9882@sistina.com> <01042413111705.07748@pc-silva> <20010425153007.G1711@tykepenguin.com> <20010425154413.A1805@66bassett.freeserve.co.uk>
Mime-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20010425154413.A1805@66bassett.freeserve.co.uk>; from thornber@btconnect.com on Wed, Apr 25, 2001 at 03:44:13PM +0100
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

On Wed, Apr 25, 2001 at 03:44:13PM +0100, Joe Thornber wrote:
> >  
> >  #define lvm_fatal(x...) do {\
> >    plog(LOG_FATAL, __FILE__, __LINE__, "(FATAL) " ## x); \
> > 
> 
> If this is the right fix (time for me to download gcc 3.0) why haven't you
> changed lvm_fatal and plog ?  Does this still do the right thing under older
> versions of gcc ?

lvm_fatal I missed! plog should not be changed because the ## is needed to get
rid of the trailing comma in the instance that there is nothing in a.

It is the right fix, it only worked on older gcc because it was lenient about
the problem. ## gets rid of whitespace characters so what was happening was that
the two quoted strings were abutted eg

"error:""there was an error" - not legal C
"error:" "there was an error" - is legal C

I'll fix lvm_fatal; the only reason it fell through was that it does not get
used!

patrick
