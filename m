Date: Tue, 09 Oct 2001 15:48:00 -0400
From: Chris Mason <mason@suse.com>
Subject: Re: [linux-lvm] rc4 can't take snaphots of 0.9.1_beta7 lvs
Message-ID: <536570000.1002656880@tiny>
In-Reply-To: <20011009203031.B1034@btconnect.com>
References: <387040000.1002641567@tiny> <20011009165801.B851@btconnect.com>
 <407510000.1002645036@tiny> <20011009203031.B1034@btconnect.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline
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
To: linux-lvm@sistina.com


On Tuesday, October 09, 2001 08:30:31 PM +0100 Joe Thornber
<thornber@btconnect.com> wrote:

>> Well, it worked in beta7
> 
> did it ?  It may not have segfaulted, but did you check the data
> really carefully ?  After all it took a while for anyone to realise the
> problem existed.

Perhaps I just got really lucky when testing beta7 and didn't end up with
any unaligned lvs.  Regardless, we should be able to make new snapshots of
those volumes now.  I'm less worried about supporting existing unaligned
snapshots.

So, I'm trying some things, I'll either post patches or beg for help 
later ;-)

-chris
