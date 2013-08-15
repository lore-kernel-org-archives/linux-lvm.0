Message-ID: <520C8B8B.6050005@redhat.com>
Date: Thu, 15 Aug 2013 10:04:27 +0200
From: Peter Rajnoha <prajnoha@redhat.com>
MIME-Version: 1.0
References: <x6zjski0cz.fsf@midna.lan>
In-Reply-To: <x6zjski0cz.fsf@midna.lan>
Content-Transfer-Encoding: 7bit
Subject: Re: [linux-lvm] [PATCH] Use LVM_PATH instead of hard-coded
	/usr/sbin/lvm
Reply-To: LVM general discussion and development <linux-lvm@redhat.com>
List-Id: LVM general discussion and development <linux-lvm.redhat.com>
List-Unsubscribe: <https://www.redhat.com/mailman/options/linux-lvm>,
	<mailto:linux-lvm-request@redhat.com?subject=unsubscribe>
List-Archive: <https://www.redhat.com/archives/linux-lvm>
List-Post: <mailto:linux-lvm@redhat.com>
List-Help: <mailto:linux-lvm-request@redhat.com?subject=help>
List-Subscribe: <https://www.redhat.com/mailman/listinfo/linux-lvm>,
	<mailto:linux-lvm-request@redhat.com?subject=subscribe>
List-Id: <linux-lvm.redhat.com>
Content-Type: text/plain; charset="us-ascii"
To: LVM general discussion and development <linux-lvm@redhat.com>
Cc: Michael Stapelberg <stapelberg@debian.org>

On 08/14/2013 08:38 PM, Michael Stapelberg wrote:
> I noticed that the systemd generator hardcodes /usr/sbin/lvm.
> 
> Attached you can find a patch which fixes the issue. Please merge it or
> fix the issue in a different way if you prefer :). Thanks!

I've just changed the #include "lib.h" to #include "configure.h" which
is sufficient here. Upstream now:

https://git.fedorahosted.org/cgit/lvm2.git/commit/?id=8cbbe851a80e8d99dc886ce9b44834137731d8ce

Thanks for the patch.

Peter
