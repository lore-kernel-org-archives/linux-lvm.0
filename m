From: Patrick Caulfield <caulfield@sistina.com>
Subject: Re: [linux-lvm] LVM2 for kernels 2.4.20(another problem raid-0)
Message-ID: <20030127111301.GD1698@tykepenguin.com>
References: <1043622448.3e346a3057b43@secure.st-peter.stw.uni-erlangen.de>
Mime-Version: 1.0
Content-Disposition: inline
In-Reply-To: <1043622448.3e346a3057b43@secure.st-peter.stw.uni-erlangen.de>
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
Date: Mon Jan 27 05:13:01 2003
List-Id: <linux-lvm.redhat.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: linux-lvm@sistina.com

On Mon, Jan 27, 2003 at 12:07:28AM +0100, Svetoslav Slavtchev wrote:
> Hi just an intermidiate report,
> cause it's with 2.4.20-dm-2
> (i'm rebuilding now with dm-7)
> 
> when i try to mount a xfs filesystem wich is on 
> lv over soft raid-0, i'm getting just like in
> 2.5.2x - 2.5.4x (i didn't try later kernels) :
> 
> ############################
> raid0_make_request bug: can't convert block across chunks or bigger than 16k
> 25181311 4
> raid0_make_request bug: can't convert block across chunks or bigger than 16k
> 25181343 4
> ############################
> 
> is this know problem, is it fixed ?
> i thought that the problem exist only in 2.5 kernel

I seem to remember that there's some option you have to give to XFS to tell it
to align the journal or something. you may have to search the LVM and/or XFS
archives for it.

Sorry that's a bit vague but I don't use XFS but I do remember a thread like
this some time ago.
-- 

patrick
