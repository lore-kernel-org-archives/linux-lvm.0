Message-Id: <200308132014.h7DKEXo14381@mail.osdl.org>
From: markw@osdl.org
Subject: Re: [linux-lvm] compiling lvm2.2.00.05 w/ linux-2.6.0-test3
In-Reply-To: <1060731870.9126.2.camel@chtephan.cs.pocnet.net>
MIME-Version: 1.0
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
Date: Wed Aug 13 15:15:02 2003
List-Id: <linux-lvm.redhat.com>
Content-Type: TEXT/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: christophe@saout.de
Cc: linux-lvm@sistina.com

On 13 Aug, Christophe Saout wrote:
> Am Mi, 2003-08-13 um 01.30 schrieb markw@osdl.org:
> 
>> Hello, I'm having a little problem building the lvm2 tools.  I'm
>> starting with a RedHat 8.0 distro, built the 2.6.0-test3 kernel with
>> CONFIG_BLK_DEV_DM=y and CONFIG_DM_IOCTL_V4=y, built and installed
>> device-mapper 1.00.02.  Then I created a simlink from /usr/include/linux
>> to the 2.6.0-test3 include/linux directory.  When I try to build the
>> lvm2 2.00.05 tools, I get the following errors:
> 
> Symlinking isn't allowed anymore with the 2.6 kernel. In most cases it
> will fail with missing references to asm or asm-generic or tell that you
> aren't allowed to include kernel headers from userspace.
> 
> Please use the header files that come with your distro. Or link
> /usr/include/linux and /usr/include/asmm to the include/linux and
> include/asm directory from a 2.4 kernel (or copy the include files).

Aha, thanks!

Mark
