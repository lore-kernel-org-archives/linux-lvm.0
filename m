Return-Path: <juergens@muon.de>
Date: Mon, 19 Mar 2001 20:10:39 +0100
From: Nils Juergens <nils@muon.de>
Subject: Re: [linux-lvm] LVM 0.9.1 Beta 6, lockup during pvmove
Message-ID: <20010319201039.A10773@guldukat.muon>
References: <20010317183125.A12980@guldukat.muon> <20010319133352.D569@tykepenguin.com>
Mime-Version: 1.0
In-Reply-To: <20010319133352.D569@tykepenguin.com>; from caulfield@sistina.com on Mon, Mar 19, 2001 at 01:33:52PM +0000
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

On Mon, 19.03.01, Patrick Caulfield <caulfield@sistina.com> wrote:
> 
> It doesn't seem to be NFS related, I can reproduce it with purely local I/O. It
> looks to be the new locking that went in to beta6 to fix some races.
> 

I just tried the same with beta5 and beta4 with similar results, but
(at least sometimes) locking up at write instead of read, so it seems
this bug was present before beta6.

Tell me if you want me to do some more testing :)

cu,

Nils

-- 
 >   Nils Juergens  | nils@muon.de | icq 7090774   <
 >  If we all work hard, we can turn this company  <
 >      around 360 degrees -- gruntbert(LOTD)      <
