Return-Path: <thornber@btconnect.com>
Date: Fri, 17 Aug 2001 10:28:59 +0100
Subject: Re: [linux-lvm] [PATCH] LVM 1.0 & Linux 2.4.9
Message-ID: <20010817102859.B450@btconnect.com>
References: <Pine.LNX.4.33.0108162238310.5208-100000@greebo.foobarhouse.com>
Mime-Version: 1.0
Content-Disposition: inline
In-Reply-To: <Pine.LNX.4.33.0108162238310.5208-100000@greebo.foobarhouse.com>; from jamesp@foobarhouse.com on Thu, Aug 16, 2001 at 10:40:52PM +0100
From: Joe Thornber <thornber@btconnect.com>
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

On Thu, Aug 16, 2001 at 10:40:52PM +0100, James Pattinson wrote:
> Hi!
> 
> Another day, another kernel to compile! But after applying LVM 1.0 to
> 2.4.9 this evening, I found it didn't compile. It's to do with a mismatch
> between the max and min macros in the kernel and in LVM. Here's a patch to
> make things work:

Thanks, will update cvs.

- Joe
