From: "Stephen C. Tweedie" <sct@redhat.com>
Subject: Re: [linux-lvm] Error compilng tools on RH7.3
Message-ID: <20020513145236.B6399@redhat.com>
References: <43D959D3-58FC-11D6-9EF4-000393452E7E@jvm.de> <20020426153434.A21305@sistina.com> <20020426162737.A26542@omnifarious.org>
Mime-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20020426162737.A26542@omnifarious.org>; from hopper@omnifarious.org on Fri, Apr 26, 2002 at 04:27:37PM -0500
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
Date: Mon May 13 08:51:04 2002
List-Id: <linux-lvm.redhat.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: linux-lvm@sistina.com
Cc: Stephen Tweedie <sct@redhat.com>

Hi,

On Fri, Apr 26, 2002 at 04:27:37PM -0500, Eric M. Hopper wrote:
 
> 	BTW, does anybody know which version of LVM made it into the RH
> 2.4.18-0.13 kernel?

Essentially LVM1 release 1.0.3.  It's actually the mainline 2.4.18
code, patched with all of the relevant bug-fixes from the 1.0.3
release, plus a new implementation of the "pvmove" functionality as
the existing LVM pvmove was hopelessly broken (in terms of
deadlocking, corrupting data etc.)  (The patches for the pvmove fix
were posted here a couple of
months ago.)

Cheers,
 Stephen
