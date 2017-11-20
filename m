Date: Mon, 20 Nov 2017 10:10:07 -0600
From: David Teigland <teigland@redhat.com>
Message-ID: <20171120161007.GA29888@redhat.com>
References: <dc362b54-42cf-025d-ec3a-22e14abc4745@suse.com>
MIME-Version: 1.0
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <dc362b54-42cf-025d-ec3a-22e14abc4745@suse.com>
Subject: Re: [linux-lvm] lvmlockd: how to convert lock_type from sanlock to
	dlm?
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
Content-Type: text/plain; charset="utf-8"
To: Eric Ren <zren@suse.com>
Cc: LVM general discussion and development <linux-lvm@redhat.com>

On Mon, Nov 20, 2017 at 06:35:20PM +0800, Eric Ren wrote:
> On my testing cluster,� the lvmlockd was firstly used with sanlock and
> everything was OK.  After some play, I want to change the "sanlock"
> lock_type of a VG into "dlm" locktype.

> # vgchange --lock-type none --force vg1������ // the cmd comes from `man lvmlockd`
> Command does not accept option: --force.

First you'll need this recent fix:
https://sourceware.org/git/?p=lvm2.git;a=commitdiff;h=f611b68f3c02b9af2521d7ea61061af3709fe87c

--force was broken at some point, and the option is now --lockopt force.

To change between lock types, you are supposed to be able to change to a
local VG, then from local to the other lock type.  The man page sections:

  changing a lockd VG to a local VG
  changing a local VG to a lockd VG

But it looks like a fix is needed in those instructions.  I believe
"vgchange --lock-type none <vgname>" needs to include --lockopt force.
If you could verify this for me, I'll update the man page.
Thanks
Dave
