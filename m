Return-Path: <hch@ns.caldera.de>
Date: Fri, 20 Apr 2001 17:44:16 +0200
From: Christoph Hellwig <hch@ns.caldera.de>
Subject: Re: [linux-lvm] Does LVM support alternate links?
Message-ID: <20010420174416.A6137@caldera.de>
References: <Pine.LNX.4.31.0104201858090.1159-100000@dgently.hh.suse.de>
Mime-Version: 1.0
In-Reply-To: <Pine.LNX.4.31.0104201858090.1159-100000@dgently.hh.suse.de>; from bruck@suse.de on Fri, Apr 20, 2001 at 07:00:10PM +0200
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

On Fri, Apr 20, 2001 at 07:00:10PM +0200, Jens Bruckmann wrote:
> Hallo everybody,
> 
> I would like to know if the LVM supports alternate-links to the same
> physical device over two fiber-channel links, so if one link fails, LVM
> automatically uses the second link as it does under its "original" HP-UX.

LVM not, the MD-Layer does if you patch it.  Such a patch has been in
development by and been finished by ca 70% when I notices that Ingo Molnar,
the maintainer of the MD-Layer had already written such a patch which
RedHat hides in it's kernel RPM.  Download their kernel SRPM and look for
two of the thousands of patches that contain 'multipath' in their name.

	Christoph

-- 
Of course it doesn't work. We've performed a software upgrade.
