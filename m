From: Goetz Bock <bock@blacknet.de>
Subject: Re: [linux-lvm] Shutdown questions
Message-Id: <20020422023605.A12545@golem.blacknet.de>
References: <20020421232307.91353.qmail@web14602.mail.yahoo.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20020421232307.91353.qmail@web14602.mail.yahoo.com>;
    from anoland@yahoo.com on Sun, Apr 21, 2002 at 04:23:07PM -0700
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
Date: Sun Apr 21 19:35:02 2002
List-Id: <linux-lvm.redhat.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: linux-lvm@sistina.com

On Sun, Apr 21 '02 at 16:23, Adrian Noland wrote:
> I'm curious about what happens when the system is shut down (or
> crashes) without deactivating LVM. How come you have to "manually"
> deactivate it? What kind of recovery attempt is made when this happens.
> What kind of problems does this cause when the system comes back up?
You don't have to, I never do. But if you do not deactivate LVM (more
specific the LVs) the lower layer might complain about beeing still
required by LVM and you will not be able to activate it (e.g. LVM over
MD), but I cant say wether this will cause any problems when doing a
normal shutdown.
LVM does not need the deactivation, and there are no recovery attemps
required.

Cu,
    Goetz.
