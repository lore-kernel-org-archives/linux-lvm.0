Return-Path: <patrick@tykepenguin.cix.co.uk>
Date: Fri, 3 Aug 2001 09:14:03 +0100
From: Patrick Caulfield <caulfield@sistina.com>
Subject: Re: [linux-lvm] pb mounting reiserfs snapshot LV
Message-ID: <20010803091403.A1549@tykepenguin.com>
References: <3B67C4E5.3FADCA6B@atix.de>
Mime-Version: 1.0
Content-Disposition: inline
In-Reply-To: <3B67C4E5.3FADCA6B@atix.de>; from julien@atix.de on Wed, Aug 01, 2001 at 10:59:17AM +0200
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

On Wed, Aug 01, 2001 at 10:59:17AM +0200, Julien Baboud wrote:
> hi,
> 
>  i recently have recompiled a 2.4.5 linux kernel with the lvm 0.9.1
> beta8 tools into it (ie not as a module),
>  and have applied the patches that enables taking ReiserFS Snapshot.
> 
>  I've encountered a problem :
> 
>  when i create a LV with a reiser FS on it, and then take a snapshot of
> this LV, i'm not able to mount the Snap;
>  but if i mount the LV to be snaped before taking a snapshot of it, all
> is right, i can mount the Snap.
> 
>  This pb doesn't appear with ext2 FS.
>  Is it a bug a the lvm/reiser tools ? Have some people yet have the same
> pb as me ?

Have you applied the linux-2.4.4-VFS-lock.patch ?

patrick
