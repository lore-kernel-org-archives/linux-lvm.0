Subject: Re: [linux-lvm] Automatic snapshot system?
References: <ufasnayrr4e.fsf@epithumia.math.uh.edu>
	<20011129004736.A14092@auctionwatch.com>
	<ufa667ts3zh.fsf@epithumia.math.uh.edu>
	<20011130082244.A379@btconnect.com>
From: Jason L Tibbitts III <tibbs@math.uh.edu>
In-Reply-To: Joe Thornber's message of "Fri, 30 Nov 2001 08:22:44 +0000"
Message-ID: <ufa1yige1hm.fsf@epithumia.math.uh.edu>
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
Date: Fri Nov 30 09:11:02 2001
List-Id: <linux-lvm.redhat.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: linux-lvm@sistina.com

>>>>> "JT" == Joe Thornber <thornber@btconnect.com> writes:

JT> It's a nice idea, but with the current implementation there's no
JT> way I'd want 100 snapshots of the same origin hanging around.

They wouldn't all be of the same LV, fortunately; I split my VG up
into lots of manageable chunks.  (Large users get a volume to
themselves, small users get grouped into various user volumes.)  But
still, I assume that you have some details of performance with the
current snapshot implementation.  Is it that bad?

 - J<
