Subject: Re: [linux-lvm] 2.2.13ac5 with LVM
References: <Pine.LNX.4.33.0110221458580.12322-100000@home.apu.edu>
From: Jason L Tibbitts III <tibbs@math.uh.edu>
In-Reply-To: Patrick McCarty's message of "Mon, 22 Oct 2001 15:04:31 -0700 (PDT)"
Message-ID: <ufaelnvb9ox.fsf@epithumia.math.uh.edu>
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
Date: Mon Oct 22 17:17:02 2001
List-Id: <linux-lvm.redhat.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: linux-lvm@sistina.com

>>>>> "PM" == Patrick McCarty <mccartyp@apu.edu> writes:

PM> I've been struggling to compile LVM rc4, and CVS against it, but fail
PM> due to the kiovec issue.

I'm running 2.4.12-ac3 and 2.4.12-ac5 with LVM 1.0.1rc4; I can ship you a
patch if you like.  (I just fixed the kiovec and gendisk issues by hand.)

PM> What would be the most stable configuration of LVM/ext3/quotas?

Tough to say.  Recent ac patches are nice because ext3 is completely
updated (including the large directory speedup patch).  There are a couple
of compilation problems with ac5 that only bite if you have the right
combination of settings.

I can't comment on quotas.

 - J<
