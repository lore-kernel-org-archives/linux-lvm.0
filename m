Date: Tue, 9 Oct 2001 01:25:47 +0100 (IST)
From: Paul Jakma <paul@clubi.ie>
Subject: Re: [linux-lvm] More Segfaults with LVM 1.0.1rc3
In-Reply-To: <20011008120338.B18314@sistina.com>
Message-ID: <Pine.LNX.4.33.0110090123200.11852-100000@fogarty.jakma.org>
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
List-Id: <linux-lvm.redhat.com>
Content-Type: TEXT/PLAIN; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: linux-lvm@sistina.com

On Mon, 8 Oct 2001, Heinz J . Mauelshagen wrote:

> Well, our impression is that optimizing under gcc > 2.95.2 doesn't seem
> to be a good idea.

have you pinned it down to a specific bug in gcc, or is it based on 
"doesn't happen with -O0"?

curious... the segv i had showed a stack trace with no obvious 
correspondent path in the lvcreate.c code. FWIW, after a glibc 
upgrade and reboot lvcreate started working again.

??? weird..

regards,
-- 
Paul Jakma	paul@clubi.ie	paul@jakma.org	Key ID: 64A2FF6A
Fortune:
What is algebra, exactly?  Is it one of those three-cornered things?
		-- J.M. Barrie
