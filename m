Return-Path: <mason@suse.com>
Date: Wed, 21 Feb 2001 10:34:33 -0500
From: Chris Mason <mason@suse.com>
Subject: Re: [linux-lvm] snapshot of Reiserfs
Message-ID: <2090960000.982769673@tiny>
In-Reply-To: <20010221141119.I568@tykepenguin.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline
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


On Wednesday, February 21, 2001 02:11:20 PM +0000 Patrick Caulfield
<caulfield@sistina.com> wrote:

[ non-intuitive snapshot patches for reiserfs ]
>  
>> In fact, why are these separate patches?  Shouldn't they
>> eventually be "the standard" and find their way into the
>> stock kernel?  It's arguably the correct behavior.
> 
> That is the intension. The patch is Chris Mason's and I beleive
> he is trying to get it into the kernel. Heinz emailed him about
> it recently, I don't know if he has had any reply yet.
> 

We can probably talk Alan into putting it in the ac series, but I'm not
expecting Linus to take it yet.  I'll send it along for 2.4.3preX though
(once 2.4.2 comes out), maybe we'll get lucky ;-)

Do you want the patch I send to turn on the VFS_ENHANCEMENT #define in
lvm.c?

-chris
