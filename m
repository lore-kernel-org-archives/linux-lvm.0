Return-Path: <patrick@tykepenguin.cix.co.uk>
Date: Mon, 19 Mar 2001 13:33:52 +0000
From: Patrick Caulfield <caulfield@sistina.com>
Subject: Re: [linux-lvm] LVM 0.9.1 Beta 6, lockup during pvmove
Message-ID: <20010319133352.D569@tykepenguin.com>
References: <20010317183125.A12980@guldukat.muon>
Mime-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20010317183125.A12980@guldukat.muon>; from nils@muon.de on Sat, Mar 17, 2001 at 06:31:25PM +0100
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

On Sat, Mar 17, 2001 at 06:31:25PM +0100, Nils Juergens wrote:
> 
> Using strace on cp, i find that it locks up during another read (
> the last thing strace prints is "read(3,", where 3 was opened readonly
> on the NFS mount), so this may be independent of lvm, but i was unable
> to lock my box up without lvm.
> 
> I would really like to track this down, but my knowledge is rather
> limited so any help is appreciated.

It doesn't seem to be NFS related, I can reproduce it with purely local I/O. It
looks to be the new locking that went in to beta6 to fix some races.


patrick
