Return-Path: <patrick@tykepenguin.cix.co.uk>
Date: Mon, 29 Jan 2001 13:57:16 +0000
From: Patrick Caulfield <caulfield@sistina.com>
Subject: Re: [linux-lvm] configuration question
Message-ID: <20010129135716.B511@tykepenguin.com>
References: <3A7235A2.C515ED1C@wrkhors.com>
Mime-Version: 1.0
Content-Disposition: inline
In-Reply-To: <3A7235A2.C515ED1C@wrkhors.com>; from lembark@wrkhors.com on Fri, Jan 26, 2001 at 08:42:42PM -0600
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

On Fri, Jan 26, 2001 at 08:42:42PM -0600, Steven Lembark wrote:
> 
> trying to get vg's out of dev for now -- devfs issues.
> 
> so i modify ./kernel/lvm.h replacing:
> 
> 	#define LVM_DIR_PREFIX  "/dev/"
> 
> with 
> 	#define LVM_DIR_PREFIX  "/lvm/"
> 
> then configure and compile the code.
> 
> probem is that this doesn't seem to purge /dev/ from
> all of the code.  is there some other location where
> the lvm directory is defined or is this just a 
> configuration bug [perhaps a known one at that]?

It looks like there are few hardcoded /dev strings elsewhere
in the code. try a grep down the lib directory and change 
those too. I'll fix this in CVS.

patrick
