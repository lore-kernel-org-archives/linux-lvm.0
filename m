Return-Path: <patrick@tykepenguin.cix.co.uk>
Date: Thu, 1 Mar 2001 16:11:54 +0000
From: Patrick Caulfield <caulfield@sistina.com>
Subject: Re: [linux-lvm] Final request for bug fixes!
Message-ID: <20010301161154.D499@tykepenguin.com>
References: <20010228214605.C9035@srv.sistina.com> <15006.26023.811857.180115@winux.com> <20010301162034.B12001@sistina.com>
Mime-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20010301162034.B12001@sistina.com>; from Mauelshagen@sistina.com on Thu, Mar 01, 2001 at 04:20:34PM +0000
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

On Thu, Mar 01, 2001 at 04:20:34PM +0000, Heinz J. Mauelshagen wrote:
> On Thu, Mar 01, 2001 at 10:07:19AM -0500, lvm@winux.com wrote:
> > Heinz J. Mauelshagen writes:
> > > From: "Heinz J. Mauelshagen" <Mauelshagen@sistina.com>
> > > Sender: linux-lvm-admin@sistina.com
> > > To: linux-lvm@sistina.com
> > > Subject: [linux-lvm] Final request for bug fixes!
> > > Date: Wed, 28 Feb 2001 21:46:05 +0000
> > > 
> > > 
> > > Hi all,
> > > 
> > > because we are about to release LVM 0.9.1 Beta 6 on friday,
> > > please send us your LVM bug fixes to be included in that release *now*.
> > > 
> > > Thanks a lot for your support of LVM! :-)
> > 
> > Did anyone ever look at the "Oops" I reported last week?
> > It seems to be easily reproducible.
> 
> You are talking about the reiserfs related "journal-1777" oops here?
> I am not able to reproduce it here at all.
> 
> AJ, Joe, Patrick: are you able too?
> 

Hmm, oopses for me. looks to be in wait queues...ugh!

patrick
