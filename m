From: Alasdair G Kergon <agk@uk.sistina.com>
Subject: Re: [linux-lvm] Snapshot creating problem
Message-ID: <20030317222737.E15374@uk.sistina.com>
References: <08628CA53C6CBA4ABAFB9E808A5214CB0142B4B9@mercury.infiniconsys.com>
Mime-Version: 1.0
Content-Disposition: inline
In-Reply-To: <08628CA53C6CBA4ABAFB9E808A5214CB0142B4B9@mercury.infiniconsys.com>; from cbarry@infiniconsys.com on Mon, Mar 17, 2003 at 04:57:05PM -0500
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
Date: Mon Mar 17 16:28:01 2003
List-Id: <linux-lvm.redhat.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: linux-lvm@sistina.com

On Mon, Mar 17, 2003 at 04:57:05PM -0500, Barry, Christopher wrote:
> It's odd, I pulled down the 'device-mapper-latest.tgz' from the sistina ftp site

That isn't odd at all.  That version does not contain the bug I mentioned
and I'm not yet aware of a bug in it that could cause the symptoms you
reported, so the best thing to do next is to produce the LVM2 debugging 
output (leaving your kernel alone).

> Can you please point to to the 'best' patch, and I'll just start all over.
You could try the newer patches in:
  http://people.sistina.com/~thornber/patches/2.4-stable/2.4.20/2.4.20-dm-9
 
Alasdair
-- 
agk@uk.sistina.com
